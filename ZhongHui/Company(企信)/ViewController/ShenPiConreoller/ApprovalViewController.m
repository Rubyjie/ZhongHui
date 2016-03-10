//
//  ApprovalViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/18.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ApprovalViewController.h"
#import "ReplyViewController.h"    // 批复界面和日程通知的回复界面一样
#import "RecordController.h"       // 记录明细
#import "RemindController.h"       // 催单记录
#import "ApprovalCell.h"
#import "ApproverView.h"

@interface ApprovalViewController () <UITableViewDataSource,UITableViewDelegate,approverButtonDelegate>

@property (nonatomic, strong)UITableView *approvalTabel;

@end

@implementation ApprovalViewController

-(UITableView *)approvalTabel
{
    if (!_approvalTabel) {
        
        _approvalTabel = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64)];
        _approvalTabel.dataSource = self;
        _approvalTabel.delegate = self;
        
    }
    return _approvalTabel;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"审批提醒";
    self.approvalTabel.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.approvalTabel];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"approvalCellID";
    
    ApprovalCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        
        cell = [[ApprovalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.delegate = self;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 190;
}

#pragma mark - 点击button100查看批复、101记录、102催单明细
-(void)swithButtonLookApproverWithRecordWithReminderWithTag:(NSInteger)tag
{
    if (tag == 100) {
        
        ReplyViewController *reply = [[ReplyViewController alloc]init];
        reply.title = @"查看批复";
        [self.navigationController pushViewController:reply animated:YES];
        
    }else if (tag == 101){
    
        RecordController *record = [[RecordController alloc]init];
        [self.navigationController pushViewController:record animated:YES];
    }else if (tag == 102){
    
        RemindController *remind = [[RemindController alloc]init];
        [self.navigationController pushViewController:remind animated:YES];
    
    }

}

@end
