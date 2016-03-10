//
//  CluesXQController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/25.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CluesXQController.h"
#import "CluesXQCell.h"

#import "AFNetworking.h"

#import "CluesXqBaseClass.h"
#import "CluesXqData.h"

@interface CluesXQController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *myTableView;

@property (nonatomic, strong)NSArray *titleArray;

@property (nonatomic, strong)CluesXqBaseClass *base;
@end

@implementation CluesXQController

-(UITableView *)myTableView
{
    if (!_myTableView) {
        
        _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64-40)];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
    }
    return _myTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.titleArray= @[@"客户名称",@"星级",@"类型",@"所属集团",@"用户性质",@"经营性质",@"酒店属性",@"酒店规模",@"携程类型",@"管理公司",@"来源名称",@"所在区域",@"详细地址",@"来源类型",@"发现时间",@"归属业态",@"归属机构",@"负责人",@"发现人",@"状态",@"说明"];

    self.view.backgroundColor = RGB(227, 227, 227);
    
    [self.view addSubview:self.myTableView];
    
    [self getCluesDeailsData];
}

-(void)getCluesDeailsData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,CLUESDEAILS];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"id":self.cluesId};
    
    [manager GET:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"----%@",[responseObject JSONString]);
        
       self.base = [[CluesXqBaseClass alloc]initWithDictionary:responseObject];
        
        if (self.base.success) {
            
            self.cusId = self.base.data.cusId;
            self.cusName = self.base.data.cusFullname;
            self.headName = self.base.data.ownerName;
        }
        [self.myTableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    


}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cluesCellIdtenfier";
    
    CluesXQCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    
    if (!cell) {
        
        cell = [[CluesXQCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.titleLabel.text = [self.titleArray objectAtIndex:indexPath.row];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.base.data.createdDatetime / 1000];
    
    NSString *findDate = [DateUtils getStringDateByDate:date dateFormat:@"yyyy-MM-dd"];
    switch (indexPath.row) {

        case 0:
            cell.contenLabel.text = self.base.data.cusFullname;
            break;
        case 1:
            cell.contenLabel.text = self.base.data.startLevelName;
            break;
        case 2:
            cell.contenLabel.text = self.base.data.cusTypeName;
            break;
        case 3:
            cell.contenLabel.text = self.base.data.ownerName;
            break;
        case 4:
            cell.contenLabel.text = self.base.data.userNatureName;
            break;
        case 5:
            cell.contenLabel.text = self.base.data.busiDepart;
            break;
        case 6:
            cell.contenLabel.text = self.base.data.userArea;
            break;
        case 7:
            cell.contenLabel.text = self.base.data.userSize;
            break;
        case 8:
            cell.contenLabel.text = self.base.data.tripArea;
            break;
        case 9:
            cell.contenLabel.text = self.base.data.managerPartyName;
            break;
        case 10:
            cell.contenLabel.text = self.base.data.finderName;
            break;
        case 11:
            cell.contenLabel.text = self.base.data.regionIdDistrictName;
            break;
        case 12:
            cell.contenLabel.text = self.base.data.regionAddr;
            break;
        case 13:
            cell.contenLabel.text = @""; // 新增时没有，有了在添加
            break;
        case 14:
            cell.contenLabel.text = findDate;
            break;
        case 15:
            cell.contenLabel.text = self.base.data.busiDepartName;
            break;
        case 16:
            cell.contenLabel.text = self.base.data.orgName;
            break;
        case 17:
            cell.contenLabel.text = self.base.data.ownerName;
            break;
        case 18:
            cell.contenLabel.text = self.base.data.finderName;
            break;
        case 19:
            cell.contenLabel.text = self.base.data.statusName;
            break;
        case 20:
            cell.contenLabel.text = self.base.data.dataDescription;
        default:
            break;
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
