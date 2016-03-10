//
//  PlanDetailController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "PlanDetailController.h"
#import "ContactResultController.h" // 联络纪录

#import "PlanDeailsCell.h"

#import "AFNetworking.h"

#import "PlanDeailsBaseClass.h"
#import "PlanDeailsData.h"

@interface PlanDetailController () <UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong)PlanDeailsBaseClass *baseModel;


@property (nonatomic, strong)UITableView *PlanDeailsTable;

@property (nonatomic, strong)NSArray *titleArray;

@property (nonatomic, strong)NSDictionary *canYuDict;
@end

@implementation PlanDetailController

-(UITableView *)PlanDeailsTable
{
    if (!_PlanDeailsTable) {
        
        _PlanDeailsTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64)];
        _PlanDeailsTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _PlanDeailsTable.dataSource = self;
        _PlanDeailsTable.delegate = self;
    }
    return _PlanDeailsTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"计划明细";

    [self.view addSubview:self.PlanDeailsTable];
    self.view.backgroundColor = RGB(227, 227, 227);
    
    self.titleArray = @[@"标题",@"事项",@"开始时间",@"结束时间",@"内容",@"负责人",@"参与人",@"方式",@"客户",@"联系人",@"业务类型",@"相关业务",@"地址/电话",@"状态"];
    
    UIButton *VisitRerod = [UIButton buttonWithType:UIButtonTypeCustom];
    [VisitRerod setTitle:@"联络纪录" forState:UIControlStateNormal];
    VisitRerod.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 50);
    VisitRerod.titleLabel.font = [UIFont systemFontOfSize:14];
    [VisitRerod setTitleColor:RGB(0, 195, 236) forState:UIControlStateNormal];
    VisitRerod.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [VisitRerod addTarget:self action:@selector(ClcikContractRerodButton) forControlEvents:UIControlEventTouchUpInside];
    self.PlanDeailsTable.tableFooterView = VisitRerod;
    
    [self getCanYuNameData];
    
    // 获取计划详情数据
    [self getVisitDeailsData];
    
}

-(void)ClcikContractRerodButton
{
    ContactResultController *conReord = [[ContactResultController alloc]init];
    conReord.conRecord = @"拜访计划下的联络纪录";
    conReord.planId = self.visitIdStr;
    conReord.cusId = self.baseModel.data.cusId;
    conReord.status = self.baseModel.data.statusName;
    conReord.cusName = self.baseModel.data.cusFullname;
    [self.navigationController pushViewController:conReord animated:YES];
}

-(void)getCanYuNameData
{
    NSString *canYuUrl = [NSString stringWithFormat:@"%@%@",MAINURL,@"/myplan/salvisitplan/query"];
    
    NSDictionary *dict = @{@"plaId":self.visitIdStr};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:canYuUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"------%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dataDict = [responseObject objectForKey:@"data"];
            
            NSArray *dataArray = [dataDict objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i++) {
                
                self.canYuDict = [dataArray objectAtIndex:i];
            }
        }
        
        [self.PlanDeailsTable reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];


}


-(void)getVisitDeailsData
{
    [[Session sharedSession].loadView StartLoading];
    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,VISITDEAILS];
    
    NSDictionary *dict = @{@"id":self.visitIdStr};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        [[Session sharedSession].loadView StopLoading];
        
        self.baseModel = [[PlanDeailsBaseClass alloc]initWithDictionary:responseObject];
        
        if (self.baseModel.success) {
                        
        }
        
        [self.PlanDeailsTable reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [[Session sharedSession].loadView StopLoading];
        
        NSLog(@"%@",error);
    }];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"planDeailsCellIdtenfier";
    
    PlanDeailsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[PlanDeailsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.titleLabel.text = [self.titleArray objectAtIndex:indexPath.row];
    
    // 开始时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.baseModel.data.starttime /1000];
    NSString *startDate = [DateUtils getStringDateByDate:date dateFormat:@"yyyy-MM-dd HH:mm"];

    
    // 结束时间
    NSDate *enddate = [NSDate dateWithTimeIntervalSince1970:self.baseModel.data.endtime /1000];
    NSString *timeDate = [DateUtils getStringDateByDate:enddate dateFormat:@"yyyy-MM-dd HH:mm"];
    
    switch (indexPath.row) {


        case 0:
            cell.contentLabel.text = self.baseModel.data.text;
            break;
        case 1:
            cell.contentLabel.text = self.baseModel.data.busiTypeName;
            break;
        case 2:
            cell.contentLabel.text = startDate;
            break;
        case 3:
            cell.contentLabel.text = timeDate;
            break;
        case 4:
            cell.contentLabel.text = self.baseModel.data.plaContent;
            break;
        case 5:
            cell.contentLabel.text = self.baseModel.data.ownerName;
            break;
        case 6:
            cell.contentLabel.text = [self.canYuDict objectForKey:@"employeeName"];
            
            break;
        case 7:
            cell.contentLabel.text = self.baseModel.data.contactTypeName;
            break;
        case 8:
            cell.contentLabel.text = self.baseModel.data.cusFullname;
            break;
        case 9:
            cell.contentLabel.text = self.baseModel.data.conName;
            break;
        case 10:
            cell.contentLabel.text = self.baseModel.data.relBusiTypeName;
            break;
        case 11:
            cell.contentLabel.text = self.baseModel.data.cusFullname;
            break;
        case 12:
            cell.contentLabel.text = self.baseModel.data.contactContent;
            break;
        case 13:
            cell.contentLabel.text = self.baseModel.data.statusName;
        default:
            break;
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}



@end
