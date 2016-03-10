//
//  UnFinishController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "UnFinishController.h"
#import "ProcesTaskController.h"  //任务处理
#import "MeTaskCell.h"

@interface UnFinishController () <UITableViewDataSource,UITableViewDelegate,DaiZhiXingTaskCellDelegate>

@property (nonatomic, strong) UITableView *UnFinshiTaskTable;

@end

@implementation UnFinishController

-(UITableView *)UnFinshiTaskTable
{
    if (!_UnFinshiTaskTable) {
        
        _UnFinshiTaskTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40)];
        _UnFinshiTaskTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _UnFinshiTaskTable.dataSource = self;
        _UnFinshiTaskTable.delegate = self;
    }
    return _UnFinshiTaskTable;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"未完成";
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.UnFinshiTaskTable];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"MeTaskCellIdtenfier";
    
    MeTaskCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[MeTaskCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.delegate = self;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

#pragma mark -- 点击按钮处理任务 80处理任务
-(void)swithButtonProcesTaskWithTag:(NSInteger)tag
{
    if (tag == 80) {
        
        ProcesTaskController *procesTaskVC = [[ProcesTaskController alloc]init];
        [self.navigationController pushViewController:procesTaskVC animated:YES];
    }
    
}
@end
