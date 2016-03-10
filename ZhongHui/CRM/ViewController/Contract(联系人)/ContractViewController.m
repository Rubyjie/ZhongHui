//
//  ContractViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ContractViewController.h"
//#import "ContractPlanController.h" //添加拜访计划
#import "ContactResultController.h"  //联络结果
#import "AddContractController.h"    //添加联系人
#import "VisitPlanViewController.h"  //联系人下边的拜访计划
#import "ContractSearchController.h" //联系人搜索
#import "MainConViewController.h"    //联系人详情的主VC
#import "ContractDeailsController.h" //联系人详情
#import "ChangeConController.h"      //修改联系人


#import "YCSearchBar.h"

#import "ContractCell.h"

#import "AFNetworking.h"
#import "UserDefault.h"
#import "MJRefresh.h"
#import "MJRefreshConst.h"

#import "contractBaseClass.h"
#import "contractData.h"
#import "contractDatalist.h"



@interface ContractViewController () <UITableViewDataSource, UITableViewDelegate,ContractCellDelegate,UITextFieldDelegate,ContractSearchDelegate>

{
    __block NSInteger pages;
    __block NSInteger allPage;
    
    BOOL isAllContract;
    
}

@property (nonatomic, strong) UITableView *contractTable;
@property (nonatomic, strong) NSString *contractId;
@property (nonatomic, strong) NSString *contractName;

@property (nonatomic, strong) NSMutableArray *contractArray;

#pragma mark - 客户下的联系人的数组
@property (nonatomic, strong) NSMutableArray *cusNameConNameArray;

#pragma mark - 线索下联系人的数组
@property (nonatomic, strong) NSMutableArray *cluConNameArray;


@end

@implementation ContractViewController


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(NSMutableArray *)cusNameConNameArray
{
    if (!_cusNameConNameArray) {
        
        _cusNameConNameArray = [NSMutableArray array];
    }
    return _cusNameConNameArray;
}

-(NSMutableArray *)cluConNameArray
{
    if (!_cluConNameArray) {
        
        _cluConNameArray = [NSMutableArray array];
    }
    return _cluConNameArray;
}


-(void)ciclkSearchPopContractListWithArray:(NSMutableArray *)searchArray
{
    isAllContract = YES;
    
    if (!searchArray) {
        
        [[Session sharedSession].tpView presentMessageTips:@"没有数据"];
        
    }else{
        
#pragma mark - 先把原来的数组情况
        [self.contractArray removeAllObjects];
        
#pragma mark - 在把传过来的数组加到原来的数组
        [self.contractArray addObjectsFromArray:searchArray];
        
        //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）
        NSString *allpages = [NSString stringWithFormat:@"总共%ld条",(long)searchArray.count];
        NSString *yiPages = [NSString stringWithFormat:@"已加载%ld条",(unsigned long)[self.contractArray count]];
        self.contractTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@ %@",allpages,yiPages];
        
#pragma mark - 刷新tableView
        [self.contractTable reloadData];
    }
}

-(NSMutableArray *)contractArray
{
    if (!_contractArray) {
        
        _contractArray = [NSMutableArray array];
    }
    return _contractArray;
}

-(UITableView *)contractTable
{
    if (!_contractTable) {
        _contractTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64)];
        _contractTable.dataSource = self;
        _contractTable.delegate = self;
        _contractTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _contractTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    pages = 0;

    
    self.view.backgroundColor = RGB(227, 227, 227);
    self.title = @"联系人";
    [self.view addSubview:self.contractTable];
    
    self.contractTable.backgroundColor = [UIColor clearColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"加号"] style:UIBarButtonItemStyleDone target:self action:@selector(AddContract)];
    
    isAllContract = NO;
    
    YCSearchBar *search = [[YCSearchBar alloc]initWithFrame:CGRectMake(10, 0, PHONE_UISCREEN_WIDTH-20, 35)];
    search.placeholder = @"搜索";
    search.delegate = self;
    self.contractTable.tableHeaderView = search;
    

