//
//  CommonUtils.h
//  RTSS
//
//  Created by shengyp on 14/10/23.
//  Copyright (c) 2014年 shengyp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommonUtils : NSObject

// 创建UIColor
+ (UIColor*)colorWithHexString:(NSString*)hexString;

// 创建UIButton 背景图片
+ (UIButton*)buttonWithType:(UIButtonType)type
                      frame:(CGRect)frame
                      title:(NSString*)title
              bgImageNormal:(UIImage*)bgImageNormal
         bgImageHighlighted:(UIImage*)bgImageHighlighted
            bgImageSelected:(UIImage*)bgImageSelected
                  addTarget:(id)target
                     action:(SEL)action
                        tag:(NSInteger)tag;

// 创建UIButton 内部图片
+ (UIButton*)buttonWithType:(UIButtonType)type
                      frame:(CGRect)frame
                      title:(NSString*)title
                imageNormal:(UIImage*)imageNormal
           imageHighlighted:(UIImage*)imageHighlighted
              imageSelected:(UIImage*)imageSelected
                  addTarget:(id)target
                     action:(SEL)action
                        tag:(NSInteger)tag;
// 创建UIButton 根据色值
+ (UIButton*)buttonWithType:(UIButtonType)type
                      frame:(CGRect)frame
                      title:(NSString*)title
                colorNormal:(UIColor*)colorNormal
           colorHighlighted:(UIColor*)colorHighlighted
              colorSelected:(UIColor*)colorSelected
                  addTarget:(id)target
                     action:(SEL)action
                        tag:(NSInteger)tag;

// 创建UILabel
+ (UILabel*)labelWithFrame:(CGRect)frame text:(NSString*)text textColor:(UIColor*)textColor textFont:(UIFont*)textFont tag:(NSInteger)tag;

// 创建UITextField
+ (UITextField*)textFieldWithFrame:(CGRect)frame text:(NSString*)text textColor:(UIColor*)textColor textFont:(UIFont*)textFont tag:(NSInteger)tag;

// 格式化deviceToken
+ (NSString*)formatDeviceToken:(NSData*)deviceToken;

// 校验新UserID
+ (BOOL)checkNewUserID:(NSString*)userId;

// 校验新用户密码
+ (BOOL)checkNewUserPassword:(NSString*)password;

//弹框
+(void)showAlert:(NSString *)title content:(NSString *)content;


// 对象是否有效
+ (BOOL)objectIsValid:(id)object;

//计算文本大小
+ (CGSize)calculateTextSize:(NSString *)textString constrainedSize:(CGSize)size textFont:(UIFont *)font lineBreakMode:(NSLineBreakMode)breakMode;

+(CGSize)sizeWithContentString:(NSString *)string size:(CGSize)size lineSpace:(NSInteger)space font:(UIFont *)font;

//获取当前显示的ViewController
+ (UIViewController *) getCurrentViewController;

//获取字符串高度
+(CGSize )sizeWithContentString:(NSString *)string font:(UIFont *) font size:(CGSize)size;

//隐藏Tableview多余的线
+(void)setExterTableViewCellHidden:(UITableView *)tableView;

+ (void)viewUpAnimation:(UIView *)sender andHeight:(CGFloat)height andUp:(BOOL)isUp;

//查看是否都是数字
+ (BOOL) checkIsAllNumber:(NSString *)content;

//验证手机号是否合法
+ (BOOL)checkPhoneNumberIsValid:(NSString *)phoneNumber;

+ (void) showAlertViewTitle:(NSString *)mTitile message:(NSString *)mMessage;

@end
