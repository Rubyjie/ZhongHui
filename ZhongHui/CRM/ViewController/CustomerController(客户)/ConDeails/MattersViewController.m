//
//  MattersViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/19.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "MattersViewController.h"
#import "MattersCell.h"

#import "AFNetworking.h"

@interface MattersViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UITableView *mattersTable;

@property (nonatomic, strong)NSArray *dataArray;

@end

@implementation MattersViewController

-(UITableView *)mattersTable
{
    if (!_mattersTable) {
        
        _mattersTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64)];
        _mattersTable.dataSource = self;
        _mattersTable.delegate = self;
        _mattersTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _mattersTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"事项";
    
    [self getMattersData];
    
    self.view.backgroundColor = RGB(227, 227, 227);
    self.mattersTable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.mattersTable];
}

-(void)getMattersData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"customer/specialEvent/pageQuery?"];
    NSDictionary *dict = @{@"customerId":self.cusId};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dataDict = [responseObject objectForKey:@"data"];
            
           self.dataArray = [dataDict objectForKey:@"data"];
            
        }
        
        [self.mattersTable reloadData];
        
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
    static NSString *cellId = @"mattersCellId";
    
    MattersCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[MattersCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    NSDictionary *dict = [self.dataArray objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = [dict objectForKey:@"speTypeName"];
    cell.contentLabel.text = [dict objectForKey:@"speContent"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

@end
