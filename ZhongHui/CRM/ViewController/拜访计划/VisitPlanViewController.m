//
//  VisitPlanViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "VisitPlanViewController.h"
#import "PlanReplyController.h"  // 回复
#import "FollowController.h"     // 跟进
#import "TiXingController.h"     // 提醒
#import "PlanDetailController.h" // 明细
#import "CancelPlanController.h" // 取消
#import "PlanArchiveController.h"// 归档
#import "AddPlanViewController.h"// 添加
#import "VisitPlanCell.h"
#import "CLWeeklyCalendarView.h"
#import "DailyCalendarView.h"


#import "UserDefault.h"
#import "AFNetworking.h"
#import "MJRefresh.h"


#import "PlanBaseClass.h"
#import "PlanData.h"
#import "PlanDatalist.h"

@interface VisitPlanViewController () <UITableViewDataSource,UITableViewDelegate,visitPlanCellDelegate,CLWeeklyCalendarViewDelegate,DailyCalendarViewDelegate>

{
    __block NSInteger pages;
    __block NSInteger visitAllNum;  // 拜访计划的总条数
    
    BOOL isAll;  // 是否加载全部
}


@property (nonatomic, strong)UITableView *VisitPlanTable;

#pragma mark - 存放拜访计划的数组
@property (nonatomic, strong)NSMutableArray *dataList;

#pragma mark - 存放联系人的拜访计划的数组
//@property (nonatomic, strong)NSMutableArray *contactPlanArray;

#pragma mark - 存放线索下的拜访计划
//@property (nonatomic, strong)NSMutableArray *cluesPlanArray;

#pragma mark - 存放某天的拜访计划的数组
@property (nonatomic, strong)NSMutableArray *dayPlanArray;

#pragma mark - 日历的view
@property (nonatomic, strong)CLWeeklyCalendarView* calendarView;


@end

@implementation VisitPlanViewController
static CGFloat CALENDER_VIEW_HEIGHT = 120.f;


#pragma mark - 删除通知
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(NSMutableArray *)dayPlanArray
{
    if (!_dayPlanArray) {
        
        _dayPlanArray = [NSMutableArray array];
    }
    return _dayPlanArray;
}




-(NSMutableArray *)dataList
{
    if (!_dataList) {
        
        _dataList = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _dataList;
}

-(UITableView *)VisitPlanTable
{
    if (!_VisitPlanTable) {
        
        _VisitPlanTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64)];
        _VisitPlanTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _VisitPlanTable.dataSource = self;
        _VisitPlanTable.delegate = self;
    }
    return _VisitPlanTable;
}

#pragma mark - 每次进来都走这
-(void)dailyCalendarViewDidSelect:(NSDate *)date
{
#pragma mark - 加个变量判断是否加载全部计划，如果是全部的计划就返回，不是全部的就加载
    if (isAll) {
        return;
    }
    
#pragma mark -  写上这个是不请求当天的了，但日历就不可以点击了后来弄了个变量判断
//    if ([self.planStr isEqualToString:@"线索下的拜访计划"]) {
//        
//        return;
//        
//    }else if ([self.planStr isEqualToString:@"线索明细下的拜访计划"]) {
//        
//        return;
//        
//    }else if ([self.planStr isEqualToString:@"联系人的拜访计划"]) {
//        
//        return;
//        
//    }else if ([self.planStr isEqualToString:@"联系人明细的拜访计划"]) {
//        
//        return;
//        
//    }
    
    
    NSDateFormatter *dateFormtter=[[NSDateFormatter alloc] init];
    [dateFormtter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString=[dateFormtter stringFromDate:date];
    
    NSLog(@"%@",dateString);
    
    self.VisitPlanTable.headerHidden = YES;  //隐藏标头刷新
    self.VisitPlanTable.footerHidden = NO;   //显示表尾
    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,VisitPlanList];
    
    NSString *userId = [UserDefault getDataObjectForKey:@"managerID"];
    
    NSDictionary *dict = @{@"starttime":dateString,@"endtime":dateString,@"ownerId":userId};
    
    NSLog(@"day == %@",dict);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        PlanBaseClass *baseModel = [[PlanBaseClass alloc]initWithDictionary:responseObject];
        
        if (baseModel.success) {
            
            [self.dayPlanArray removeAllObjects];
            
            for (int i = 0; i < baseModel.data.datalist.count; i++) {
                
                self.dayPlanArray = [NSMutableArray arrayWithArray:baseModel.data.datalist];
            }
            [self.dataList removeAllObjects];
            [self.dataList addObjectsFromArray:self.dayPlanArray];
            
        }
        
        if (self.dayPlanArray.count == 0) {
            
            [[Session sharedSession].tpView presentMessageTips:@"没有计划"];
        }
        
        NSString *allpages = [NSString stringWithFormat:@"总共%ld条",(long)baseModel.data.total];
        
        NSString *yiPages = [NSString stringWithFormat:@"已加载%ld条",(long)self.dataList.count];
        
        self.VisitPlanTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@%@",allpages,yiPages];
        
        [self.VisitPlanTable reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"-----%@",error);
    }];
    
    //You can do any logic after the view select the date
}




- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    pages = 0;
    
    
    self.title = @"拜访计划";
    
    self.view.backgroundColor = RGB(227, 227, 227);
    
    self.VisitPlanTable.backgroundColor = [UIColor clearColor];

    [self.view addSubview:self.VisitPlanTable];
    
    self.VisitPlanTable.tableHeaderView = self.calendarView;

    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"加号"] style:UIBarButtonItemStyleDone target:self action:@selector(addPlan)];
    
#pragma mark - 添加计划成功后的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(addplanFinish) name:@"ADDPLAN" object:nil];
    
#pragma mark - 点击归档 刷新计划状态的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(upDataPlanStatus) name:@"CHOOSEPLANSTATUS" object:nil];
    
#pragma mark - 点击取消 刷新计划列表
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cancelPlan) name:@"CANCELPLAN" object:nil];

#pragma mark - 点击跟进 刷新计划列表
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(followVisit) name:@"UPLOADFOLLOWSTATUS" object:nil];

    isAll = YES;
    
    if ([self.planStr isEqualToString:@"联系人的拜访计划"]) {
        
        // 获取联系人的拜访计划
        [self setConVisitRefsh];
        
        // 联系人的拜访计划不能添加
        self.navigationItem.rightBarButtonItem = nil;
        
    }else if ([self.planStr isEqualToString:@"联系人明细的拜访计划"]) {
    
        [self setConVisitRefsh];
        self.navigationItem.rightBarButtonItem = nil;

        self.VisitPlanTable.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40);
        
    }else if ([self.planStr isEqualToString:@"线索下的拜访计划"]) {
    
        // 获取线索里的拜访计划的数据
        [self getCluesVisitPlanRefsh];
    
    }else if ([self.planStr isEqualToString:@"线索明细下的拜访计划"]) {
    
        [self getCluesVisitPlanRefsh];
        
        self.VisitPlanTable.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40);
    
    }else {
        
        // 拜访计划列表
        [self setupRefresh];

    }
}




-(void)getCluesVisitPlanRefsh
{
    
    //1.下拉刷新（进入刷新状态就会调用self的headerRereshing）
    
    __unsafe_unretained typeof(self) myvc = self;
    
    [myvc.VisitPlanTable addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0)), dispatch_get_main_queue(), ^{
            
            // 获取线索跟踪列表数据
            pages = 0;
            
            [myvc getCluesVisitPlanDataWithStart:[NSString stringWithFormat:@"%ld",(long)pages]limit:@"15"];
            
            [myvc.VisitPlanTable reloadData];
        });
        
    }];
    
    [self.VisitPlanTable headerBeginRefreshing];
    
    //上拉刷新
    [myvc.VisitPlanTable addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 刷新表格
            pages += 15;
            
            if (self.dataList.count < pages) {
                
                [[Session sharedSession].tpView presentFailureTips:@"已无更多数据"];
                
                [self.VisitPlanTable footerEndRefreshing];
                
            }else{
                
                [myvc  getCluesVisitPlanDataWithStart:[NSString stringWithFormat:@"%ld",(long)pages]limit:@"15"];
            }
        });
        
    }];
    
    //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）
}

