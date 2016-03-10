//
//  MainRenwuViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/18.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "MainRenwuViewController.h"

#import "TaskViewController.h"
#import "FinishiTaskViewController.h"
#import "CancelTaskViewController.h"

#import "TaskHeadView.h"

@interface MainRenwuViewController ()<TaskHeadDelegate>

{
    // 当前viewController
    UIViewController *currentController;
}

@property (nonatomic, strong) TaskHeadView *headView;

@property (nonatomic, strong) TaskViewController *controller1;
@property (nonatomic, strong) FinishiTaskViewController *controller2;
@property (nonatomic, strong) CancelTaskViewController *controller3;

@property (nonatomic, strong) UIView *mainView;


@end

@implementation MainRenwuViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"未执行";

    [self.view addSubview:self.headView];
    [self.view addSubview:self.mainView];
    
    [self addChildViewController:self.controller1];
    [self addChildViewController:self.controller2];
    [self addChildViewController:self.controller3];
    
    currentController = self.controller1;
    
    [self.mainView addSubview:self.controller1.view];
}


#pragma mark  tag 100未执行 101已执行 102已取消
- (void)headButtonPressedWithTag:(NSInteger)tag
{
    if (((currentController==self.controller1)&&(tag==100))||((currentController==self.controller2 )&&(tag==101)) ||((currentController==self.controller3)&&(tag==102))) {
        return;
    }
    
    UIViewController *oldViewController = currentController;
    switch (tag) {
        case 100:{
            [self transitionFromViewController:currentController toViewController:self.controller1 duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.mainView addSubview:self.controller1.view];
                    currentController = self.controller1;
                    self.title = @"未执行";

                }else{
                    currentController = oldViewController;
                    
                }
            }];
        }
            break;
        case 101:
        {
            
            [self transitionFromViewController:currentController toViewController:self.controller2 duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.mainView addSubview:self.controller2.view];
                    currentController = self.controller2;
                    self.title = @"已执行";

                }else{
                    
                    currentController = oldViewController;
                }
            }];
            
        }
            break;
            
        case 102:
        {
            
            [self transitionFromViewController:currentController toViewController:self.controller3 duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.mainView addSubview:self.controller3.view];
                    self.title = @"已取消";

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


- (TaskViewController *)controller1
{
    if (!_controller1) {
        _controller1 = [[TaskViewController alloc] init];
    }
    
    return _controller1;
}

- (FinishiTaskViewController *)controller2
{
    if (!_controller2) {
        _controller2 = [[FinishiTaskViewController alloc] init];
    }
    
    return _controller2;
}

- (CancelTaskViewController *)controller3
{
    if (!_controller3) {
        _controller3 = [[CancelTaskViewController alloc] init];
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

- (TaskHeadView *)headView
{
    if (!_headView) {
        _headView = [[TaskHeadView alloc] initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 40)];
        _headView.delegate = self;
    }
    
    return _headView;
}



@end
