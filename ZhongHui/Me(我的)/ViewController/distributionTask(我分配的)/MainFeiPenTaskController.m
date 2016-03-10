//
//  MainFeiPenTaskController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/12.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "MainFeiPenTaskController.h"
#import "WeiPerformController.h"  //未完成
#import "YiPerformController.h"   //已完成
#import "YiCancelController.h"    //已取消

#import "MeTaskView.h"

@interface MainFeiPenTaskController () <MeTaskButtonDelegate>

{
    // 当前viewController
    UIViewController *currentController;
}

@property (nonatomic, strong) MeTaskView *headView;

@property (nonatomic, strong) WeiPerformController *controller1;
@property (nonatomic, strong) YiPerformController  *controller2;
@property (nonatomic, strong) YiCancelController   *controller3;

@property (nonatomic, strong) UIView *mainView;


@end

@implementation MainFeiPenTaskController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我分配的任务";
    
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.headView];
    [self.view addSubview:self.mainView];
    
    [self addChildViewController:self.controller1];
    [self addChildViewController:self.controller2];
    [self addChildViewController:self.controller3];
    
    currentController = self.controller1;
    
    [self.mainView addSubview:self.controller1.view];
}


#pragma mark  tag 800未执行 801已执行 802已取消
- (void)swithMeTaskButtonQueryTaskStatusWithTag:(NSInteger)tag
{
    if (((currentController==self.controller1)&&(tag==800))||((currentController==self.controller2 )&&(tag==801)) ||((currentController==self.controller3)&&(tag==802))) {
        return;
    }
    
    UIViewController *oldViewController = currentController;
    switch (tag) {
        case 800:{
            [self transitionFromViewController:currentController toViewController:self.controller1 duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.mainView addSubview:self.controller1.view];
                    currentController = self.controller1;
                    
                }else{
                    currentController = oldViewController;
                    
                }
            }];
        }
            break;
        case 801:
        {
            
            [self transitionFromViewController:currentController toViewController:self.controller2 duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.mainView addSubview:self.controller2.view];
                    currentController = self.controller2;
                }else{
                    
                    currentController = oldViewController;
                }
            }];
            
        }
            break;
            
        case 802:
        {
            
            [self transitionFromViewController:currentController toViewController:self.controller3 duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.mainView addSubview:self.controller3.view];
                    
                    currentController = self.controller3;
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


- (WeiPerformController *)controller1
{
    if (!_controller1) {
        _controller1 = [[WeiPerformController alloc] init];
    }
    
    return _controller1;
}

- (YiPerformController *)controller2
{
    if (!_controller2) {
        _controller2 = [[YiPerformController alloc] init];
    }
    
    return _controller2;
}

- (YiCancelController *)controller3
{
    if (!_controller3) {
        _controller3 = [[YiCancelController alloc] init];
    }
    
    return _controller3;
}

- (UIView *)mainView
{
    if (!_mainView) {
        _mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64-40)];
    }
    
    return _mainView;
}

- (MeTaskView *)headView
{
    if (!_headView) {
        _headView = [[MeTaskView alloc] initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 40)];
        _headView.delegate = self;
    }
    
    return _headView;
}



@end