// 获取线索里的拜访计划的数据
-(void)getCluesVisitPlanDataWithStart:(NSString *)start limit:(NSString *)limit
{
    isAll = NO;
    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,CLUESVISITLIST];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@",@"start=",start,@"&limit=",limit];
    
    NSString *clueUrl = [NSString stringWithFormat:@"%@%@",url,urlStr];
    
    NSString *uesrId = [UserDefault getDataObjectForKey:@"managerID"];
    
    NSDictionary *dict = @{@"ownerId":uesrId,@"relBusiId":self.cluesIds};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSLog(@"============%@",[NSThread currentThread]);
    
    [manager POST:clueUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (pages == 0) {
            
            [self.dataList removeAllObjects];
        }
        NSLog(@"----%@",[responseObject JSONString]);
        
        PlanBaseClass *baseModel = [[PlanBaseClass alloc]initWithDictionary:responseObject];
        
        visitAllNum = baseModel.data.total;
        
        if (baseModel.success) {
            
            for (int i = 0; i < baseModel.data.datalist.count; i++) {
                
                [self.dataList addObject:[baseModel.data.datalist objectAtIndex:i]];
            }
            
            if (self.dataList.count == 0) {
                
                [[Session sharedSession].tpView presentMessageTips:@"没有计划"];
            }

            NSString *allpages = [NSString stringWithFormat:@"总共%ld条",(long)visitAllNum];
            NSString *yiPages = [NSString stringWithFormat:@"已加载%ld条",(long)self.dataList.count];
            self.VisitPlanTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@%@",allpages,yiPages];
            
        }
        
        [self.VisitPlanTable headerEndRefreshing];
        [self.VisitPlanTable footerEndRefreshing];
        [self.VisitPlanTable reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [self.VisitPlanTable headerEndRefreshing];
        [self.VisitPlanTable footerEndRefreshing];
        [self.VisitPlanTable reloadData];

        NSLog(@"%@",error);
    }];
    
    NSLog(@"============%@",[NSThread currentThread]);

}



#warning 点击日历也可以上拉下拉刷新，是走的这
-(void)setupRefresh{
    
    //1.下拉刷新（进入刷新状态就会调用self的headerRereshing）
    
    __unsafe_unretained typeof(self) myvc = self;
    
    [myvc.VisitPlanTable addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0)), dispatch_get_main_queue(), ^{
            
            // 获取线索跟踪列表数据
            pages = 0;
            
            [myvc getVisitPlanDataWithStart:[NSString stringWithFormat:@"%ld",(long)pages] limit:@"5"];
            
            [myvc.VisitPlanTable reloadData];
        });
        
    }];
    
    [self.VisitPlanTable headerBeginRefreshing];
    
    //上拉刷新
    [myvc.VisitPlanTable addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 刷新表格
            pages += 5;
            
            if (self.dataList.count < pages) {
                
                [[Session sharedSession].tpView presentFailureTips:@"已无更多数据"];
                
                [self.VisitPlanTable footerEndRefreshing];
                
            }else{
                
                [myvc  getVisitPlanDataWithStart:[NSString stringWithFormat:@"%ld",(long)pages]limit:@"5"];
                
                [self showNewPlanWithCount:pages];

            }
        });
        
    }];
    
    //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）
}


-(void)followVisit
{
    [self setupRefresh];
}

#pragma mark - 点击归档 刷新计划状态的通知的方法
-(void)upDataPlanStatus
{
    [self setupRefresh];
}

#pragma mark - 点击添加 添加计划成功后的通知的方法
-(void)addplanFinish
{
    if ([self.planStr isEqualToString:@"线索下的拜访计划"]) {
        
        // 获取线索里的拜访计划的数据
        [self getCluesVisitPlanRefsh];
        
    }else if ([self.planStr isEqualToString:@"线索明细下的拜访计划"]) {
        
        [self getCluesVisitPlanRefsh];
        self.VisitPlanTable.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40);
        
    } else {
    
        [self setupRefresh];
        

    }
}


#pragma mark - 点击取消 刷新计划列表
-(void)cancelPlan
{
    [self setupRefresh];
}

