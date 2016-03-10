//
//  CluesViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CluesViewController.h"
#import "ContractViewController.h"  //联系人
#import "VisitPlanViewController.h" //拜访计划
#import "TurnToViewController.h"    //委托
#import "CloseViewController.h"     //关闭
#import "ContactResultController.h" //联络结果
#import "CluesSearchController.h"   //线索搜索
#import "MainCluesXQController.h"   //线索明细


#import "CluesCell.h"
#import "YCSearchBar.h"

#import "AFNetworking.h"
#import "UserDefault.h"
#import "MJRefresh.h"

#import "cluesBaseClass.h"
#import "cluesData.h"
#import "cluesDatalist.h"

@interface CluesViewController () <UITableViewDelegate,UITableViewDataSource,cluesCellDelegate,UITextFieldDelegate,clueSearchDelegate>

{
    __block NSInteger page;
    __block NSInteger allPage;
    
    
#pragma mark 客户下的相关线索分页用的
    __block NSInteger cusPage;
    __block NSInteger allCusNums;
}

@property (nonatomic, strong)UITableView *cluesTable;

#pragma mark - 存放登陆人下的相关线索的数组
@property (nonatomic, strong)NSMutableArray *cluesArray;

#pragma mark - 存放客户明细下的相关线索的数组
@property (nonatomic, strong)NSMutableArray *cusClueArray;

@end

@implementation CluesViewController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(NSMutableArray *)cusClueArray
{
    if (!_cusClueArray) {
        
        _cusClueArray = [NSMutableArray array];
    }
    return _cusClueArray;
}



-(NSMutableArray *)cluesArray
{
    if (!_cluesArray) {
        
        _cluesArray = [NSMutableArray array];
    }
    return _cluesArray;
}

-(UITableView *)cluesTable
{
    if (!_cluesTable) {
        
        _cluesTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64)];
        _cluesTable.dataSource = self;
        _cluesTable.delegate = self;
        _cluesTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _cluesTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    page = 0;
    cusPage = 0;
    
    self.title = @"线索";
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.cluesTable];
    self.cluesTable.backgroundColor = [UIColor clearColor];
    
    YCSearchBar *search = [[YCSearchBar alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 35)];
    search.delegate = self;
    search.placeholder = @"搜索";
    self.cluesTable.tableHeaderView = search;
    
#pragma mark - 关闭线索成功后的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(closeClues) name:@"CLOSECLUES" object:nil];
    
#pragma mark - 客户下添加的线索通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updataCusClues) name:@"UPDATACUSCLUES" object:nil];
    
    if ([self.cluesType isEqualToString:@"客户明细下的线索"]) {
        
        // 获取客户明细下的相关线索数据
        [self getCusDeailsCluesDataRefresh];
        
        self.cluesTable.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64-40);
        
    }else{
        
        // 获取线索列表数据
        [self setupRefresh];
    }
}


#pragma mark - 客户下添加线索成功后，重新调客户明细下的相关线索数据的接口
-(void)updataCusClues
{
    // 获取客户明细下的相关线索数据
    [self getCusDeailsCluesDataRefresh];

}

-(void)closeClues
{
#pragma mark - 关闭成功后刷新列表
    [self setupRefresh];
}

-(void)getCusDeailsCluesDataRefresh
{
    
    //1.下拉刷新（进入刷新状态就会调用self的headerRereshing）
    
    //    [self.tableView addHeaderWithTarget:self.tableView action:@selector(headerRereshing)];
    __unsafe_unretained typeof(self) myvc = self;
    
    [myvc.cluesTable addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0)), dispatch_get_main_queue(), ^{
            
#pragma mark - 下拉时要重新置为0
            cusPage = 0;
            
            // 获取线索列表数据
            [myvc getCustomerDeailsCluesWithStart:[NSString stringWithFormat:@"%ld",(long)cusPage] limit:@"15"];
            
        });
        
    }];
    
    [self.cluesTable headerBeginRefreshing];
    
    //上拉刷新
    [myvc.cluesTable addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            cusPage += 15;
            if (self.cusClueArray.count < cusPage) {
                
                [[Session sharedSession].tpView presentFailureTips:@"没有更多数据"];
                [self.cluesTable footerEndRefreshing];
                
            }else{
                
                [myvc getCustomerDeailsCluesWithStart:[NSString stringWithFormat:@"%ld",(long)cusPage]limit:@"15"];
                
            }
        });
    }];

}