#pragma mark - 修改联系人成功后的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeConUpData) name:@"CHANGECONUPDATE" object:nil];
    
    if ([self.contactType isEqualToString:@"客户联系人"]) {
        
        // 获取客户下的联系人
        [self getCustomerContractDataRefresh];
        
    }else if ([self.contactType isEqualToString:@"线索下的联系人"]) {
    
        // 获取线索下的联系人
        [self setCluesContractDataRefresh];
    
    }else if ([self.contactType isEqualToString:@"客户明细下的联系人"]) {
    
        //客户明细下的联系人和客户下的联系人一样，只是table的frame要改下
        [self getCustomerContractDataRefresh];
        self.contractTable.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40);
    
    } else {
    
        [self setupRefresh];
    }
    
    
#pragma mark - 添加联系人成功后的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadContactList) name:@"ADDCONTRACT" object:nil];
}

-(void)changeConUpData
{
    // 修改成功刷新列表
    [self setupRefresh];
}

-(void)setupRefresh{
    
    //1.下拉刷新（进入刷新状态就会调用self的headerRereshing）
    
    __weak typeof(self) myvc = self;
    
    [myvc.contractTable addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0)), dispatch_get_main_queue(), ^{
            
            // 获取线索跟踪列表数据
            pages = 0;
            
            [myvc getContractDataWithStart:[NSString stringWithFormat:@"%ld",(long)pages] limit:@"15"];
            [myvc.contractTable reloadData];
        });
        
    }];
    
    [self.contractTable headerBeginRefreshing];
    
    //上拉刷新
    [myvc.contractTable addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 刷新表格
            pages += 15;
            
            //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）
//            NSString *allpages = [NSString stringWithFormat:@"总共%ld条",allPage];
//            NSString *yiPages = [NSString stringWithFormat:@"已加载%ld条",pages];
//            self.contractTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@%@",allpages,yiPages];
            
            if (self.contractArray.count < pages) {
                
                [[Session sharedSession].tpView presentFailureTips:@"已无更多数据"];
                
                [self.contractTable footerEndRefreshing];
                
            }else{
                
                [myvc  getContractDataWithStart:[NSString stringWithFormat:@"%ld",(long)pages]limit:@"15"];
                
            }
        });
        
    }];

}

#pragma mark - 获取线索下的联系人
-(void)setCluesContractDataRefresh{
    
    //1.下拉刷新（进入刷新状态就会调用self的headerRereshing）
    
    __weak typeof(self) myvc = self;
    
    [myvc.contractTable addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0)), dispatch_get_main_queue(), ^{
            
            // 获取线索跟踪列表数据
            pages = 0;
            [myvc getCluesContractDataWithStart:[NSString stringWithFormat:@"%ld",(long)pages] limit:@"15"];
        });
        
    }];
    
    [self.contractTable headerBeginRefreshing];
    
    //上拉刷新
    [myvc.contractTable addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 刷新表格
            pages += 15;
            
            if (self.cluConNameArray.count < pages) {
                
                [[Session sharedSession].tpView presentFailureTips:@"已无更多数据"];
                
                [self.contractTable footerEndRefreshing];
                
            }else{
                
                [myvc  getCluesContractDataWithStart:[NSString stringWithFormat:@"%ld",(long)pages]limit:@"15"];
                
            }
        });
        
    }];
    
}



#pragma mark - 获取客户下的联系人
-(void)getCustomerContractDataRefresh
{
    
    
    //1.下拉刷新（进入刷新状态就会调用self的headerRereshing）
    
#warning ios之后用__Week,用__unsafe_unretained的缺点是block释放后不会自己置nil
    __unsafe_unretained typeof(self) myvc = self;
    
    [myvc.contractTable addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0)), dispatch_get_main_queue(), ^{
            
            // 获取线索跟踪列表数据
            pages = 0;
            [myvc getCusNameConNameWithStart:[NSString stringWithFormat:@"%ld",(long)pages] limit:@"15"];
        });
        
    }];
    
    [self.contractTable headerBeginRefreshing];
    
    //上拉刷新
    [myvc.contractTable addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 刷新表格
            pages += 15;
            
            if (self.cusNameConNameArray.count < pages) {
                
                [[Session sharedSession].tpView presentFailureTips:@"已无更多数据"];
                
                [self.contractTable footerEndRefreshing];
                
            }else{
                
                [myvc  getCusNameConNameWithStart:[NSString stringWithFormat:@"%ld",(long)pages]limit:@"15"];
                
            }
        });
        
    }];
}


