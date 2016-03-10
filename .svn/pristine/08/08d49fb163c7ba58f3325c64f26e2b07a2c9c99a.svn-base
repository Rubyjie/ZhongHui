//
//  ContactResultController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/23.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ContactResultController.h"
#import "AddConRecordController.h"      // 添加联络记录
#import "VisitAddConRecordController.h" // 拜访计划的添加联络记录

#import "ContractResultCell.h"

#import "AFNetworking.h"
#import "UserDefault.h"
#import "MJRefresh.h"

#import "ResultBaseClass.h"
#import "ResultData.h"
#import "ResultDatalist.h"

@interface ContactResultController () <UITableViewDataSource,UITableViewDelegate>

{
    __block NSInteger page;
    __block NSInteger allNums;

}

@property (nonatomic, strong)CALayer *layer;





@property (nonatomic, strong)UITableView *resultTable;

#pragma  mark - 存放联系人下的拜访记录的数组
@property (nonatomic, strong)NSMutableArray *resultArray;

#pragma  mark - 存放线索下的拜访记录的数组
@property (nonatomic, strong)NSMutableArray *cluesRecordArray;

#pragma  mark - 存放客户下的联络记录的数组
@property (nonatomic, strong)NSMutableArray *cusRecordArray;

#pragma mark - 存放拜访计划下的联络纪录的数组
@property (nonatomic, strong)NSMutableArray *visitRecordArray;

@end



@implementation ContactResultController
//@synthesize resultArray;
//@dynamic property

-(NSMutableArray *)visitRecordArray
{
    if (!_visitRecordArray) {
        
        _visitRecordArray = [NSMutableArray array];
    }
    return _visitRecordArray;
}

-(NSMutableArray *)cusRecordArray
{
    if (!_cusRecordArray) {
        
        _cusRecordArray = [NSMutableArray array];
    }
    return _cusRecordArray;
}

-(NSMutableArray *)cluesRecordArray
{
    if (!_cluesRecordArray) {
        
        _cluesRecordArray = [NSMutableArray array];
    }

    return _cluesRecordArray;
}

-(NSMutableArray *)resultArray
{
    if (!_resultArray) {
        
        _resultArray = [NSMutableArray array];
    }
    return _resultArray;
}

-(UITableView*)resultTable
{
    if (!_resultTable) {
        
        _resultTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64)];
        _resultTable.dataSource = self;
        _resultTable.delegate = self;
        _resultTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _resultTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    page = 0;
    self.title = @"联络结果";
    [self.view addSubview:self.resultTable];
    self.resultTable.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = RGB(227, 227, 227);
    
    
    if ([self.status isEqualToString:@"待跟进"]) {
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"加号"] style:UIBarButtonItemStyleDone target:self action:@selector(addConRecord)];
        
    }else {
    
        self.navigationItem.rightBarButtonItem = nil;
    
    }

    
    
#pragma mark - 线索下添加联络纪录成功后的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(saveConRecord) name:@"ADDCONRECORD" object:nil];
    
    
#pragma mark - 拜访计划添加联络记录成功后的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(visitAddRecord) name:@"VISITPLANADDRECORD" object:nil];
    
    if ([self.visitRecord isEqualToString:@"线索的拜访记录"]) {
        
        // 获取线索下的拜访记录
        [self getCluesVisitRecord];
        self.resultTable.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64-40);

    }else if ([self.cusRecord isEqualToString:@"客户明细下的联络记录"]) {
    
        // 获取客户下的拜访记录
        [self getCustomerConRecordDataRefresh];
        self.resultTable.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64-40);
        
        self.navigationItem.rightBarButtonItem = nil;
    
    }else if ([self.conRecord isEqualToString:@"联系人明细下的联络结果"]) {
    
        // 联系人明细下的联络结果 和 联系人下的联络结果 一样
        [self setContractResultDataRefresh];
        
        self.resultTable.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64-40);
        
        self.navigationItem.rightBarButtonItem = nil;
        
    }else if ([self.conRecord isEqualToString:@"拜访计划下的联络纪录"]) {
    
        // 获取拜访计划下的拜访记录
        [self getVisitPlanConRecord];
    
    } else {
    
        // 联系人下的联络结果
        [self setContractResultDataRefresh];
        self.navigationItem.rightBarButtonItem = nil;

    }

}

