//
//  PendApproverController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/19.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "PendApproverController.h"
#import "PendApproverCell.h"

@interface PendApproverController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *approverTable;

@end

@implementation PendApproverController

-(UITableView *)approverTable
{
    if (!_approverTable) {
        
        _approverTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40)];
        _approverTable.dataSource = self;
        _approverTable.delegate = self;
        _approverTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _approverTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.approverTable.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.approverTable];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"approvalCellID";
    
    PendApproverCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        
        cell = [[PendApproverCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}

@end