-(void)getCusNameConNameWithStart:(NSString *)start limit:(NSString *)limit
{
    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,CONTRACTDATA];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@",@"start=",start,@"&limit=",limit];
    
    NSString *cusUrl = [NSString stringWithFormat:@"%@%@",url,urlStr];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *dict = @{@"customerId":self.customerID};
    
    [manager POST:cusUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"---%@",[responseObject JSONString]);
        
        if (pages == 0) {
            
            [self.cusNameConNameArray removeAllObjects];
        }
        
        contractBaseClass *baseModel = [[contractBaseClass alloc]initWithDictionary:responseObject];
        
        allPage = baseModel.data.total;
        
        
        if (baseModel.success) {
            
            if (baseModel.data.datalist.count == 0) {
                
                [[Session sharedSession].tpView presentMessageTips:@"该客户没有联系人"];
                
            }else{
                
                for (int i = 0; i < baseModel.data.datalist.count; i++) {
                    
                    [self.cusNameConNameArray addObject:[baseModel.data.datalist objectAtIndex:i]];
                }
            }
            
            [self.contractArray removeAllObjects];
            [self.contractArray addObjectsFromArray:self.cusNameConNameArray];
            
            //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）
            NSString *allpages = [NSString stringWithFormat:@"总共%ld条",(long)allPage];
            NSString *yiPages = [NSString stringWithFormat:@"已加载%ld条",(unsigned long)[self.contractArray count]];
            self.contractTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@ %@",allpages,yiPages];
            
        }
        
        
        
        [self.contractTable headerEndRefreshing];
        [self.contractTable footerEndRefreshing];
        [self.contractTable reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [self.contractTable headerEndRefreshing];
        [self.contractTable footerEndRefreshing];
        [self.contractTable reloadData];

        NSLog(@"%@",error);
    }];



}


#pragma mark - 添加联系人成功后的通知
-(void)reloadContactList
{
    if ([self.contactType isEqualToString:@"客户联系人"]) {
        
        // 获取客户下的联系人
        [self getCustomerContractDataRefresh];
        
    }else if ([self.contactType isEqualToString:@"线索下的联系人"]) {
        
        // 获取线索下的联系人
        [self setCluesContractDataRefresh];
        
    } else {
    
        [self setupRefresh];

    }
}


#pragma mark - 点击textField push出页面
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    ContractSearchController *contractSearch = [[ContractSearchController alloc]init];
    contractSearch.delegate = self;
    [self.navigationController pushViewController:contractSearch animated:YES];
    return NO;
}



-(void)AddContract
{
    AddContractController *addContract = [[AddContractController alloc]init];
    addContract.cusName = self.cusName;
    addContract.cusId = self.customerID;
    [self.navigationController pushViewController:addContract animated:YES];
}

#pragma mark - 获取联系人列表
-(void)getContractDataWithStart:(NSString *)start limit:(NSString *)limit
{
    if (isAllContract) {
        
        [self.contractTable headerEndRefreshing];
        [self.contractTable footerEndRefreshing];
        return;
    }
    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,CONTRACTDATA];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@",@"start=",start,@"&limit=",limit];
    
    NSString *conUrl = [NSString stringWithFormat:@"%@%@",url,urlStr];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *userId =  [UserDefault getDataObjectForKey:@"managerID"];
    NSDictionary *dict = @{@"ids":userId};
    
    [manager POST:conUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-------%@",[responseObject JSONString]);
        
        if (pages == 0) {
            
            [self.contractArray removeAllObjects];
        }

        
        contractBaseClass *baseModel = [[contractBaseClass alloc]initWithDictionary:responseObject];
        if (baseModel.success) {
            
            allPage = baseModel.data.total;
            
            for (int i = 0; i < baseModel.data.datalist.count; i++) {
                
                [self.contractArray addObject:[baseModel.data.datalist objectAtIndex:i]];
            }
            
            //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）
            NSString *allpages = [NSString stringWithFormat:@"总共%ld条",(long)allPage];
            NSString *yiPages = [NSString stringWithFormat:@"已加载%ld条",(unsigned long)[self.contractArray count]];
            self.contractTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@ %@",allpages,yiPages];
        }
        
        [self.contractTable headerEndRefreshing];
        [self.contractTable footerEndRefreshing];
        [self.contractTable reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [self.contractTable headerEndRefreshing];
        [self.contractTable footerEndRefreshing];
        [self.contractTable reloadData];

    }];
    

}


