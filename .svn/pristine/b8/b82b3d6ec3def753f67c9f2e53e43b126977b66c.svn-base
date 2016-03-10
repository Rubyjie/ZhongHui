//
//  YiPerformController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/12.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "YiPerformController.h"
#import "WeiPerformCell.h"


@interface YiPerformController () <UITableViewDataSource ,UITableViewDelegate>

@property (nonatomic, strong)UITableView *yiPerformTable;

@end

@implementation YiPerformController

-(UITableView *)yiPerformTable
{
    if (!_yiPerformTable) {
        
        _yiPerformTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64-40)];
        _yiPerformTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _yiPerformTable.dataSource = self;
        _yiPerformTable.delegate= self;
    }
    return _yiPerformTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(227, 227, 227);
    
    [self.view addSubview:self.yiPerformTable];
    
    self.yiPerformTable.backgroundColor = [UIColor clearColor];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"yiPerformCellIdtenfier";
    
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
