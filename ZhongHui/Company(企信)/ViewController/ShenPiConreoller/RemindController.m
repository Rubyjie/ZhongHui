//
//  RemindController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "RemindController.h"
#import "ReminderCell.h"

@interface RemindController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UITableView *remindTable;
@end

@implementation RemindController

-(UITableView *)remindTable
{
    if (!_remindTable) {
        
        _remindTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64)];
        _remindTable.dataSource = self;
        _remindTable.delegate = self;
        _remindTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _remindTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.title = @"催单记录";
    
    self.remindTable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.remindTable];
    self.view.backgroundColor = RGB(227, 227, 227);

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"approvalCellID";
    
    ReminderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        
        cell = [[ReminderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}




@end