-(void)addConRecord
{
    if ([self.conRecord isEqualToString:@"拜访计划下的联络纪录"]) {
        
        VisitAddConRecordController *visitAddRecord = [[VisitAddConRecordController alloc]init];
        visitAddRecord.planId = self.planId;
        visitAddRecord.cusName = self.cusName;
        visitAddRecord.cusId = self.cusId;
        [self.navigationController pushViewController:visitAddRecord animated:YES];

    }else{
        
        AddConRecordController *addConRecord = [[AddConRecordController alloc]init];
        addConRecord.customerIDStr = self.cusId;
        addConRecord.customerNameStr = self.cusName;
        addConRecord.ownerNameStr = self.headName;
        addConRecord.cluesIdStr = self.cluId;
        [self.navigationController pushViewController:addConRecord animated:YES];
    }
}


#pragma mark - 拜访计划添加联络记录成功后的通知
-(void)visitAddRecord
{
    // 获取拜访计划下的拜访记录
    [self getVisitPlanConRecord];
}

#pragma mark - 线索下添加联络纪录成功后的通知
-(void)saveConRecord
{
    // 获取线索下的拜访记录
    [self getCluesVisitRecord];

}




#pragma mark - 获取拜访计划下的拜访记录
-(void)getVisitPlanConRecord
{
    //1.下拉刷新（进入刷新状态就会调用self的headerRereshing）
    
    __unsafe_unretained typeof(self) myvc = self;
    
    [myvc.resultTable addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0)), dispatch_get_main_queue(), ^{
            
            page = 0;
            [myvc getVisitPlanConRecordWithStart:[NSString stringWithFormat:@"%ld",(long)page] limit:@"15"];
        });
    }];
    
    [self.resultTable headerBeginRefreshing];
    
    //上拉刷新
    [myvc.resultTable addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 刷新表格
            page += 15;
            
            if (self.visitRecordArray.count < page) {
                
                [[Session sharedSession].tpView presentFailureTips:@"已无更多数据"];
                
                [self.resultTable footerEndRefreshing];
                
            }else{
                
                [myvc  getVisitPlanConRecordWithStart:[NSString stringWithFormat:@"%ld",(long)page] limit:@"15"];
                
            }
            
        });
        
    }];

}

-(void)getVisitPlanConRecordWithStart:(NSString *)start limit:(NSString *)limit
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,CONTRACTRESULT];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@",@"start=",start,@"&limit=",limit];
    
    NSString *conUrl = [NSString stringWithFormat:@"%@%@",url,urlStr];
    
    NSDictionary *dict = @{@"relBusiId":self.planId,@"relBusiType":@"SLL_VISITPLAN"};
    
    NSLog(@"-----%@",dict);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:conUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if (page == 0) {
            
            [self.visitRecordArray removeAllObjects];
        }
        
        ResultBaseClass *baseModel = [[ResultBaseClass alloc]initWithDictionary:responseObject];
        
        allNums = baseModel.data.total;
        
        if (baseModel.success) {
            
            if (baseModel.data.datalist.count == 0) {
                
                [[Session sharedSession].tpView presentMessageTips:@"无数据"];
                
            }else{
                
                for (int i = 0; i < baseModel.data.datalist.count; i++) {
                    
                    [self.visitRecordArray addObject:[baseModel.data.datalist objectAtIndex:i]];
                }
                
                [self.resultArray removeAllObjects];
                [self.resultArray addObjectsFromArray:self.visitRecordArray];

                
                //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）
                NSString *allpages = [NSString stringWithFormat:@"总共%ld条",(long)allNums];
                NSString *yiPages = [NSString stringWithFormat:@"已加载%ld条",(unsigned long)[self.resultArray count]];
                self.resultTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@ %@",allpages,yiPages];
            }
        }
        [self.resultTable headerEndRefreshing];
        [self.resultTable footerEndRefreshing];
        
        [self.resultTable reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        [self.resultTable headerEndRefreshing];
        [self.resultTable footerEndRefreshing];
        
        [self.resultTable reloadData];
        
        NSLog(@"---%@",error);
    }];



}


