//
//  CustomerController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CustomerController.h"
#import "CustomerSearchController.h"  // 客户搜索
#import "ContractViewController.h"    // 联系人
#import "ContractWayController.h"     // 联系方式
#import "NewCluesController.h"        // 新增线索
#import "MainCusDeailsController.h"   // 客户详情
#import "CustomerCell.h"
#import "YCSearchBar.h"

#import "AFNetworking.h"
#import "MJRefresh.h"

#import "CustomerBaseClass.h"
#import "CustomerData.h"
#import "CustomerDatalist.h"

@interface CustomerController () <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,customerButtonDelegate,popViewDelegate>

{
    __block NSInteger page;
    __block NSInteger cusAllPage;
}

@property (nonatomic, strong)UITableView *customerTable;

@property (nonatomic, strong)NSMutableArray *customerArray;

@property (nonatomic, strong)NSString *customerId;

@end

@implementation CustomerController


-(void)swithButtonPopViewWithArray:(NSMutableArray *)array
{
    
    if (!array) {
        
        [[Session sharedSession].tpView presentMessageTips:@"没有数据"];
        
    }else{
        
        self.customerTable.footerHidden = YES;
        self.customerTable.headerHidden = YES;
        
#pragma mark - 先把原来的数组情况
        [self.customerArray removeAllObjects];
        
#pragma mark - 在把传过来的数组加到原来的数组
        [self.customerArray addObjectsFromArray:array];
        
        //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）
        NSString *allpages = [NSString stringWithFormat:@"总共%ld条",(long)array.count];
        NSString *yiPages = [NSString stringWithFormat:@"已加载%ld条",(unsigned long)[self.customerArray count]];
        self.customerTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@ %@",allpages,yiPages];
        
#pragma mark - 刷新tableView
        [self.customerTable reloadData];
    }

}

-(NSMutableArray *)customerArray
{
    if (!_customerArray) {
        
        _customerArray = [NSMutableArray array];
    }
    return _customerArray;
}

-(UITableView *)customerTable
{
    if (!_customerTable) {
        
        _customerTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64)];
        _customerTable.dataSource = self;
        _customerTable.delegate = self;
        _customerTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _customerTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"客户";
    
    self.view.backgroundColor = RGB(227, 227, 227);
    
    [self.view addSubview:self.customerTable];
    
    self.customerTable.backgroundColor = [UIColor clearColor];
    
    YCSearchBar *search = [[YCSearchBar alloc]initWithFrame:CGRectMake(10, 0, PHONE_UISCREEN_WIDTH-20, 35)];
    
    search.placeholder = @"搜索";
    
    search.delegate = self;
    
    self.customerTable.tableHeaderView = search;
    
    
    // 获取客户数据
    [self setupRefresh];
    
}

//在界面将要消失时停止loading
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[Session sharedSession].loadView StopLoading];
}

-(void)setupRefresh{
    
    //1.下拉刷新（进入刷新状态就会调用self的headerRereshing）
    //    [self.tableView addHeaderWithTarget:self.tableView action:@selector(headerRereshing)];
    
    __unsafe_unretained typeof(self) myvc = self;
    
    [myvc.customerTable addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0)), dispatch_get_main_queue(), ^{
            
            // 获取线索跟踪列表数据
            [self.customerArray removeAllObjects];
            
            page = 0;
            [myvc getCustomerDataWithStart:[NSString stringWithFormat:@"%ld",(long)page] limit:@"15"];
            // 刷新表格
            [self.customerTable reloadData];
        });
        
    }];
    
    [self.customerTable headerBeginRefreshing];
    
    //上拉刷新
    [myvc.customerTable addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 刷新表格
            page += 15;
            
            if (self.customerArray.count < page) {
                
                [[Session sharedSession].tpView presentFailureTips:@"已无更多数据"];
                
                [self.customerTable footerEndRefreshing];
                
                
            }else{
                
                [myvc getCustomerDataWithStart:[NSString stringWithFormat:@"%ld",(long)page] limit:@"15"];
            }
            
        });
    }];
    
    //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）
}



