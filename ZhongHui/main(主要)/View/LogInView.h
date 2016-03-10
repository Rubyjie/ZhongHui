//
//  LogInView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/17.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol logButtonDelegate <NSObject>

#pragma mark - 登录
-(void)swithButtonLogInWithUserName:(NSString *)userName passWord:(NSString *)password;;

//#pragma mark - 注册
//-(void)RegisterButton;

@end

@interface LogInView : UIView

@property (nonatomic, weak)id <logButtonDelegate>mdelegate;

@property (nonatomic, strong)UITextField *userName;

@property (nonatomic, strong)UITextField *password;
@end
