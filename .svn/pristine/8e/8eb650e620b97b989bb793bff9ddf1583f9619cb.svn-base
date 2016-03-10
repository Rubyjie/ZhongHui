//
//  FinishTaskController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "FinishTaskController.h"
#import "performCell.h"

@interface FinishTaskController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *finishTable;

@end

@implementation FinishTaskController

-(UITableView *)finishTable
{
    if (!_finishTable) {
        
        _finishTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64-40)];
        _finishTable.dataSource = self;
        _finishTable.delegate = self;
        _finishTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _finishTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"已完成";
    [self.view addSubview:self.finishTable];
    self.view.backgroundColor = RGB(227, 227, 227);
    self.finishTable.backgroundColor = [UIColor clearColor];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"FinishCellIdtenfier";
    
    performCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[performCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}



@end
