//
//  WeiPerformController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/12.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "WeiPerformController.h"
#import "WeiPerformCell.h"

@interface WeiPerformController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *fenPeiTable;
@end

@implementation WeiPerformController

-(UITableView *)fenPeiTable
{
    if (!_fenPeiTable) {
        
        _fenPeiTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64-40)];
        _fenPeiTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _fenPeiTable.dataSource = self;
        _fenPeiTable.delegate = self;
    }
    return _fenPeiTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.fenPeiTable];
    self.fenPeiTable.backgroundColor = [UIColor clearColor];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"WeiPerformCellIdtenfier";
    
    WeiPerformCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[WeiPerformCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}




@end
