//
//  CanceledController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CanceledController.h"

#import "CancelTaskCell.h"

@interface CanceledController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *cancelTabel;


@end

@implementation CanceledController

-(UITableView *)cancelTabel
{
    if (!_cancelTabel) {
        
        _cancelTabel = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64-40)];
        _cancelTabel.separatorStyle = UITableViewCellSeparatorStyleNone;
        _cancelTabel.dataSource = self;
        _cancelTabel.delegate = self;
    }
    return _cancelTabel;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.cancelTabel];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"FinishCellIdtenfier";
    
    CancelTaskCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[CancelTaskCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}

@end
