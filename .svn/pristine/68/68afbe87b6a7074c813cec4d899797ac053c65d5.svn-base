//
//  LevelViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/19.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "LevelViewController.h"
#import "LevelCell.h"

#import "AFNetworking.h"

@interface LevelViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *levelTable;

@property (nonatomic, strong)NSArray *dataArray;

@end

@implementation LevelViewController

-(UITableView *)levelTable
{
    if (!_levelTable) {
        
        _levelTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64)];
        _levelTable.dataSource = self;
        _levelTable.delegate = self;
        _levelTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _levelTable;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"业态级别";
    
    self.view.backgroundColor = RGB(227, 227, 227);
    self.levelTable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.levelTable];
    
    [self getLevelData];
}

-(void)getLevelData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"clue/salClue/QueryLevel?"];
    NSDictionary *dict = @{@"cusId":self.cusId};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"------%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dataDict = [responseObject objectForKey:@"data"];
            
            self.dataArray = [dataDict objectForKey:@"data"];
            
            
        }
        
        [self.levelTable reloadData];
        
        
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
    static NSString *cellID = @"levelCellId";

    LevelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        
        cell = [[LevelCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSDictionary *dict = [self.dataArray objectAtIndex:indexPath.row];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[[dict objectForKey:@"createdDatetime"]doubleValue] / 1000];
    NSString *Time = [DateUtils getStringDateByDate:date dateFormat:@"yyyy-MM-dd"];
    
    cell.nameLabel.text = [dict objectForKey:@"busiDepartName"];
    cell.cluesLabel.text = [dict objectForKey:@"customerLevelName"];
    cell.timeLabel.text = Time;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}


@end