#pragma mark - 获取客户明细下的相关线索数据
-(void)getCustomerDeailsCluesWithStart:(NSString *)start limit:(NSString *)limit
{

    NSString *mainurl = [NSString stringWithFormat:@"%@%@",MAINURL,CLUESLIST];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@",@"start=",start,@"&limit=",limit];
    
    NSString *url = [NSString stringWithFormat:@"%@%@",mainurl,urlStr];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
//    NSString *userId =  [UserDefault getDataObjectForKey:@"managerID"];
    
    NSDictionary *dict = @{@"cusId":self.cusId,@"noStatus":@"SP_JS"};
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if (cusPage == 0) {
            
            [self.cusClueArray removeAllObjects];
        }
        
        cluesBaseClass *baseModel = [[cluesBaseClass alloc]initWithDictionary:responseObject];
        allCusNums = baseModel.data.total;
        
        if (baseModel.success) {
            
            for (int i = 0; i < baseModel.data.datalist.count; i++) {
                
                [self.cusClueArray addObject:[baseModel.data.datalist objectAtIndex:i]];
            }
            
            NSString *allpages = [NSString stringWithFormat:@"总共%ld条",(long)allCusNums];
            NSString *yiPages = [NSString stringWithFormat:@"已加载%ld条",(unsigned long)self.cusClueArray.count];
            self.cluesTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@%@",allpages,yiPages];
            
            [self.cluesArray removeAllObjects];
            [self.cluesArray addObjectsFromArray:self.cusClueArray];
        }
        
        [self.cluesTable headerEndRefreshing];
        [self.cluesTable footerEndRefreshing];
        [self.cluesTable reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [self.cluesTable headerEndRefreshing];
        [self.cluesTable footerEndRefreshing];
        [self.cluesTable reloadData];
        
        NSLog(@"%@",error);
    }];
}


-(void)setupRefresh{
    
    //1.下拉刷新（进入刷新状态就会调用self的headerRereshing）
    
    //    [self.tableView addHeaderWithTarget:self.tableView action:@selector(headerRereshing)];
    __weak typeof(self) myvc = self;
    
    [myvc.cluesTable addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0)), dispatch_get_main_queue(), ^{
            
#pragma mark - 下拉时要重新置为0
            page = 0;
            
            // 获取线索列表数据
            [myvc getCluesListDataWithStart:[NSString stringWithFormat:@"%ld",(long)page] limit:@"15"];
            
        });
        
    }];
    
    [self.cluesTable headerBeginRefreshing];
    
    //上拉刷新
    [myvc.cluesTable addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            page += 15;
            if (self.cluesArray.count < page) {
                
                [[Session sharedSession].tpView presentFailureTips:@"没有更多数据"];
                [self.cluesTable footerEndRefreshing];
                
            }else{
                
                [myvc getCluesListDataWithStart:[NSString stringWithFormat:@"%ld",(long)page]limit:@"15"];
                
            }
        });
    }];
}


