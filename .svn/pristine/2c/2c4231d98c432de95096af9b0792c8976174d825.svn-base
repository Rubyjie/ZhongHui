//
//  CustomerDeilsController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/24.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CustomerDeilsController.h"
#import "AilasViewController.h"  // 别名
#import "ContractWayController.h" // 联系方式
#import "DocumentController.h"   // 文档
#import "MattersViewController.h"// 事项
#import "ChannelViewController.h"// 渠道
#import "LevelViewController.h"  // 级别

#import "AFNetworking.h"

#import "CustomerDeailsCell.h"
#import "BottomView.h"
#import "AliasVIew.h"
#import "DocumentView.h"

#import "CustomerBaseClass.h"
#import "CustomerData.h"
#import "CustomerDatalist.h"

@interface CustomerDeilsController () <UITableViewDataSource,UITableViewDelegate,bottomButtonDelegate>

@property (nonatomic, strong)UITableView *deailsTabel;

@property (nonatomic, strong)NSArray *titleArray;

@property (nonatomic, strong)NSArray *bottomTitleArray;

@property (nonatomic, strong)NSMutableArray *dataList;

@property (nonatomic, strong)BottomView *bottomView;

@property (nonatomic, strong)AliasVIew *aliasView;  // 别名


@property (nonatomic, strong)DocumentView *documentView;


@end

@implementation CustomerDeilsController

-(AliasVIew *)aliasView
{
    if (!_aliasView) {

        _aliasView = [[AliasVIew alloc]initWithFrame:CGRectMake(0, PHONE_UISCREEN_HEIGHT-160-40, PHONE_UISCREEN_WIDTH, 160)];
        _aliasView.backgroundColor = RGB(227, 227, 227);
    }
    return _aliasView;
}




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
        
        _deailsTabel = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64-40)];
        _deailsTabel.dataSource = self;
        _deailsTabel.delegate = self;
    }
    return _deailsTabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getCustomerDeailsData];

    self.titleArray = @[@"客户名称",@"客户编码",@"类型",@"所属集团",@"星级",@"经营性质",@"用户性质",@"品牌",@"酒店属性",@"酒店规模",@"携程类型",@"邮政编码",@"所在区域",@"详细地址",@"资产归属",@"管理方",@"楼层数",@"房间数",@"开业时间",@"最近装修时间",@"点评数",@"备注",@"状态",@"添加人",@"添加时间"];
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.deailsTabel];
    
    self.bottomView = [[BottomView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 30)];
    self.bottomView.delegate = self;
    self.deailsTabel.tableFooterView = self.bottomView;

}





-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillAppear:animated];

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
    
//    NSDictionary *dict = [self.dataList firstObject];
    
    CustomerDatalist *listModel = [self.dataList firstObject];
    // 开业时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:listModel.openDate / 1000];
    NSString *timeDate = [DateUtils getStringDateByDate:date dateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    // 装修时间
    NSDate *opendate = [NSDate dateWithTimeIntervalSince1970:listModel.redecDateLast / 1000];
    NSString *zXDate = [DateUtils getStringDateByDate:opendate dateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    
    // 添加时间
    NSDate *adddate = [NSDate dateWithTimeIntervalSince1970:listModel.createdDatetime / 1000];
    NSString *addDate = [DateUtils getStringDateByDate:adddate dateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    // 所在区域
    NSString *area = [NSString stringWithFormat:@"%@%@%@%@",listModel.countryName,listModel.provinceName,listModel.cityName,listModel.districtName];

    switch (indexPath.row) {
            
        case 0:
            cell.ctentLabel.text = listModel.cusFullName;
            break;
        case 1:
            cell.ctentLabel.text = listModel.cusCode;
            break;
        case 2:
            cell.ctentLabel.text = listModel.cusTypeName;
            break;
        case 3:
            cell.ctentLabel.text = listModel.ownerGroupId;
            break;
        case 4:
            cell.ctentLabel.text = listModel.startLevelName;
            break;
        case 5:
            cell.ctentLabel.text = listModel.bustNatureName;
            break;
        case 6:
            cell.ctentLabel.text = listModel.userNatureName;
            break;
        case 7:
            cell.ctentLabel.text = listModel.brand;
            break;
        case 8:
            cell.ctentLabel.text = listModel.userAreaName;
            break;
        case 9:
            cell.ctentLabel.text = listModel.userSizeName;
            break;
        case 10:
            cell.ctentLabel.text = listModel.tripAreaName;
            break;
        case 11:
            cell.ctentLabel.text = listModel.postcode;
            break;
        case 12:
            cell.ctentLabel.text = area;
            break;
        case 13:
            cell.ctentLabel.text = listModel.regionAddr;
            break;
        case 14:
            cell.ctentLabel.text = listModel.assetsOwnerName;
            break;
        case 15:
            cell.ctentLabel.text = listModel.managerPartyName;
            break;
        case 16:
            cell.ctentLabel.text = [NSString stringWithFormat:@"%.0f",listModel.cFloors];
            break;
        case 17:
            cell.ctentLabel.text = [NSString stringWithFormat:@"%.0f",listModel.cRooms];
;
            break;
        case 18:
            cell.ctentLabel.text = timeDate;
            break;
        case 19:
            cell.ctentLabel.text = zXDate;
            break;
        case 20:
            cell.ctentLabel.text = cell.ctentLabel.text = [NSString stringWithFormat:@"%.0f",listModel.cPoints];;
            break;
        case 21:
            cell.ctentLabel.text = listModel.datalistDescription;
            break;
        case 22:
            cell.ctentLabel.text = listModel.statusName;
            break;
        case 23:
            cell.ctentLabel.text = listModel.creatorName;
            break;
        case 24:
            cell.ctentLabel.text = addDate;
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
        
        CustomerBaseClass *baseModel = [[CustomerBaseClass alloc]initWithDictionary:responseObject];
        if (baseModel.success) {
            
            for (int i = 0; i < baseModel.data.datalist.count; i++) {
                
                [self.dataList addObject:[baseModel.data.datalist objectAtIndex:i]];
            }
            
        }
        
        [self.deailsTabel reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
}


#pragma mark - 10000别名  10001联系  10002文档  10003事项  10004渠道  10005级别
-(void)swithButtonQueryCusChildMessageWithTag:(NSInteger)tag
{

    if (tag == 10000) {
        
        AilasViewController *ailas = [[AilasViewController alloc]init];
        ailas.cusId = self.customerId;
        [self.navigationController pushViewController:ailas animated:YES];

    }else if (tag == 10001) {
    
        ContractWayController *conWay = [[ContractWayController alloc]init];
        conWay.idStr = self.customerId;
        [self.navigationController pushViewController:conWay animated:YES];


    }else if (tag == 10002) {
        
        DocumentController *document = [[DocumentController alloc]init];
        document.cusId = self.customerId;
        [self.navigationController pushViewController:document animated:YES];
        
    }else if (tag == 10003) {
    
        MattersViewController *matters = [[MattersViewController alloc]init];
        matters.cusId = self.customerId;
        [self.navigationController pushViewController:matters animated:YES];
    
    }else if (tag == 10004) {
    
        ChannelViewController *channel = [[ChannelViewController alloc]init];
        channel.cusId = self.customerId;
        [self.navigationController pushViewController:channel animated:YES];
        
    }else if (tag == 10005) {
    
        LevelViewController *level = [[LevelViewController alloc]init];
        level.cusId = self.customerId;
        [self.navigationController pushViewController:level animated:YES];

    }

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


@end
