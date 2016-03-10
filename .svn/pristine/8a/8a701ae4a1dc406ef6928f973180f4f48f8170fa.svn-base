//
//  BusinessController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/19.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "BusinessController.h"
#import "BusinessCell.h"

#import "AFNetworking.h"
#import "MJRefresh.h"

@interface BusinessController () <UITableViewDataSource,UITableViewDelegate>

{
    __block NSInteger page;
    __block NSInteger allNum;
}

@property (nonatomic, strong)UITableView *businessTable;

@property (nonatomic, strong)NSArray *dataArray;
@end

@implementation BusinessController

-(UITableView *)businessTable
{
    if (!_businessTable) {
        
        _businessTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40)];
        _businessTable.dataSource = self;
        _businessTable.delegate = self;
        _businessTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _businessTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.title = @"歇业安排";
    
    page = 0;
    
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.businessTable];
    self.businessTable.backgroundColor = [UIColor clearColor];
    
    [self setupRefresh];
}

-(void)setupRefresh
{
    //1.下拉刷新（进入刷新状态就会调用self的headerRereshing）
    //    [self.tableView addHeaderWithTarget:self.tableView action:@selector(headerRereshing)];
    
    __unsafe_unretained typeof(self) myvc = self;
    
    [myvc.businessTable addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0)), dispatch_get_main_queue(), ^{
            
   
            
            page = 0;
            [myvc getBusinessDataWithStart:[NSString stringWithFormat:@"%ld",(long)page] limit:@"15"];
            // 刷新表格
            [self.businessTable reloadData];
        });
        
    }];
    
    [self.businessTable headerBeginRefreshing];
    
    //上拉刷新
    [myvc.businessTable addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 刷新表格
            page += 15;
            
            if (self.dataArray.count < page) {
                
                [[Session sharedSession].tpView presentFailureTips:@"已无更多数据"];
                
                [self.businessTable footerEndRefreshing];
                
                
            }else{
                
                [myvc getBusinessDataWithStart:[NSString stringWithFormat:@"%ld",(long)page] limit:@"15"];
            }
            
        });
    }];
    
    //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）

}


-(void)getBusinessDataWithStart:(NSString *)start limit:(NSString *)limit
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",MAINURL,@"customer/closeBusiness/pageQuery?"];
    
    NSString *Str = [NSString stringWithFormat:@"%@%@%@%@",@"start=",start,@"&limit=",limit];
    NSString *url = [NSString stringWithFormat:@"%@%@",urlStr,Str];

    
    NSDictionary *dict = @{@"customerId":self.cusId};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"------%@",[responseObject JSONString]);
        
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dataDict = [responseObject objectForKey:@"data"];
            
            self.dataArray = [dataDict objectForKey:@"data"];
            allNum = self.dataArray.count;
        }
        
        //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）
        NSString *allpages = [NSString stringWithFormat:@"总共%ld条",(long)allNum];
        NSString *yiPages = [NSString stringWithFormat:@"已加载%ld条",(unsigned long)[self.dataArray count]];
        self.businessTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@ %@",allpages,yiPages];
        
        [self.businessTable headerEndRefreshing];
        [self.businessTable footerEndRefreshing];
        [self.businessTable reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [self.businessTable headerEndRefreshing];
        [self.businessTable footerEndRefreshing];
        [self.businessTable reloadData];

        NSLog(@"%@",error);
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"businessCellId";
    
    BusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[BusinessCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    NSDictionary *dict = [self.dataArray objectAtIndex:indexPath.row];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[[dict objectForKey:@"starttime"]doubleValue] / 1000];
    NSString *startTime = [DateUtils getStringDateByDate:date dateFormat:@"yyyy-MM-dd"];
    
    NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:[[dict objectForKey:@"endtime"]doubleValue] / 1000];
    NSString *endTime = [DateUtils getStringDateByDate:endDate dateFormat:@"yyyy-MM-dd"];
    
    cell.titleLabel.text = [dict objectForKey:@"ofbTypeIdName"];
    cell.startTimeLabel.text = startTime;
    cell.endTimeLabel.text = endTime;
    cell.shuoMingLabel.text = [dict objectForKey:@"description"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