-(void)addPlan
{
    if ([self.planStr isEqualToString:@"线索下的拜访计划"]) {
        
        AddPlanViewController *addPlan = [[AddPlanViewController alloc]init];
        addPlan.cusId = self.cusId;
        addPlan.cusName = self.cusName;
        addPlan.yeWuType = self.yeWuType;
        addPlan.xgYeWu = self.xgYeWu;
        addPlan.cluesId = self.cluesIds;
        addPlan.cluesAddPlan = @"线索添加计划";
        [self.navigationController pushViewController:addPlan animated:YES];
        
    }else{
        
        AddPlanViewController *addPlan = [[AddPlanViewController alloc]init];
        addPlan.cusId = self.cusId;
        [self.navigationController pushViewController:addPlan animated:YES];
    }
}

#pragma mark - 联系人下的拜访计划列表
-(void)setConVisitRefsh
{
    //1.下拉刷新（进入刷新状态就会调用self的headerRereshing）
    
    __unsafe_unretained typeof(self) myvc = self;
    
    [myvc.VisitPlanTable addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0)), dispatch_get_main_queue(), ^{
            
            // 获取线索跟踪列表数据
            pages = 0;
            
            [myvc getContractPlanVisitDataWithStart:[NSString stringWithFormat:@"%ld",(long)pages] limit:@"15"];
            
        });
        
    }];
    
    [self.VisitPlanTable headerBeginRefreshing];
    
    //上拉刷新
    [myvc.VisitPlanTable addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 刷新表格
            pages += 15;
            
            if (self.dataList.count < pages) {
                
                [[Session sharedSession].tpView presentFailureTips:@"已无更多数据"];
                
                [self.VisitPlanTable footerEndRefreshing];
                
            }else{
                
                [myvc  getContractPlanVisitDataWithStart:[NSString stringWithFormat:@"%ld",(long)pages] limit:@"15"];
            }
        });
        
    }];
    
    //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）


}

-(void)getVisitPlanDataWithStart:(NSString *)start limit:(NSString *)limit
{
    isAll = NO;
    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,VisitPlanList];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@",@"start=",start,@"&limit=",limit];

    NSString *mainUrl = [NSString stringWithFormat:@"%@%@",url,urlStr];

    NSLog(@"%@",mainUrl);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *userId = [UserDefault getDataObjectForKey:@"managerID"];
    
    NSDictionary *dict = @{@"ownerId":userId};

    
    [manager POST:mainUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"------%@",[responseObject JSONString]);
        
        if (pages == 0) {
            
            [self.dataList removeAllObjects];
        }

        
        PlanBaseClass *baseModel = [[PlanBaseClass alloc]initWithDictionary:responseObject];
        visitAllNum = baseModel.data.total;
        
        if (baseModel.success) {
            
            for (int i = 0; i < baseModel.data.datalist.count; i++) {
                
                [self.dataList addObject:[baseModel.data.datalist objectAtIndex:i]];
            }
            NSLog(@"---%lu",(unsigned long)self.dataList.count);
            
            NSString *allpages = [NSString stringWithFormat:@"总共%ld条",(long)visitAllNum];
            NSString *yiPages = [NSString stringWithFormat:@"已加载%ld条",(long)self.dataList.count];
            self.VisitPlanTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@%@",allpages,yiPages];
            

        }
        
        [self.VisitPlanTable headerEndRefreshing];
        [self.VisitPlanTable footerEndRefreshing];
        [self.VisitPlanTable reloadData];
        
//        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [self.VisitPlanTable headerEndRefreshing];
        [self.VisitPlanTable footerEndRefreshing];
        [self.VisitPlanTable reloadData];

        NSLog(@"%@",error);
    }];


}

