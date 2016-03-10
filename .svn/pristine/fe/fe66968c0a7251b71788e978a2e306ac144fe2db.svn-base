//
//  MainShenPiViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/19.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "MainShenPiViewController.h"
#import "ApprovalViewController.h"     // 已审批
#import "PendApproverController.h"     // 待审批
#import "ApproverView.h"

@interface MainShenPiViewController () <approverStatuButtonDelegate>
{
    // 当前viewController
    UIViewController *currentController;
}
@property (nonatomic, strong) ApproverView *appHeadView;
@property (nonatomic, strong) ApprovalViewController *controller1;
@property (nonatomic, strong) PendApproverController *controller2;

@property (nonatomic, strong) UIView *AppMainView;

@end

@implementation MainShenPiViewController


- (ApprovalViewController *)controller1
{
    if (!_controller1) {
        _controller1 = [[ApprovalViewController alloc] init];
    }
    
    return _controller1;
}

- (PendApproverController *)controller2
{
    if (!_controller2) {
        _controller2 = [[PendApproverController alloc] init];
    }
    
    return _controller2;
}



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"待审批";
    
    [self.view addSubview:self.appHeadView];
    [self.view addSubview:self.AppMainView];
    
    [self addChildViewController:self.controller1];
    [self addChildViewController:self.controller2];
    
    currentController = self.controller1;
    [self.AppMainView addSubview:self.controller1.view];

}

#pragma mark  tag 200待审批 201已审批
-(void)swithButtonLookApproverStatusWithTag:(NSInteger)tag
{
    if (((currentController==self.controller1)&&(tag==200))||((currentController==self.controller2 )&&(tag==201))) {
        return;
    }
    
    UIViewController *oldViewController = currentController;
    switch (tag) {
        case 200:{
            [self transitionFromViewController:currentController toViewController:self.controller1 duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.AppMainView addSubview:self.controller1.view];
                    currentController = self.controller1;
                    self.title = @"待审批";

                }else{
                    currentController = oldViewController;
                    
                }
            }];
        }
            break;
        case 201:
        {
            
            [self transitionFromViewController:currentController toViewController:self.controller2 duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.AppMainView addSubview:self.controller2.view];
                    currentController = self.controller2;
                    self.title = @"已审批";

                }else{
                    
                    currentController = oldViewController;
                }
            }];
            
        }
            break;
        default:
            break;
    }
}




- (UIView *)AppMainView
{
    if (!_AppMainView) {
        _AppMainView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64-40)];
    }
    
    return _AppMainView;
}

- (ApproverView *)appHeadView
{
    if (!_appHeadView) {
        _appHeadView = [[ApproverView alloc] initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 40)];
        _appHeadView.delegate = self;
    }
    return _appHeadView;
}


@end
