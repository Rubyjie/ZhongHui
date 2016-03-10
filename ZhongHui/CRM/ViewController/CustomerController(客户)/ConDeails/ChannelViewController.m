//
//  ChannelViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/19.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "ChannelViewController.h"
#import "ChannelCell.h"

#import "AFNetworking.h"

@interface ChannelViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *channelTable;

@property (nonatomic, strong)NSArray *dataArray;

@end

@implementation ChannelViewController

-(UITableView *)channelTable
{
    if (!_channelTable) {
        
        _channelTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64)];
        _channelTable.dataSource = self;
        _channelTable.delegate = self;
        _channelTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _channelTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"合作渠道";
    
    self.view.backgroundColor = RGB(227, 227, 227);
    self.channelTable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.channelTable];
    
    [self getChannelData];
}

-(void)getChannelData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"customer/channelPartner/pageQuery?"];
    NSDictionary *dict = @{@"customerId":self.cusId};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"------%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dataDict = [responseObject objectForKey:@"data"];
            
            self.dataArray = [dataDict objectForKey:@"data"];
            
            
        }
        
        [self.channelTable reloadData];

        
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
    static NSString *cellId = @"ChannelCellId";
    
    ChannelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[ChannelCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    NSDictionary *dict = [self.dataArray objectAtIndex:indexPath.row];
    
    // 开始时间
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[[dict objectForKey:@"startTime"]doubleValue] / 1000];
    NSString *startTime = [DateUtils getStringDateByDate:date dateFormat:@"yyyy-MM-dd"];

    // 结束时间
    NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:[[dict objectForKey:@"endTime"]doubleValue] / 1000];
    NSString *endTime = [DateUtils getStringDateByDate:endDate dateFormat:@"yyyy-MM-dd"];

    cell.titleLabel.text = [dict objectForKey:@"channleIdName"];
    cell.startTimeLabel.text = startTime;
    cell.endTimeLabel.text = endTime;
    cell.shuoMingLabel.text = [dict objectForKey:@"channelContent"];
    cell.webAddressLabel.text = [dict objectForKey:@"webAddress"];
    cell.beiZhuLabel.text = [dict objectForKey:@"description"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}

@end
