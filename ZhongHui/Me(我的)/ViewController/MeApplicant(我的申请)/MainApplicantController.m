//
//  MainApplicantController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "MainApplicantController.h"
#import "ToSubmitController.h"  // 待提交
#import "ProcessController.h"   // 处理中
#import "CaseController.h"      // 已结案
#import "ApplicantView.h"

@interface MainApplicantController () <applicantButtonDelegate>
{
    // 当前viewController
    UIViewController *currentController;
}

@property (nonatomic, strong) ApplicantView *headView;

@property (nonatomic, strong) ToSubmitController *controller1;
@property (nonatomic, strong) ProcessController  *controller2;
@property (nonatomic, strong) CaseController     *controller3;

@property (nonatomic, strong) UIView *mainView;


@end

@implementation MainApplicantController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"待提交";
    [self.view addSubview:self.headView];
    [self.view addSubview:self.mainView];
    
    [self addChildViewController:self.controller1];
    [self addChildViewController:self.controller2];
    [self addChildViewController:self.controller3];
    
    currentController = self.controller1;
    
    [self.mainView addSubview:self.controller1.view];
    
    
}

#pragma mark 900待提交  901处理中  902已结案
-(void)selectedApplicantStateWithTag:(NSInteger)tag
{
    if (((currentController==self.controller1)&&(tag==900))||((currentController==self.controller2 )&&(tag==901)) ||((currentController==self.controller3)&&(tag==902))) {
        return;
    }
    
    UIViewController *oldViewController = currentController;
    switch (tag) {
        case 900:{
            [self transitionFromViewController:currentController toViewController:self.controller1 duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.mainView addSubview:self.controller1.view];
                    currentController = self.controller1;
                    self.title = @"待提交";
                }else{
                    currentController = oldViewController;
                    
                }
            }];
        }
            break;
        case 901:
        {
            
            [self transitionFromViewController:currentController toViewController:self.controller2 duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.mainView addSubview:self.controller2.view];
                    currentController = self.controller2;
                    self.title = @"处理中";
                }else{
                    
                    currentController = oldViewController;
                }
            }];
            
        }
            break;
            
        case 902:
        {
            
            [self transitionFromViewController:currentController toViewController:self.controller3 duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.mainView addSubview:self.controller3.view];
                    
                    currentController = self.controller3;
                    self.title = @"已结案";
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


- (ToSubmitController *)controller1
{
    if (!_controller1) {
        _controller1 = [[ToSubmitController alloc] init];
    }
    
    return _controller1;
}

- (ProcessController *)controller2
{
    if (!_controller2) {
        _controller2 = [[ProcessController alloc] init];
    }
    
    return _controller2;
}

- (CaseController *)controller3
{
    if (!_controller3) {
        _controller3 = [[CaseController alloc] init];
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

- (ApplicantView *)headView
{
    if (!_headView) {
        _headView = [[ApplicantView alloc] initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 40)];
        _headView.delegate = self;
    }
    
    return _headView;
}



@end
