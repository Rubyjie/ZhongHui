//
//  EmployeesController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/6.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "EmployeesController.h"
#import "EmployeesCell.h"

#import "EmpDataModels.h"

#import "AFNetworking.h"
#import "MJRefresh.h"

@interface EmployeesController () <UITableViewDataSource,UITableViewDelegate>

{
    __block NSInteger pages;
    __block NSInteger empAllPages;
}

@property (nonatomic, strong)UITableView *empTable;

@property (nonatomic, strong)NSMutableArray *empArray;     // 存放联系人员工的数组
@property (nonatomic, strong)NSMutableArray *cusEmpArray;  // 存放客户员工的数组

@end

@implementation EmployeesController

-(NSMutableArray *)cusEmpArray
{
    if (!_cusEmpArray) {
        
        _cusEmpArray = [NSMutableArray array];
    }
    return _cusEmpArray;
}

-(NSMutableArray *)empArray
{
    if (!_empArray) {
        
        _empArray = [NSMutableArray array];
    }
    return _empArray;
}

-(UITableView *)empTable
{
    if (!_empTable) {
        
        _empTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64-40)];
        _empTable.dataSource = self;
        _empTable.delegate = self;
        _empTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _empTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    pages = 0;
    
    self.view.backgroundColor = RGB(227, 227, 227);
    
    [self.view addSubview:self.empTable];
    self.empTable.backgroundColor = [UIColor clearColor];
    
    if ([self.empType isEqualToString:@"客户员工"]) {
        
        // 获取客户的员工
        [self setupCusEmpDataRefresh];
        
    }else{
    
        [self setupRefresh];
        
    }

}

-(void)setupCusEmpDataRefresh
{
    __unsafe_unretained typeof(self) myvc = self;
    
    [myvc.empTable addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0)), dispatch_get_main_queue(), ^{
            
            // 获取线索跟踪列表数据
            pages = 0;
            
            [myvc getCusEmploeeysDataWithStart:[NSString stringWithFormat:@"%ld",(long)pages] limit:@"15"];
        });
        
    }];
    
    [self.empTable headerBeginRefreshing];
    
    //上拉刷新
    [myvc.empTable addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 刷新表格
            pages += 15;
            
            if (self.cusEmpArray.count < pages) {
                
                [[Session sharedSession].tpView presentFailureTips:@"已无更多数据"];
                
                [self.empTable footerEndRefreshing];
                
            }else{
                
                [myvc getCusEmploeeysDataWithStart:[NSString stringWithFormat:@"%ld",(long)pages] limit:@"15"];
                
            }
        });
        
    }];

}


-(void)getCusEmploeeysDataWithStart:(NSString *)start limit:(NSString *)limit
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"clue/salClue/pageQueryEmp?"];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@",@"start=",start,@"&limit=",limit];
    
    NSString *mainUrl = [NSString stringWithFormat:@"%@%@",url,urlStr];
    
    NSDictionary *dict = @{@"cusId":self.cusId};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:mainUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"----%@",[responseObject JSONString]);
        
        if (pages == 0) {
            
            [self.cusEmpArray removeAllObjects];
        }
        
        empBaseClass *baseModel = [[empBaseClass alloc]initWithDictionary:responseObject];
        
        empAllPages = baseModel.data.total;
        
        if (baseModel.success) {
            
            if (baseModel.data.datalist.count == 0) {
                
                [[Session sharedSession].tpView presentMessageTips:@"没有员工"];
                
            }else {
                
                for (int i = 0; i< baseModel.data.datalist.count; i++) {
                    
                    [self.cusEmpArray addObject:[baseModel.data.datalist objectAtIndex:i]];
                }
                
            }
            
            [self.empArray removeAllObjects];
            [self.empArray addObjectsFromArray:self.cusEmpArray];
            
            //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）
            NSString *allpages = [NSString stringWithFormat:@"总共%ld条",(long)empAllPages];
            NSString *yiPages = [NSString stringWithFormat:@"已加载%ld条",(unsigned long)[self.cusEmpArray count]];
            self.empTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@ %@",allpages,yiPages];
        }
        
        [self.empTable headerEndRefreshing];
        [self.empTable footerEndRefreshing];
        [self.empTable reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [self.empTable headerEndRefreshing];
        [self.empTable footerEndRefreshing];
        [self.empTable reloadData];
        
        NSLog(@"%@",error);
    }];



}

-(void)setupRefresh{
    
    //1.下拉刷新（进入刷新状态就会调用self的headerRereshing）
    
    __unsafe_unretained typeof(self) myvc = self;
    
    [myvc.empTable addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0)), dispatch_get_main_queue(), ^{
            
            // 获取线索跟踪列表数据
            pages = 0;
            
            [myvc getEmploeeysDataWithStart:[NSString stringWithFormat:@"%ld",(long)pages]  limit:@"15"];
        });
        
    }];
    
    [self.empTable headerBeginRefreshing];
    
    //上拉刷新
    [myvc.empTable addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 刷新表格
            pages += 15;
            
            if (self.empArray.count < pages) {
                
                [[Session sharedSession].tpView presentFailureTips:@"已无更多数据"];
                
                [self.empTable footerEndRefreshing];
                
            }else{
                
                [myvc  getEmploeeysDataWithStart:[NSString stringWithFormat:@"%ld",(long)pages] limit:@"15"];
                
            }
        });
        
    }];
    
}


#pragma mark - 联系人下的员工
-(void)getEmploeeysDataWithStart:(NSString *)start limit:(NSString *)limit
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"customer/contactEmployee/query?"];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@",@"start=",start,@"&limit=",limit];
    
    NSString *mainUrl = [NSString stringWithFormat:@"%@%@",url,urlStr];
    
    NSDictionary *dict = @{@"empConId":self.conId};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:mainUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"----%@",[responseObject JSONString]);
        
        if (pages == 0) {
            
            [self.empArray removeAllObjects];
        }
        
        empBaseClass *baseModel = [[empBaseClass alloc]initWithDictionary:responseObject];
        
        empAllPages = baseModel.data.total;
        
        if (baseModel.success) {
            
            if (baseModel.data.datalist.count == 0) {
                
                [[Session sharedSession].tpView presentMessageTips:@"没有员工"];
                
            }else {
            
                for (int i = 0; i< baseModel.data.datalist.count; i++) {
                    
                    [self.empArray addObject:[baseModel.data.datalist objectAtIndex:i]];
                }
            
            }
            
            //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）
            NSString *allpages = [NSString stringWithFormat:@"总共%ld条",(long)empAllPages];
            NSString *yiPages = [NSString stringWithFormat:@"已加载%ld条",(unsigned long)[self.empArray count]];
            self.empTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@ %@",allpages,yiPages];
        }
        
        [self.empTable headerEndRefreshing];
        [self.empTable footerEndRefreshing];
        [self.empTable reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [self.empTable headerEndRefreshing];
        [self.empTable footerEndRefreshing];
        [self.empTable reloadData];

        NSLog(@"%@",error);
    }];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.empArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *empCellID = @"empCellIdtifier";
    
    EmployeesCell *cell = [tableView dequeueReusableCellWithIdentifier:empCellID];
    
    if (!cell) {
        
        cell = [[EmployeesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:empCellID];
    }
    
    empDatalist *listModel = [self.empArray objectAtIndex:indexPath.row];
    cell.empLabel.text = listModel.employeeName;
    cell.numLabel.text = listModel.employeeCode;
    cell.zhiWeiLabel.text = listModel.position;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}




@end
