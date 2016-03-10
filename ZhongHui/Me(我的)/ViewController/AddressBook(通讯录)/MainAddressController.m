//
//  MainAddressController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "MainAddressController.h"
#import "AddressViewController.h"  //同事
#import "DepartmentController.h"   //部门区域
#import "SearchController.h"       //高级搜索

#import "AddressTopView.h"

@interface MainAddressController () <addressButtonDelegate>

{
    // 当前viewController
    UIViewController *currentController;
}

@property (nonatomic, strong)AddressTopView *topView;

@property (nonatomic, strong) AddressViewController *controller1;
@property (nonatomic, strong) DepartmentController *controller2;
@property (nonatomic, strong) SearchController *controller3;

@property (nonatomic, strong) UIView *mainView;


@end

@implementation MainAddressController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"同事";
    [self.view addSubview:self.topView];
    [self.view addSubview:self.mainView];
    
    [self addChildViewController:self.controller1];
    [self addChildViewController:self.controller2];
    [self addChildViewController:self.controller3];
    
    currentController = self.controller1;
    
    [self.mainView addSubview:self.controller1.view];

    
}


#pragma mark - 700同事   701部门区域  702高级搜索
- (void)swithButtonQueryContractWithTag:(NSInteger)tag
{
    if (((currentController==self.controller1)&&(tag==100))||((currentController==self.controller2 )&&(tag==101)) ||((currentController==self.controller3)&&(tag==102))) {
        return;
    }
    
    UIViewController *oldViewController = currentController;
    switch (tag) {
        case 700:{
            [self transitionFromViewController:currentController toViewController:self.controller1 duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.mainView addSubview:self.controller1.view];
                    currentController = self.controller1;
                    self.title = @"同事";
                    
                }else{
                    currentController = oldViewController;
                    
                }
            }];
        }
            break;
        case 701:
        {
            
            [self transitionFromViewController:currentController toViewController:self.controller2 duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.mainView addSubview:self.controller2.view];
                    currentController = self.controller2;
                    self.title = @"部门";
                }else{
                    
                    currentController = oldViewController;
                }
            }];
            
        }
            break;
            
        case 702:
        {
            
            [self transitionFromViewController:currentController toViewController:self.controller3 duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.mainView addSubview:self.controller3.view];
                    
                    currentController = self.controller3;
                    self.title = @"高级搜索";
                    
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


- (AddressViewController *)controller1
{
    if (!_controller1) {
        _controller1 = [[AddressViewController alloc] init];
    }
    
    return _controller1;
}

- (DepartmentController *)controller2
{
    if (!_controller2) {
        _controller2 = [[DepartmentController alloc] init];
    }
    
    return _controller2;
}

- (SearchController *)controller3
{
    if (!_controller3) {
        _controller3 = [[SearchController alloc] init];
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

- (AddressTopView *)topView
{
    if (!_topView) {
        _topView = [[AddressTopView alloc] initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 40)];
        _topView.delegate = self;
    }
    
    return _topView;
}




@end
