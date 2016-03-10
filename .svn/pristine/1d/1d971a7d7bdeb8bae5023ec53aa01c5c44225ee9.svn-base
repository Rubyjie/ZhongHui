//
//  MainCollectionController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "MainCollectionController.h"
#import "DaiCollectionController.h" // 待收款
#import "YiCollectionController.h"  // 已收款
#import "CollectionView.h"


@interface MainCollectionController () <collectionDelegate>
{
    // 当前viewController
    UIViewController *currentController;
}


@property (nonatomic, strong)DaiCollectionController *controller1;
@property (nonatomic, strong)YiCollectionController  *controller2;
@property (nonatomic, strong) UIView *mainView;
@property (nonatomic, strong) CollectionView *headView;

@end

@implementation MainCollectionController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.title = @"待收款";
    [self.view addSubview:self.headView];
    [self.view addSubview:self.mainView];
    
    [self addChildViewController:self.controller1];
    [self addChildViewController:self.controller2];
    self.view.backgroundColor = [UIColor whiteColor];
    currentController = self.controller1;
    
    [self.mainView addSubview:self.controller1.view];
}

#pragma mark - 90待收款  91已收款
-(void)swithButtonQueryCollectionTypeWithTag:(NSInteger)tag
{
    if (((currentController==self.controller1)&&(tag==90))||((currentController==self.controller2 )&&(tag==91))) {
        return;
    }
    
    UIViewController *oldViewController = currentController;
    switch (tag) {
        case 90:{
            [self transitionFromViewController:currentController toViewController:self.controller1 duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.mainView addSubview:self.controller1.view];
                    currentController = self.controller1;
                    self.title = @"待收款";
                }else{
                    currentController = oldViewController;
                    
                }
            }];
        }
            break;
        case 91:
        {
            
            [self transitionFromViewController:currentController toViewController:self.controller2 duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.mainView addSubview:self.controller2.view];
                    currentController = self.controller2;
                    self.title = @"已收款";
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


- (DaiCollectionController *)controller1
{
    if (!_controller1) {
        _controller1 = [[DaiCollectionController alloc] init];
    }
    
    return _controller1;
}

- (YiCollectionController *)controller2
{
    if (!_controller2) {
        _controller2 = [[YiCollectionController alloc] init];
    }
    
    return _controller2;
}


- (UIView *)mainView
{
    if (!_mainView) {
        _mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64-40)];
    }
    
    return _mainView;
}

- (CollectionView *)headView
{
    if (!_headView) {
        _headView = [[CollectionView alloc] initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 40)];
        _headView.delegate = self;
    }
    
    return _headView;
}

@end