#pragma mark - 获取客户下的拜访记录
-(void)getCustomerConRecordDataRefresh
{
    //1.下拉刷新（进入刷新状态就会调用self的headerRereshing）
    
    __unsafe_unretained typeof(self) myvc = self;
    
    [myvc.resultTable addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0)), dispatch_get_main_queue(), ^{
            
            // 获取线索跟踪列表数据
            page = 0;
            [myvc getCustomerConRecordWithStart:[NSString stringWithFormat:@"%ld",(long)page] limit:@"15"];
        });
    }];
    
    [self.resultTable headerBeginRefreshing];
    
    //上拉刷新
    [myvc.resultTable addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 刷新表格
            page += 15;
            
            if (self.cusRecordArray.count < page) {
                
                [[Session sharedSession].tpView presentFailureTips:@"已无更多数据"];
                
                [self.resultTable footerEndRefreshing];
                
            }else{
                
                [myvc  getCustomerConRecordWithStart:[NSString stringWithFormat:@"%ld",(long)page] limit:@"15"];
                
            }
        });
        
    }];
}


#pragma mark - 获取联系人下的联络结果
-(void)setContractResultDataRefresh{
    
    //1.下拉刷新（进入刷新状态就会调用self的headerRereshing）
    
    __unsafe_unretained typeof(self) myvc = self;
    
    [myvc.resultTable addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0)), dispatch_get_main_queue(), ^{
            
            // 获取线索跟踪列表数据
            page = 0;
            [myvc getContractResultDataWithStart:[NSString stringWithFormat:@"%ld",(long)page] limit:@"15"];
        });
    }];
    
    [self.resultTable headerBeginRefreshing];
    
    //上拉刷新
    [myvc.resultTable addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 刷新表格
            page += 15;
            
            if (self.resultArray.count < page) {
                
                [[Session sharedSession].tpView presentFailureTips:@"已无更多数据"];
                
                [self.resultTable footerEndRefreshing];
                
            }else{
                
                [myvc  getContractResultDataWithStart:[NSString stringWithFormat:@"%ld",(long)page]limit:@"15"];
                
            }
        });
        
    }];
    
}



// 获取线索下的拜访记录
-(void)getCluesVisitRecord
{
    
    [[Session sharedSession].loadView StartLoading];
    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,QITACONTRACT];
    
    NSDictionary *dict = @{@"cusId":self.cusId,@"relBusiType":@"SLL_CLUE",@"relBusiId":self.cluId};
    
    NSLog(@"-----%@",dict);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [[Session sharedSession].loadView StopLoading];
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        ResultBaseClass *baseModel = [[ResultBaseClass alloc]initWithDictionary:responseObject];
        
#pragma mark - 第二次进的时候先清数组
        [self.cluesRecordArray removeAllObjects];
        
        if (baseModel.success) {
            
            if (baseModel.data.datalist.count == 0) {
                
                [[Session sharedSession].tpView presentMessageTips:@"无数据"];
                
            }else{
                
                for (int i = 0; i < baseModel.data.datalist.count; i++) {
                    
                    [self.cluesRecordArray addObject:[baseModel.data.datalist objectAtIndex:i]];
                }
                
                [self.resultArray removeAllObjects];
                [self.resultArray addObjectsFromArray:self.cluesRecordArray];
                
            }
        }
        
        [self.resultTable reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [[Session sharedSession].loadView StopLoading];
        
        NSLog(@"---%@",error);
    }];



}