-(void)showNewPlanWithCount:(NSInteger)count
{
    // 1.创建一个按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // .把按钮插到self.navigationController.view下面
    [self.navigationController.view insertSubview:btn belowSubview:self.navigationController.navigationBar];
    
    NSLog(@"rmrmrmr------%@",self.navigationController.view);
    
    // 2.设置图片文字
    btn.userInteractionEnabled = NO;
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    if (count < 5) {
        
        NSString *title = [NSString stringWithFormat:@"共有%ld条计划",count];
        [btn setTitle:title forState:UIControlStateNormal];
        
    }else {
    
        [btn setTitle:@"没有新计划" forState:UIControlStateNormal];
    }
    
    // 3 设置按钮的初始frame
    CGFloat btnH = 30;
    CGFloat btnY = 64 - btnH;
    CGFloat btnW = PHONE_UISCREEN_WIDTH;
    CGFloat btnX = 0;
    btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    [UIView animateWithDuration:1.0 animations:^{
        
        btn.transform = CGAffineTransformMakeTranslation(0, btnH + 2);
    }completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1.0 animations:^{
            
            btn.transform = CGAffineTransformIdentity;

        }completion:^(BOOL finished) {
            
            [btn removeFromSuperview];
        }];
        
    }];
    
}

#pragma mark - 获取联系人的拜访计划
-(void)getContractPlanVisitDataWithStart:(NSString *)start limit:(NSString *)limit
{
    isAll = NO;
    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,VisitPlanList];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@",@"start=",start,@"&limit=",limit];
    
    NSString *conUrl = [NSString stringWithFormat:@"%@%@",url,urlStr];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *dict = @{@"conId":self.contractIdStr};
    
    [manager POST:conUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"------%@",[responseObject JSONString]);
        
        if (pages == 0) {
            
            [self.dataList removeAllObjects];
        }
        
        PlanBaseClass *baseModel = [[PlanBaseClass alloc]initWithDictionary:responseObject];
        
        visitAllNum = baseModel.data.total;
        
        if (baseModel.success) {
            
            if (baseModel.data.datalist.count == 0) {
                
                [[Session sharedSession].tpView presentMessageTips:@"没有计划"];

            } else {
                
                for (int i = 0; i < baseModel.data.datalist.count; i++) {
                    
                    [self.dataList addObject:[baseModel.data.datalist objectAtIndex:i]];

                }
                
                NSString *allNums = [NSString stringWithFormat:@"总共%ld条",(long)visitAllNum];
                NSString *readNum = [NSString stringWithFormat:@"已加载%ld条",(unsigned long)self.dataList.count];
                self.VisitPlanTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@%@",allNums,readNum];
                
//#pragma mark - 先把原来的数组清空
//                [self.dataList removeAllObjects];
//                
//#pragma mark - 把新的数组加到原来的数组
//                [self.dataList addObjectsFromArray:self.contactPlanArray];
                
            }
        }
        
        [self.VisitPlanTable headerEndRefreshing];
        [self.VisitPlanTable footerEndRefreshing];
        [self.VisitPlanTable reloadData];

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        [self.VisitPlanTable headerEndRefreshing];
        [self.VisitPlanTable footerEndRefreshing];
        [self.VisitPlanTable reloadData];

        NSLog(@"%@",error);
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"VisitPlanCellIdtenfier";
    
    VisitPlanCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[VisitPlanCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    NSLog(@"---%lu",(unsigned long)self.dataList.count);

    PlanDatalist *listModel = [self.dataList objectAtIndex:indexPath.row];
    
#pragma mark - cell里公开个属性判断点击的哪个cell
    cell.touchRow = indexPath.row;
    
    
    // 开始时间
    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:listModel.starttime /1000];
    NSString *startStr = [DateUtils getStringDateByDate:startDate dateFormat:@"yyyy-MM-dd-HH:mm"];
    NSString *str = [NSString stringWithFormat:@"%@ %@",startStr,@"-"];
    
    
    // 结束时间
    NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:listModel.endtime /1000];
    NSString *endStr = [DateUtils getStringDateByDate:endDate dateFormat:@"yyyy-MM-dd-HH:mm"];
    
    self.cusId = listModel.cusId;
#pragma mark - 计划归档时用到的计划的id
    cell.visitId = listModel.datalistIdentifier;
    cell.nameLabel.text = listModel.ownerName;
    cell.stateLabel.text = listModel.statusName;
    cell.timeLabel.text = listModel.created_Datetime;
    cell.contentLabel.text = listModel.plaTitle;
    cell.TiXingTime.text = str;
    cell.TiXingTime2.text = endStr;
    cell.customerLabel.text = listModel.cusFullname;
    cell.contractLabel.text = listModel.conName;
    cell.delegate = self;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}

