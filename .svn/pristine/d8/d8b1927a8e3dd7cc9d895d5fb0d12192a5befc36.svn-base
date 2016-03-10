//
//  CustomerDeilsController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/24.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CustomerDeilsController.h"
#import "CustomerDeailsCell.h"
#import "TopView.h"

#import "AFNetworking.h"
//#import "deailsBaseClass.h"
//#import "deailsData.h"

@interface CustomerDeilsController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *deailsTabel;

@property (nonatomic, strong)NSArray *titleArray;

@property (nonatomic, strong)NSMutableArray *dataList;

@end

@implementation CustomerDeilsController



-(NSMutableArray *)dataList
{
    if (!_dataList) {
        
        _dataList = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _dataList;
}

-(UITableView *)deailsTabel
{
    if (!_deailsTabel) {
        
        _deailsTabel = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64)];
        _deailsTabel.dataSource = self;
        _deailsTabel.delegate = self;
    }
    return _deailsTabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getCustomerDeailsData];

    self.title = @"客户详情";
    self.titleArray = @[@"客户名称",@"客户编码",@"所属集团",@"星级",@"用户性质",@"地址",@"客户类型",@"管理方",@"开业时间",@"状态",@"备注"];
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.deailsTabel];
    TopView *view = [[TopView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 30)];
    view.backgroundColor = [UIColor grayColor];
    self.deailsTabel.tableHeaderView = view;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellId = @"deailsCellIdentfier";
    
    CustomerDeailsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    
    if (!cell) {
        
        cell = [[CustomerDeailsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    
    cell.titleLabel.text = self.titleArray[indexPath.row];
    
    NSDictionary *dict = [self.dataList firstObject];
    
   

    switch (indexPath.row) {
        case 0:
            cell.ctentLabel.text = [dict objectForKey:@"cusFullName"];
            break;
        case 1:
            cell.ctentLabel.text = [dict objectForKey:@"cusCode"];
            break;
       case 2:
            cell.ctentLabel.text = [dict objectForKey:@"managerPartyName"];
            break;
        case 3:
            cell.ctentLabel.text = [dict objectForKey:@"startLevelName"];
            break;
        case 4:
            cell.ctentLabel.text = [dict objectForKey:@"userNatureName"];
            break;
        case 5:
            cell.ctentLabel.text = [dict objectForKey:@"regionAddr"];
            break;
        case 6:
            cell.ctentLabel.text = [dict objectForKey:@"cusTypeName"];
            break;
        
        case 7:
            cell.ctentLabel.text = [dict objectForKey:@"managerPartyName"];
            break;
        case 8:
//            cell.ctentLabel.text = [dict objectForKey:@"createdDatetime"];
            break;
        case 9:
            cell.ctentLabel.text = [dict objectForKey:@"status"];
            break;
        case 10:
            cell.ctentLabel.text = [dict objectForKey:@"description"];
            break;
        default:
            break;
    }
    return cell;
}


-(void)getCustomerDeailsData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,CUSTONERDEAILS];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *dict = @{@"id":self.customerId};
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dict = [responseObject objectForKey:@"data"];
            
            NSArray *dataArray = [dict objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dataDict = [dataArray objectAtIndex:i];
                
                [self.dataList addObject:dataDict];
            }
        }

        [self.deailsTabel reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    

}



@end
