//
//  RegisterView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/17.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "RegisterView.h"

@interface RegisterView () <UITextFieldDelegate>

@end

@implementation RegisterView

static float TopHieght = 100;
static float LeftWidth = 30;
static float imageH = 40;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initRegisViews];
    }
    return self;
}

-(void)initRegisViews
{
    
    // 旧密码
    [UITextField appearance].font = [UIFont systemFontOfSize:14];
    
    CGFloat nameTextW = PHONE_UISCREEN_WIDTH - (LeftWidth*2);
    UITextField *nameText = [[UITextField alloc]initWithFrame:CGRectMake(LeftWidth, TopHieght, nameTextW, imageH)];
    nameText.placeholder = @"请输入旧密码";
    nameText.borderStyle = UITextBorderStyleLine;
    nameText.layer.cornerRadius = 5;
    nameText.delegate = self;
    nameText.tag = 1;
    nameText.clearButtonMode = UITextFieldViewModeWhileEditing;
    nameText.layer.masksToBounds = YES;
    nameText.layer.borderWidth = 1;
    nameText.layer.borderColor = NAV_COLOR.CGColor;
    self.passText = nameText;

    [self addSubview:nameText];
    
        
    // 新密码
    UITextField *passText = [[UITextField alloc]initWithFrame:CGRectMake(LeftWidth, CGRectGetMaxY(nameText.frame)+20, nameTextW, imageH)];
    passText.placeholder = @"请设置新密码(8-20个字符或数字)";
    passText.borderStyle = UITextBorderStyleLine;
    passText.layer.cornerRadius = 5;
    passText.delegate = self;
    passText.layer.masksToBounds = YES;
    passText.layer.borderWidth = 1;
    self.PWd = passText;
    passText.secureTextEntry = YES;  //设置键盘密码格式 隐藏输入内容
    passText.tag = 2;
    passText.clearButtonMode = UITextFieldViewModeWhileEditing;
    passText.layer.borderColor = NAV_COLOR.CGColor;
    [self addSubview:passText];
    
    
    // 确认密码
    UITextField *confirmPassText = [[UITextField alloc]initWithFrame:CGRectMake( LeftWidth, CGRectGetMaxY(passText.frame)+20, nameTextW, imageH)];
    confirmPassText.placeholder = @"请在次输入新密码";
    confirmPassText.borderStyle = UITextBorderStyleLine;
    confirmPassText.layer.cornerRadius = 5;
    confirmPassText.layer.masksToBounds = YES;
    confirmPassText.layer.borderWidth = 1;
    confirmPassText.secureTextEntry = YES;  //设置键盘密码格式 隐藏输入内容
    confirmPassText.clearButtonMode = UITextFieldViewModeWhileEditing;
    confirmPassText.layer.borderColor = NAV_COLOR.CGColor;
    confirmPassText.delegate = self;
    confirmPassText.tag = 3;
    self.confirmPassWd = confirmPassText;

    [self addSubview:confirmPassText];

    // 完成
    CGFloat completeButtonW = PHONE_UISCREEN_WIDTH - (LeftWidth*2);
    UIButton *completeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    completeButton.frame = CGRectMake(LeftWidth, CGRectGetMaxY(confirmPassText.frame)+20, completeButtonW, imageH);
    completeButton.backgroundColor = NAV_COLOR;
    [completeButton setTitle:@"确定" forState:UIControlStateNormal];
    completeButton.showsTouchWhenHighlighted = YES;
    completeButton.layer.cornerRadius = 5;
    completeButton.layer.masksToBounds = YES;
    [completeButton addTarget:self action:@selector(clcikCompleteButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:completeButton];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



-(void)clcikCompleteButton:(UIButton *)button
{
    UITextField *text1 = (UITextField *)[self viewWithTag:1];
    UITextField *text2 = (UITextField *)[self viewWithTag:2];
    UITextField *text3 = (UITextField *)[self viewWithTag:3];

    
    if (text1.text.length < 1) {
        
        [[Session sharedSession].tpView presentMessageTips:@"请输入原密码"];
        
    }else if (text2.text.length < 1) {
    
        [[Session sharedSession].tpView presentMessageTips:@"请输入新密码"];

    }else if (text3.text.length < 1) {
    
        [[Session sharedSession].tpView presentMessageTips:@"请确认密码新密码"];

    }else {
    
        [self.delegate selectedButtonRegister];
    }
}

@end
