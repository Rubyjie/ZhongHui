//
//  LogInView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/17.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "LogInView.h"
#import "UIImage+MJ.h"

@interface LogInView () <UITextFieldDelegate>

@end

@implementation LogInView

static float TopHieght = 100;
static float LeftWidth = 30;

static float imageH = 20;


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initLogInViews];
    }
    return self;
}

-(void)initLogInViews
{
    CALayer *quanlayer = [[CALayer alloc] init];
    quanlayer.frame = CGRectMake(LeftWidth, 100, PHONE_UISCREEN_WIDTH-LeftWidth*2, 40);
    quanlayer.cornerRadius = 5;
    quanlayer.backgroundColor = [UIColor whiteColor].CGColor;
    quanlayer.borderColor = RGB(27, 195, 237).CGColor;
    quanlayer.borderWidth = 1.0;
    [self.layer addSublayer:quanlayer];
    
    
    CALayer *shulayer = [[CALayer alloc] init];
    shulayer.frame = CGRectMake(LeftWidth+38, 102, 1, 34);
    shulayer.cornerRadius = 5;
    shulayer.backgroundColor = [UIColor whiteColor].CGColor;
    shulayer.borderColor = RGB(27, 195, 237).CGColor;
    shulayer.borderWidth = 1.0;
    [self.layer addSublayer:shulayer];
    

    CALayer *nextlayer = [[CALayer alloc] init];
    nextlayer.frame = CGRectMake(LeftWidth, 100+60, PHONE_UISCREEN_WIDTH-LeftWidth*2, 40);
    nextlayer.cornerRadius = 5;
    nextlayer.backgroundColor = [UIColor whiteColor].CGColor;
    nextlayer.borderColor = RGB(27, 195, 237).CGColor;
    nextlayer.borderWidth = 1.0;
    [self.layer addSublayer:nextlayer];
    
    CALayer *nextShulayer = [[CALayer alloc] init];
    nextShulayer.frame = CGRectMake(LeftWidth+38, 162, 1, 34);
    nextShulayer.cornerRadius = 5;
    nextShulayer.backgroundColor = [UIColor whiteColor].CGColor;
    nextShulayer.borderColor = RGB(27, 195, 237).CGColor;
    nextShulayer.borderWidth = 1.0;
    [self.layer addSublayer:nextShulayer];

    
    UIImageView *IconImage = [[UIImageView alloc]initWithFrame:CGRectMake(LeftWidth+ 10, TopHieght + 10, 20, imageH)];
    IconImage.image = [UIImage imageNamed:@"用户名.png"];
    [self addSubview:IconImage];

    // 名称
    CGFloat nameTextW = PHONE_UISCREEN_WIDTH - (LeftWidth*2) - 40;
    UITextField *nameText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(shulayer.frame)+5, TopHieght, nameTextW, 40)];
    nameText.delegate = self;
    nameText.placeholder = @"请输入名称";
    nameText.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:nameText];
    self.userName = nameText;
    
    
    UIImageView *passImage = [[UIImageView alloc]initWithFrame:CGRectMake(LeftWidth+10, CGRectGetMaxY(IconImage.frame)+ 40, 20, imageH)];
    passImage.image = [UIImage imageNamed:@"密码.png"];
    [self addSubview:passImage];
    
    // 密码
    UITextField *passText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nextShulayer.frame)+5, CGRectGetMaxY(nameText.frame)+20, nameTextW, 40)];
    passText.placeholder = @"请输入密码";
    passText.secureTextEntry = YES;  //设置键盘密码格式 隐藏输入内容

    passText.clearButtonMode = UITextFieldViewModeWhileEditing;
    passText.layer.borderColor = NAV_COLOR.CGColor;
    [self addSubview:passText];
    self.password = passText;
    
    // 登录
    CGFloat logButtonW = PHONE_UISCREEN_WIDTH - (LeftWidth*2);
    UIButton *logButton = [UIButton buttonWithType:UIButtonTypeCustom];
    logButton.frame = CGRectMake(LeftWidth, CGRectGetMaxY(passText.frame)+20, logButtonW, 40);
    logButton.backgroundColor = RGB(27, 195, 237);
    [logButton setTitle:@"登录" forState:UIControlStateNormal];
    logButton.showsTouchWhenHighlighted = YES;
    logButton.layer.cornerRadius = 5;
    logButton.layer.masksToBounds = YES;
    [logButton addTarget:self action:@selector(clcikButtonLogIn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:logButton];
    
    // 忘记
//    UIButton *forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    forgetButton.frame = CGRectMake(LeftWidth, CGRectGetMaxY(logButton.frame)+30, 100, 20);
//    forgetButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [forgetButton setTitle:@"忘记密码?" forState:UIControlStateNormal];
//    [forgetButton setTitleColor:NAV_COLOR forState:UIControlStateNormal];
//    forgetButton.titleLabel.font = [UIFont systemFontOfSize:14];
//    [self addSubview:forgetButton];
    
    
//    // 注册
//    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    registerButton.frame = CGRectMake(PHONE_UISCREEN_WIDTH - LeftWidth - 100, CGRectGetMaxY(logButton.frame)+30, 100, 20);
//    registerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
//    [registerButton setTitle:@"现在去注册" forState:UIControlStateNormal];
//    [registerButton setTitleColor:NAV_COLOR forState:UIControlStateNormal];
//    registerButton.titleLabel.font = [UIFont systemFontOfSize:14];
//    [registerButton addTarget:self action:@selector(swithBUttonGoRegister:) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:registerButton];

}

-(void)clcikButtonLogIn:(UIButton *)button
{
    
    [self.mdelegate swithButtonLogInWithUserName:self.userName.text passWord:self.password.text];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

#pragma mark - 点击右下角按钮收起键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