#pragma mark - 600回复  601跟进   602提醒   603取消 604归档  planId计划的id  总结button的点击：当把cell上的button设置为不可点击的时候，在点击button会走didSelectRowAtIndexPath也就是相当于点击的cell
- (void)swithVisitPlanCell:(VisitPlanCell *)cell buttonWithTag:(NSInteger)tag idStr:(NSString *)planId row:(NSInteger)selectRow
{
    
    PlanDatalist *model = [self.dataList objectAtIndex:selectRow];
    
    if (tag == 600) {
        
        PlanDatalist *model = [self.dataList objectAtIndex:selectRow];
        
        FollowController *follow = [[FollowController alloc]init];
        follow.customerIDStr = model.cusId;
        follow.customerNameStr = model.cusFullname;
        follow.contactIdStr = model.conId;
        follow.contactNameStr = model.conName;
        follow.ownerNameStr = model.ownerName;
        follow.visitTitleStr = model.text;
        follow.relBusiIdStr = planId;
        follow.relBusiNameStr = model.cusFullname;
        
        
        if ([model.statusName isEqualToString:@"取消"]) {
            
            [[Session sharedSession].tpView presentMessageTips:@"已取消"];
            
            return;
        }
        
        if ([model.statusName isEqualToString:@"归档"]) {
            
            
            [[Session sharedSession].tpView presentMessageTips:@"已归档"];
            return;
        }
        
        [self.navigationController pushViewController:follow animated:YES];
        

//        NSLog(@"回复按钮点击了");
//        PlanReplyController *planReply = [[PlanReplyController alloc]init];
//        [self.navigationController pushViewController:planReply animated:YES];
        
    }else if (tag== 601){
        
        CancelPlanController *cancelPlan = [[CancelPlanController alloc]init];
        cancelPlan.cancelPlanID = planId;
        
        if ([model.statusName isEqualToString:@"取消"]) {
            
            [[Session sharedSession].tpView presentMessageTips:@"已取消"];
            return;
        }
        
        if ([model.statusName isEqualToString:@"归档"]) {
            
            [[Session sharedSession].tpView presentMessageTips:@"已归档"];
            return;
        }
        
        [self.navigationController pushViewController:cancelPlan animated:YES];

        
    }else if (tag == 602){
    
//        NSLog(@"提醒按钮点击了");
//        TiXingController *tixing = [[TiXingController alloc]init];
//        tixing.planIdtenfier = planId;
//        [self.navigationController pushViewController:tixing animated:YES];

        
        if ([model.statusName isEqualToString:@"取消"]) {
            
            [[Session sharedSession].tpView presentMessageTips:@"已取消"];
            return;
        }
        
        
        if ([model.statusName isEqualToString:@"归档"]) {
            
            [[Session sharedSession].tpView presentMessageTips:@"已归档"];
            return;
        }
        
        
        PlanArchiveController *planArchive = [[PlanArchiveController alloc]init];
        planArchive.visitId = planId;
        [self.navigationController pushViewController:planArchive animated:YES];
        

    }else if (tag == 603){
    
        
    
    }else if (tag == 604) {
        
    
    }

}
//Initialize
-(CLWeeklyCalendarView *)calendarView
{
    if(!_calendarView){
        _calendarView = [[CLWeeklyCalendarView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, CALENDER_VIEW_HEIGHT)];
        _calendarView.delegate = self;
    }
    return _calendarView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    PlanDatalist *listModel = [self.dataList objectAtIndex:indexPath.row];
    PlanDetailController *planDeail = [[PlanDetailController alloc]init];
    planDeail.visitIdStr = listModel.datalistIdentifier;
    [self.navigationController pushViewController:planDeail animated:YES];
}


#pragma mark - CLWeeklyCalendarViewDelegate
-(NSDictionary *)CLCalendarBehaviorAttributes
{
    return @{
             CLCalendarWeekStartDay : @2,                 //Start Day of the week, from 1-7 Mon-Sun -- default 1
                          CLCalendarDayTitleTextColor : [UIColor yellowColor],
                          CLCalendarSelectedDatePrintColor : [UIColor greenColor],
             };
}


@end
