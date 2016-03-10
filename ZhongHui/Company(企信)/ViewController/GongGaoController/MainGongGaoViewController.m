//
//  MainGongGaoViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/19.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "MainGongGaoViewController.h"
#import "GongGaoViewController.h"
#import "UnreadViewController.h"
#import "GongGaoView.h"

@interface MainGongGaoViewController ()<GongGaoButtonDelegate>

{
    // 当前viewController
    UIViewController *currentController;
}

@property (nonatomic, strong)GongGaoViewController *yiDuController; //未读

@property (nonatomic, strong)UnreadViewController  *weiDuController;//已读

@property (nonatomic, strong) GongGaoView *GongGaoHeadView;

@property (nonatomic, strong)UIView *gongGaoMainView;

@end

@implementation MainGongGaoViewController

-(UIView *)gongGaoMainView
{
    if (!_gongGaoMainView) {
        _gongGaoMainView = [[UIView alloc]initWithFrame:CGRectMake(0, 40, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40)];
    }
    return _gongGaoMainView;
}

-(GongGaoView *)GongGaoHeadView
{
    if (!_GongGaoHeadView) {
        
        _GongGaoHeadView = [[GongGaoView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 40)];
        _GongGaoHeadView.delegate = self;
    }
    return _GongGaoHeadView;
}


-(GongGaoViewController *)yiDuController
{
    if (!_yiDuController) {
        _yiDuController = [[GongGaoViewController alloc]init];
    }
    return _yiDuController;
}

-(UnreadViewController *)weiDuController
{
    if (!_weiDuController) {
        _weiDuController = [[UnreadViewController alloc]init];
    }
    return _weiDuController;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"未读公告";
    [self.view addSubview:self.GongGaoHeadView];
    [self.view addSubview:self.gongGaoMainView];
    
    [self addChildViewController:self.yiDuController];
    [self addChildViewController:self.weiDuController];
    
    currentController = self.yiDuController;
    [self.gongGaoMainView addSubview:self.yiDuController.view];

}

#pragma mark - 400未读公告  401已读公告
-(void)swithButtonQueryGongGaoStatuWithTag:(NSInteger)tag
{
    
    if (((currentController==self.yiDuController)&&(tag==400))||((currentController==self.weiDuController )&&(tag==401))) {
        return;
    }
    
    UIViewController *oldViewController = currentController;
    switch (tag) {
        case 400:{
            [self transitionFromViewController:currentController toViewController:self.yiDuController duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.gongGaoMainView addSubview:self.yiDuController.view];
                    currentController = self.yiDuController;
                    self.title = @"未读公告";
                }else{
                    currentController = oldViewController;
                    
                }
            }];
        }
            break;
        case 401:
        {
            
            [self transitionFromViewController:currentController toViewController:self.weiDuController duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.gongGaoMainView addSubview:self.weiDuController.view];
                    currentController = self.weiDuController;
                    
                    self.title = @"已读公告";
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



@end
