//
//  MainMessageController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/19.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "MainMessageController.h"
#import "DaiDuMessageController.h"
#import "MessageViewController.h"
#import "MessageView.h"

@interface MainMessageController () <messageButtonDelegate>

{
    // 当前viewController
    UIViewController *currentController;
}

@property (nonatomic, strong)DaiDuMessageController *daiDuController;

@property (nonatomic, strong)MessageViewController  *yiDuController;

@property (nonatomic, strong)MessageView *messageHeadView;

@property (nonatomic, strong)UIView *messageMainView;
@end

@implementation MainMessageController

-(UIView *)messageMainView
{
    if (!_messageMainView) {
        _messageMainView = [[UIView alloc]initWithFrame:CGRectMake(0, 40, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40)];
    }
    return _messageMainView;
}

-(MessageView *)messageHeadView
{
    if (!_messageHeadView) {
        
        _messageHeadView = [[MessageView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 40)];
        _messageHeadView.delegate = self;
    }
    return _messageHeadView;
}

-(MessageViewController *)yiDuController
{
    if (!_yiDuController) {
        _yiDuController = [[MessageViewController alloc]init];
    }
    return _yiDuController;
}

-(DaiDuMessageController *)daiDuController
{
    if (!_daiDuController) {
        _daiDuController = [[DaiDuMessageController alloc]init];
    }
    return _daiDuController;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    if (self.yiDuController) {
        
        self.title = @"已读消息";

    }else if (self.daiDuController){
        
        self.title = @"未读消息";
    }
    
    [self.view addSubview:self.messageHeadView];
    [self.view addSubview:self.messageMainView];
    
    [self addChildViewController:self.yiDuController];
    [self addChildViewController:self.daiDuController];
    
    currentController = self.yiDuController;
    [self.messageMainView addSubview:self.yiDuController.view];
}

#pragma mark - 300已读消息  301 待读消息
-(void)swithButtonLookMessageStatusWithTag:(NSInteger)tag
{
    
    if (((currentController==self.yiDuController)&&(tag==300))||((currentController==self.daiDuController )&&(tag==301))) {
        return;
    }
    
    UIViewController *oldViewController = currentController;
    switch (tag) {
        case 300:{
            [self transitionFromViewController:currentController toViewController:self.yiDuController duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.messageMainView addSubview:self.yiDuController.view];
                    currentController = self.yiDuController;
                    self.title = @"已读消息";
                }else{
                    currentController = oldViewController;
                    
                }
            }];
        }
            break;
        case 301:
        {
            
            [self transitionFromViewController:currentController toViewController:self.daiDuController duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.messageMainView addSubview:self.daiDuController.view];
                    currentController = self.daiDuController;
                    self.title = @"未读消息";
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