// 获取客户下的拜访记录
-(void)getCustomerConRecordWithStart:(NSString *)start limit:(NSString *)limit
{

    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,CONTRACTRESULT];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@",@"start=",start,@"&limit=",limit];
    
    NSString *mianUrl = [NSString stringWithFormat:@"%@%@",url,urlStr];
    
    NSDictionary *dict = @{@"cusId":self.cusId};
    
    NSLog(@"-----%@",dict);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:mianUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if (page == 0) {
            
            [self.cusRecordArray removeAllObjects];
        }
        
        ResultBaseClass *baseModel = [[ResultBaseClass alloc]initWithDictionary:responseObject];
        
        allNums = baseModel.data.total;
        
        if (baseModel.success) {
            
            if (baseModel.data.datalist.count == 0) {
                
                [[Session sharedSession].tpView presentMessageTips:@"无数据"];
                
            }else{
                
                for (int i = 0; i < baseModel.data.datalist.count; i++) {
                    
                    [self.cusRecordArray addObject:[baseModel.data.datalist objectAtIndex:i]];
                }
                
                [self.resultArray removeAllObjects];
                [self.resultArray addObjectsFromArray:self.cusRecordArray];
            }
            
            //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）
            NSString *allpages = [NSString stringWithFormat:@"总共%ld条",(long)allNums];
            NSString *yiPages = [NSString stringWithFormat:@"已加载%ld条",(unsigned long)[self.resultArray count]];
            self.resultTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@ %@",allpages,yiPages];
        }
        
        [self.resultTable headerEndRefreshing];
        [self.resultTable footerEndRefreshing];

        [self.resultTable reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [self.resultTable headerEndRefreshing];
        [self.resultTable footerEndRefreshing];
        
        [self.resultTable reloadData];
        
        
        NSLog(@"---%@",error);
    }];

}

// 联系人下的拜访记录
-(void)getContractResultDataWithStart:(NSString *)start limit:(NSString *)limit
{
    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,QITACONTRACT];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@",@"start=",start,@"&limit=",limit];
    
    NSString *conUrl = [NSString stringWithFormat:@"%@%@",url,urlStr];
    
    NSDictionary *dict = @{@"conId":self.nameId};
    
    NSLog(@"-----%@",dict);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:conUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if (page == 0) {
            
            [self.resultArray removeAllObjects];
        }
        
        ResultBaseClass *baseModel = [[ResultBaseClass alloc]initWithDictionary:responseObject];
        
        allNums = baseModel.data.total;
        
        if (baseModel.success) {
            
            if (baseModel.data.datalist.count == 0) {
                
                [[Session sharedSession].tpView presentMessageTips:@"无数据"];
                
            }else{
                
                for (int i = 0; i < baseModel.data.datalist.count; i++) {
                    
                    [self.resultArray addObject:[baseModel.data.datalist objectAtIndex:i]];
                }
                
                //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）
                NSString *allpages = [NSString stringWithFormat:@"总共%ld条",(long)allNums];
                NSString *yiPages = [NSString stringWithFormat:@"已加载%ld条",(unsigned long)[self.resultArray count]];
                self.resultTable.footerPullToRefreshText = [NSString stringWithFormat:@"%@ %@",allpages,yiPages];
            }
        }
        [self.resultTable headerEndRefreshing];
        [self.resultTable footerEndRefreshing];

        [self.resultTable reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        [self.resultTable headerEndRefreshing];
        [self.resultTable footerEndRefreshing];
        
        [self.resultTable reloadData];

        NSLog(@"---%@",error);
    }];

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.resultArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"contractCellIdtenfier";
    
    ContractResultCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[ContractResultCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }

    if (self.resultArray.count > 0) {
        
        ResultDatalist *listModel = [self.resultArray objectAtIndex:indexPath.row];
        
#pragma mark - 联络时间
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:listModel.createdDatetime / 1000];
        NSString *contractDate = [DateUtils getStringDateByDate:date dateFormat:@"yyyy-MM-dd HH:mm"];
        
//        if (listModel.contactContent.length < 1) {
//            
//            listModel.contactContent = @"    ";
//        }
        
        [cell setConName:listModel.ownerName contractTime:contractDate contractResult:listModel.contactResultName yuanYin:listModel.resultReason shuoMing:listModel.datalistDescription];

    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ResultDatalist *model = [self.resultArray objectAtIndex:indexPath.row];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:model.contactTime / 1000];
    NSString *contractDate = [DateUtils getStringDateByDate:date dateFormat:@"yyyy-MM-dd"];
    
#pragma mark  根据传进来的字符串返回cell的高度
    return [ContractResultCell getCellheightWithConName:model.ownerName conTime:contractDate conRsult:model.contactResult yuanYin:model.resultReason shuoMing:model.datalistDescription];
}





@end
