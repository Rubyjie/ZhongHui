//
//  AilasViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/19.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "AilasViewController.h"

#import "AFNetworking.h"

#import "AliasVIew.h"
#import "AliasCell.h"

@interface AilasViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *ailasTable;

@property (nonatomic, strong)NSDictionary *ailasDict;

@property (nonatomic, strong)NSArray *dataArray;

@end

@implementation AilasViewController



-(UITableView *)ailasTable
{
    if (!_ailasTable) {
        
        _ailasTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64)];
        _ailasTable.delegate = self;
        _ailasTable.dataSource = self;
    }
    return _ailasTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    AliasVIew *ailasView = [[AliasVIew alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 40)];
    ailasView.backgroundColor = [UIColor grayColor];
    self.ailasTable.tableHeaderView = ailasView;
    
#pragma mark - 获取客户别名数据
    [self getCustomerAliasData];
    
    self.title = @"别名";

    [self.view addSubview:self.ailasTable];
}


#pragma mark - 别名
-(void)getCustomerAliasData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"customer/customerAlias/pageQuery"];
    
    NSDictionary *dict = @{@"customerId":self.cusId};
    
    AFHTTPRequestOperationManager *mag = [AFHTTPRequestOperationManager manager];
    
    [mag POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"---%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dataDict = [responseObject objectForKey:@"data"];
            
            self.dataArray = [dataDict objectForKey:@"data"];
            
            for (int i = 0; i < self.dataArray.count; i++) {
                
                self.ailasDict = [self.dataArray objectAtIndex:i];
                
              
            }
        }
        [self.ailasTable reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"ailasCellId";
    
     AliasCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[AliasCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[[self.ailasDict objectForKey:@"startTime"]doubleValue] / 1000];
    NSString *startTime = [DateUtils getStringDateByDate:date dateFormat:@"yyyy-MM-dd"];
    
    NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:[[self.ailasDict objectForKey:@"endTime"]doubleValue] / 1000];
    NSString *endTime = [DateUtils getStringDateByDate:endDate dateFormat:@"yyyy-MM-dd"];
    
    cell.nameLabel.text = [self.ailasDict objectForKey:@"aliName"];
    cell.typeLabel.text = [self.ailasDict objectForKey:@"aliTypeName"];
    cell.startTimeLabel.text = startTime;
    cell.endTimeLabel.text = endTime;
    
    NSLog(@"----%@",cell.nameLabel.text);
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

@end