#pragma mark - 获取线索联系人
-(void)getCluesContractDataWithStart:(NSString *)start limit:(NSString *)limit
{
    NSString *cluUrl = [NSString stringWithFormat:@"%@%@",MAINURL,CONTRACTDATA];
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@",@"start=",start,@"&limit=",limit];
    NSString *url = [NSString stringWithFormat:@"%@%@",cluUrl,urlStr];
    NSDictionary *dict = @{@"customerId":self.cluesId};
    AFHTTPRequestOperationManager *mang = [AFHTTPRequestOperationManager manager];
    [mang POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if (pages == 0) {
            
            [self.cluConNameArray removeAllObjects];
        }
        contractBaseClass *cluConModel = [[contractBaseClass alloc]initWithDictionary:responseObject];
        
        allPage = cluConModel.data.total;
        
        if (cluConModel.success) {
            
            for (int i = 0; i < cluConModel.data.datalist.count; i++) {
                
                [self.cluConNameArray addObject:[cluConModel.data.datalist objectAtIndex:i]];
            }
            
            [self.contractArray removeAllObjects];
            [self.contractArray addObjectsFromArray:self.cluConNameArray];

            //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）
            NSString *allpages = [NSString stringWithFormat:@"总共%ld条",(long)allPage];
            NSString *yiPages = [NSString stringWithFormat:@"已加载%ld条",(unsigned long)[self.cluConNameArray count]];
            self.contractTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@ %@",allpages,yiPages];
            
        }

        [self.contractTable headerEndRefreshing];
        [self.contractTable footerEndRefreshing];
        [self.contractTable reloadData];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [self.contractTable headerEndRefreshing];
        [self.contractTable footerEndRefreshing];
        [self.contractTable reloadData];

        NSLog(@"%@",error);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contractArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"contractCellIdtenfier";
    
    ContractCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[ContractCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    contractDatalist *listModel = [self.contractArray objectAtIndex:indexPath.row];
    
    cell.contractId = listModel.datalistIdentifier;
    cell.selectRow = indexPath.row;
    
    
    self.contractName = listModel.conName;
    self.contractId = listModel.datalistIdentifier;
    
    cell.nameLabel.text = listModel.conName;
    cell.zhiWeiLabel.text = listModel.postionCode;
    cell.buMenLabel.text = listModel.departmentId;
    cell.roleLabel.text = listModel.contRoleTypeName;
    cell.closelyLabel.text = listModel.imtimateDegreeName;
    cell.customerLabel.text = listModel.cusName;
    cell.delegate = self;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

#pragma mark - 点击修改哪个联系人就把对应点击联系人行的id传过来
-(void)ContractButtonAddVisitAndResultsWithTag:(NSInteger)tag contractId:(NSString *)contractId row:(NSInteger)selectRow
{
    
    contractDatalist *listModel = [self.contractArray objectAtIndex:selectRow];

    if (tag == 20) {
        
        VisitPlanViewController *contactPlan = [[VisitPlanViewController alloc]init];
        contactPlan.planStr = @"联系人的拜访计划";
        contactPlan.contractIdStr = contractId;
        [self.navigationController pushViewController:contactPlan animated:YES];
        
    }else if (tag == 21){
    
        ContactResultController *contractResult = [[ContactResultController alloc]init];
        contractResult.nameId = contractId;
        contractResult.cusId = listModel.customerId;
        [self.navigationController pushViewController:contractResult animated:YES];
        
    }else if (tag == 22){
    
        ChangeConController *changeCon = [[ChangeConController alloc]init];
        changeCon.conId = listModel.datalistIdentifier;
        [self.navigationController pushViewController:changeCon animated:YES];
    
    }else if (tag == 55) {
        
        [[Session sharedSession].tpView presentMessageTips:@"需要真机测试"];
        
        NSString *phoneStr = [NSString stringWithFormat:@"%@%@",@"tel://",listModel.mobile];
        
        NSLog(@"-----%@",phoneStr);
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneStr]];
    }

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    contractDatalist *listModel = [self.contractArray objectAtIndex:indexPath.row];
    MainConViewController *mainVC = [[MainConViewController alloc]init];
    mainVC.contractId = listModel.datalistIdentifier;
    mainVC.cusId = listModel.customerId;
    [self.navigationController pushViewController:mainVC animated:YES];
}


@end