#pragma mark - 获取登录人的线索列表
-(void)getCluesListDataWithStart:(NSString *)start limit:(NSString *)limit
{
    NSString *mainurl = [NSString stringWithFormat:@"%@%@",MAINURL,CLUESLIST];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@",@"start=",start,@"&limit=",limit];
    
    NSString *url = [NSString stringWithFormat:@"%@%@",mainurl,urlStr];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *userId =  [UserDefault getDataObjectForKey:@"managerID"];
    
    NSDictionary *dict = @{@"ownerId":userId,@"noStatus":@"SP_JS"};
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if (page == 0) {
            
            [self.cluesArray removeAllObjects];
        }
        
        cluesBaseClass *baseModel = [[cluesBaseClass alloc]initWithDictionary:responseObject];
        allPage = baseModel.data.total;
        
        if (baseModel.success) {
            
            for (int i = 0; i < baseModel.data.datalist.count; i++) {
                
                [self.cluesArray addObject:[baseModel.data.datalist objectAtIndex:i]];
            }
            
            NSString *allpages = [NSString stringWithFormat:@"总共%ld条",(long)allPage];
            NSString *yiPages = [NSString stringWithFormat:@"已加载%ld条",(unsigned long)self.cluesArray.count];
            self.cluesTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@%@",allpages,yiPages];
        }
        
        [self.cluesTable headerEndRefreshing];
        [self.cluesTable footerEndRefreshing];
        [self.cluesTable reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [self.cluesTable headerEndRefreshing];
        [self.cluesTable footerEndRefreshing];
        [self.cluesTable reloadData];

        NSLog(@"%@",error);
    }];

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cluesArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cluesCellIdtenfier";
    
    CluesCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    
    if (!cell) {
        
        cell = [[CluesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cluesDatalist *listModel = [self.cluesArray objectAtIndex:indexPath.row];
    cell.delegate = self;
    
    cell.cluesId = listModel.datalistIdentifier;
    cell.cusId = listModel.cusId;
    cell.cusName = listModel.cusFullname;
    cell.yeWuType = listModel.customerLevelName;
    cell.clues = listModel.cusFullname;
    cell.seleRow = indexPath.row;
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:listModel.createdDatetime / 1000];
    NSString *startDate = [DateUtils getStringDateByDate:date dateFormat:@"yyyy-MM-dd"];
    cell.customerName.text = listModel.cusFullname;
    cell.headName.text = listModel.ownerName;
    cell.visitNumber.text = [NSString stringWithFormat:@"%.0lf",listModel.cContact];
    cell.genZongTime.text = startDate;
    
    cell.stateLabel.text = listModel.statusName;

    if (listModel.statusName.length < 1) {
        
        cell.stateLabel.hidden = YES;
    }else {
        cell.stateLabel.hidden = NO;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

-(void)swithButtonQueryCluesWithTag:(NSInteger)tag cluesId:(NSString *)cluesId cusId:(NSString *)cusId cusName:(NSString *)cusName yeWuType:(NSString *)yeWuType clues:(NSString *)clues row:(NSInteger)seleRow
{
    
    cluesDatalist *listModel = [self.cluesArray objectAtIndex:seleRow];

    if (tag == 521) {
        
        VisitPlanViewController *plan = [[VisitPlanViewController alloc]init];
        plan.cluesIds = cluesId;
        plan.cusName = listModel.cusFullname;
        plan.cusId = listModel.cusId;
        plan.yeWuType  = listModel.customerLevelName;
        plan.xgYeWu = listModel.cusFullname;
        plan.planStr = @"线索下的拜访计划";
        [self.navigationController pushViewController:plan animated:YES];
        
    }else if (tag == 524){
    
        CloseViewController *close = [[CloseViewController alloc]init];
        close.idStr = cluesId;
        close.cusName = listModel.cusFullname;
        [self.navigationController pushViewController:close animated:YES];
    
    }else if (tag == 523){
    
        TurnToViewController *turnTo = [[TurnToViewController alloc]init];
        turnTo.cusName = listModel.cusFullname;
        turnTo.cluId = cluesId;
        [self.navigationController pushViewController:turnTo animated:YES];
    
    }else if (tag == 522) {
    
        ContactResultController *contract = [[ContactResultController alloc]init];
        contract.visitRecord = @"线索的拜访记录";

        contract.cusName = listModel.cusFullname;
        contract.headName = listModel.ownerName;
        contract.cusId = cusId;
        contract.cluId = cluesId;
        [self.navigationController pushViewController:contract animated:YES];
        
    }else if (tag == 520) {
    
        ContractViewController *contactVC = [[ContractViewController alloc]init];
        contactVC.contactType = @"线索下的联系人";
        contactVC.cluesId = cusId;
        contactVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:contactVC animated:YES];

    }

}

#pragma mark - 点击textField push出页面
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    CluesSearchController *cluesSearch = [[CluesSearchController alloc]init];
    cluesSearch.delegate = self;
    [self.navigationController pushViewController:cluesSearch animated:YES];
    return NO;
}

#pragma mark - 点击搜索传过来的数组
-(void)searchClueWithArray:(NSMutableArray *)clueArray
{
    if (!clueArray) {
        
        [[Session sharedSession].tpView presentMessageTips:@"没有数据"];
        
    } else {
        
#pragma mark - 先把原来的数组情况
        [self.cluesArray removeAllObjects];
        
#pragma mark - 在把传过来的数组加到原来的数组
        [self.cluesArray addObjectsFromArray:clueArray];
        
#pragma mark - 刷新tableView
        [self.cluesTable reloadData];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    cluesDatalist *listModel = [self.cluesArray objectAtIndex:indexPath.row];
    MainCluesXQController *cluesDeails = [[MainCluesXQController alloc]init];
    cluesDeails.cluesId = listModel.datalistIdentifier;
    cluesDeails.cusId = listModel.cusId;
    [self.navigationController pushViewController:cluesDeails animated:YES];
}


@end
