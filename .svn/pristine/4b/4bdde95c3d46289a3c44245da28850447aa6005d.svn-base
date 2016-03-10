//
//  FinishiTaskViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/18.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "FinishiTaskViewController.h"
#import "NextTaskCell.h"

@interface FinishiTaskViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *finishTable;



@end

@implementation FinishiTaskViewController


-(UITableView *)finishTable
{
    if (!_finishTable) {
        
        _finishTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40)];
        _finishTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _finishTable.dataSource = self;
        _finishTable.delegate= self;
    }
    return _finishTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"已执行";
    
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.finishTable];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"finishTaskCellIdtenfier";
    
    NextTaskCell *finishCell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!finishCell) {
        
        finishCell = [[NextTaskCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return finishCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}




@end
