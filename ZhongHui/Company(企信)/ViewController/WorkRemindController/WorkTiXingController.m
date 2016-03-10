//
//  WorkTiXingController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "WorkTiXingController.h"
#import "WorkTiXingCell.h"

@interface WorkTiXingController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UITableView *TiXingTable;

@end

@implementation WorkTiXingController

-(UITableView *)TiXingTable
{
    if (!_TiXingTable) {
        
        _TiXingTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64)];
        _TiXingTable.dataSource = self;
        _TiXingTable.delegate = self;
        _TiXingTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _TiXingTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"提醒";
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.TiXingTable];
    self.TiXingTable.backgroundColor = [UIColor clearColor];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"workCellIdtenfier";
    
    WorkTiXingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    
    if (!cell) {
        
        cell = [[WorkTiXingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
