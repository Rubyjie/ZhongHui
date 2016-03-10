//
//  NotificationsViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/15.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "NotificationsViewController.h"
#import "RemindViewController.h"        // 提醒
#import "ArchivController.h"            // 归档
#import "ReplyViewController.h"         // 回复
#import "ScheduleFowollController.h"    // 跟进
#import "NotificationsCell.h"

@interface NotificationsViewController () <UITableViewDataSource,UITableViewDelegate,toolBarButtonDelegate>

@property (nonatomic,strong)UITableView *notificationTabel;

@end

@implementation NotificationsViewController

-(UITableView *)notificationTabel
{
    if (!_notificationTabel) {
        
        _notificationTabel = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64)];
        _notificationTabel.separatorStyle = UITableViewCellSeparatorStyleNone;
        _notificationTabel.dataSource = self;
        _notificationTabel.delegate = self;
    }
    return _notificationTabel;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"日程通知";
    self.notificationTabel.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = RGB(227, 227, 227);

    [self.view addSubview:self.notificationTabel];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"notificationCellId";
    
    NotificationsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[NotificationsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.delegate = self;

    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(void)swithButtonPushViewWithTag:(NSInteger)tag
{
    if (tag == 100) {
        
        // 回复
        ReplyViewController *reply = [[ReplyViewController alloc]init];
        [self.navigationController pushViewController:reply animated:YES];
        
    }else if (tag == 102) {
    
        // 提醒
        RemindViewController *remind = [[RemindViewController alloc]init];
        [self.navigationController pushViewController:remind animated:YES];
    }else if (tag == 103){
    
        ArchivController *archiv = [[ArchivController alloc]init];
        [self.navigationController pushViewController:archiv animated:YES];
    
    }else if (tag == 101) {
    
        ScheduleFowollController *schedule = [[ScheduleFowollController alloc]init];
        [self.navigationController pushViewController:schedule animated:YES];
    }
}




@end