-(void)getCustomerDataWithStart:(NSString *)start limit:(NSString *)limit
{
    [[Session sharedSession].loadView StartLoading];
    
    NSString *urls = [NSString stringWithFormat:@"%@%@",MAINURL,CustomerListData];
    
    NSString *Str = [NSString stringWithFormat:@"%@%@%@%@",@"start=",start,@"&limit=",limit];
    NSString *url = [NSString stringWithFormat:@"%@%@",urls,Str];
    
    NSDictionary *dict = @{@"id":@""};
    
    NSLog(@"---%@",url);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"---%@",[responseObject JSONString]);
        
        [[Session sharedSession].loadView StopLoading];
        
        CustomerBaseClass *baseModel = [[CustomerBaseClass alloc]initWithDictionary:responseObject];
        
        cusAllPage = baseModel.data.total;
        
        if (page == 0) {
            
            [self.customerArray removeAllObjects];
        }
        
        
        if (baseModel.success) {
            
            for (int i = 0; i < baseModel.data.datalist.count; i++) {
                
                [self.customerArray addObject:[baseModel.data.datalist objectAtIndex:i]];
            }
            
            //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）
            NSString *allpages = [NSString stringWithFormat:@"总共%ld条",(long)cusAllPage];
            NSString *yiPages = [NSString stringWithFormat:@"已加载%ld条",(unsigned long)[self.customerArray count]];
            self.customerTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@ %@",allpages,yiPages];
            
        }
        [self.customerTable headerEndRefreshing];
        [self.customerTable footerEndRefreshing];
        [self.customerTable reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [[Session sharedSession].loadView StopLoading];
        [self.customerTable headerEndRefreshing];
        [self.customerTable footerEndRefreshing];
        
//        NSLog(@"==== %@",[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
    }];

}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.customerArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"contractCellIdtenfier";
    
    CustomerCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    
    if (!cell) {
        
        cell = [[CustomerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.delegate = self;
    
    cell.seleRow = indexPath.row;
    
    
    
    if (self.customerArray != nil && self.customerArray.count > 0) {

        CustomerDatalist *listModel = [self.customerArray objectAtIndex:indexPath.row];
        cell.nameLabel.text = listModel.cusFullName;
        cell.numberLabel.text = listModel.cusCode;
        cell.typeLabel.text = listModel.cusTypeName;
        cell.beiZhuLabel.text = listModel.datalistDescription;
        cell.levelLabel.text = listModel.startLevelName;
        
        
        
        if (listModel.statusName.length < 1) {
            
            cell.stateLabel.hidden = YES;
            
        }else{
            
            cell.stateLabel.text = listModel.statusName;
        }
#pragma mark - 需要传客户的id
        cell.customerId = listModel.datalistIdentifier;
        
    }else{
    
        [[Session sharedSession].tpView presentMessageTips:@"没有数据"];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}



#pragma mark - 点击textField push出页面
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    CustomerSearchController *customerSearch = [[CustomerSearchController alloc]init];
    customerSearch.delegate = self;
    [self.navigationController pushViewController:customerSearch animated:YES];
    
    return NO;
}


#pragma mark 700联系人 701联络方式  702新增线索
-(void)swithButtonQueryContractAndContractWayAddCluesButtonWithTag:(NSInteger)tag customerId:(NSString *)customerId  row:(NSInteger)seleRow
{
    CustomerDatalist *listModel = [self.customerArray objectAtIndex:seleRow];

    if (tag == 700) {
        
        ContractViewController *contract = [[ContractViewController alloc]init];
        contract.hidesBottomBarWhenPushed = YES;
        contract.contactType = @"客户联系人";
        contract.cusName = listModel.cusFullName;
        contract.customerID = customerId;
        [self.navigationController pushViewController:contract animated:YES];
        
    }else if (tag == 701) {
        
        ContractWayController *contractWay = [[ContractWayController alloc]init];
        contractWay.idStr = customerId;
        [self.navigationController pushViewController:contractWay animated:YES];
    
    }else if (tag == 702) {
    
        NewCluesController *newClues = [[NewCluesController alloc]init];
        newClues.cusId = customerId;
        [self.navigationController pushViewController:newClues animated:YES];
    
    }

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CustomerDatalist *listModel = [self.customerArray objectAtIndex:indexPath.row];
    MainCusDeailsController *mainVC = [[MainCusDeailsController alloc]init];
    mainVC.customerId = listModel.datalistIdentifier;
    [self.navigationController pushViewController:mainVC animated:YES];
}

@end
