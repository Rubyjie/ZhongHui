//
//  RegisterView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/17.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol registeredButtonDelegate <NSObject>

#pragma mark - 点击button修改密码
-(void)selectedButtonRegister;

@end

@interface RegisterView : UIView

@property (nonatomic, weak) id <registeredButtonDelegate>delegate;

@property (nonatomic, strong)UITextField *passText;      // 原密码
@property (nonatomic, strong)UITextField *PWd;           // 新密码
@property (nonatomic, strong)UITextField *confirmPassWd; // 确认密码
@end
