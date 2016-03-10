//
//  CompanyViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/15.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CompanyViewController.h"
#import "NotificationsViewController.h" // 日程通知
#import "MainRenwuViewController.h"     // 任务提醒
#import "MainShenPiViewController.h"    // 审批提醒
#import "MainMessageController.h"       // 在线消息
#import "MainGongGaoViewController.h"   // 内部公告
#import "WorkViewController.h"          // 工作提醒
#import "CompanyView.h"
#import "YCBadgeButton.h"

@interface CompanyViewController () <companyViewDelegate>

@end

@implementation CompanyViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    
    CompanyView *companyView = [[CompanyView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH - 20, PHONE_UISCREEN_HEIGHT - 64 - 49)];
    companyView.delegate = self;
    [self.view addSubview:companyView];
    self.view.backgroundColor = RGB(227, 227, 227);

    

}

#pragma mark - companyViewDelegate
-(void)swithButtonJumpViewControllerWithTag:(NSInteger)tag
{
    if (tag == 200) {
        
        NotificationsViewController *notificationVC = [[NotificationsViewController alloc]init];
        notificationVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:notificationVC animated:YES];
        
    }else if (tag == 201){
    
//        self.tabBarItem.badgeValue = @"12";
//        self.tabBarItem.title = @"改变";
        
        MainRenwuViewController *task = [[MainRenwuViewController alloc]init];
        task.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:task animated:YES];
        
    }else if (tag == 202) {
    
        MainShenPiViewController *approval = [[MainShenPiViewController alloc]init];
        approval.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:approval animated:YES];
        
    }else if (tag == 203) {
    
        MainMessageController *message = [[MainMessageController alloc]init];
        message.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:message animated:YES];

    }else if (tag == 204) {
    
        MainGongGaoViewController *gonggao = [[MainGongGaoViewController alloc]init];
        gonggao.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:gonggao animated:YES];
        
    }else if (tag == 205) {
        
        WorkViewController *work = [[WorkViewController alloc]init];
        work.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:work animated:YES];
    }

}

@end
