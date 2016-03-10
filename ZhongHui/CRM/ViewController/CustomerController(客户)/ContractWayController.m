//
//  ContractWayController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/24.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ContractWayController.h"
#import "ContractWayCell.h"

#import "AFNetworking.h"
@interface ContractWayController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *contractWayTable;

@property (nonatomic, strong)NSArray *imageArray;


@property (nonatomic, strong)NSArray *dataArray;


@end

@implementation ContractWayController

-(UITableView *)contractWayTable
{
    if (!_contractWayTable) {
        
        _contractWayTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64)];
        _contractWayTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _contractWayTable.dataSource = self;
        _contractWayTable.delegate = self;
    }
    return _contractWayTable;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[Session sharedSession].loadView StopLoading];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"联系方式";
    self.imageArray = @[@"Shape-4",@"Shape-76",@"cw-work",@"Shape-389",@"cw-qq",@"cw-wechat",@"cw-weibo"];
    
    [self.view addSubview:self.contractWayTable];
    
    self.view.backgroundColor = RGB(227, 227, 227);
    
    [self getContractData];
}

-(void)getContractData
{
    [[Session sharedSession].loadView StartLoading];
    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,CONTRACTTYPE];
    
    NSDictionary *dict = @{@"customerId":self.idStr};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"---%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            [[Session sharedSession].loadView StopLoading];
            
            NSDictionary *dict = [responseObject objectForKey:@"data"];
            self.dataArray = [dict objectForKey:@"data"];
            
            if (self.dataArray.count == 0) {
                
                [[Session sharedSession].tpView presentMessageTips:@"当前客户下没有联系方式"];
            }
        }
        [self.contractWayTable reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [[Session sharedSession].loadView StopLoading];
        
        NSLog(@"%@",error);
    }];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *contractWayCellId = @"contractWayCellIdentfier";
    
    ContractWayCell *cell = [tableView dequeueReusableCellWithIdentifier:contractWayCellId];
    
    if (!cell) {
        
        cell = [[ContractWayCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:contractWayCellId];
    }
    
    cell.iconImage.image = [UIImage imageNamed:[self.imageArray objectAtIndex:indexPath.row]];
    
    NSDictionary *dict = [self.dataArray objectAtIndex:indexPath.row];
    
    cell.contentLabel.text = [dict objectForKey:@"addressName"];
    cell.statusLabel.text = [dict objectForKey:@"statusName"];
    cell.beiZhuLabel.text = [dict objectForKey:@"description"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

@end
