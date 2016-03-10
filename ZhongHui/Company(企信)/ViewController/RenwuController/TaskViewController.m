//
//  TaskViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/18.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "TaskViewController.h"
#import "ArchivController.h"  // 日程通知的归档，在这相当于处理
#import "EntrustViewController.h"  // 委托
#import "BackTaskViewController.h" // 退回

#import "TaskCell.h"

@interface TaskViewController () <UITableViewDataSource,UITableViewDelegate,taskOperationDelegate>

@property (nonatomic, strong) UITableView *taskTable;

@end

@implementation TaskViewController

-(UITableView *)taskTable
{
    if (!_taskTable) {
        
        _taskTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40)];
        _taskTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _taskTable.dataSource = self;
        _taskTable.delegate = self;
    }
    return _taskTable;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"任务提醒";
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.taskTable];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"taskCellIdtenfier";
    
    TaskCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[TaskCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.delegate = self;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

-(void)selectedButtonOperationTaskWithTag:(NSInteger)tag
{
    if (tag == 100) {
        
        ArchivController *chuLi = [[ArchivController alloc]init];
        [self.navigationController pushViewController:chuLi animated:YES];
        
    }else if (tag == 101) {
    
        NSLog(@"委托");
        
        EntrustViewController *entrust = [[EntrustViewController alloc]init];
        [self.navigationController pushViewController:entrust animated:YES];

    
    }else if (tag == 102) {
    
        NSLog(@"退回");
        BackTaskViewController *back = [[BackTaskViewController alloc]init];
        [self.navigationController pushViewController:back animated:YES];
        
    }else if (tag == 103) {
    
        NSLog(@"提醒");
    }

}

@end
