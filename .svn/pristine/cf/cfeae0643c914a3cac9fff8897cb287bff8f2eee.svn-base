//
//  YiCancelController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/12.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "YiCancelController.h"
#import "WeiPerformCell.h"


@interface YiCancelController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *yiCancelTable;


@end

@implementation YiCancelController

-(UITableView *)yiCancelTable
{
    if (!_yiCancelTable) {
        
        _yiCancelTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64-40)];
        _yiCancelTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _yiCancelTable.dataSource = self;
        _yiCancelTable.delegate = self;
    }
    return _yiCancelTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.yiCancelTable];
    self.yiCancelTable.backgroundColor = [UIColor clearColor];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cancelCellIdtenfier";
    
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
