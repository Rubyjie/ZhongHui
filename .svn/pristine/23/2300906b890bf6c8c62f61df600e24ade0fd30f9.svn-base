//
//  CommonUtils.m
//  RTSS
//
//  Created by shengyp on 14/10/23.
//  Copyright (c) 2014年 shengyp. All rights reserved.
//

#import "CommonUtils.h"
#import "ImageUtils.h"

// 当前系统版本值
#define SYSTEM_VERSION_FLOAT            [[[UIDevice currentDevice] systemVersion] floatValue]
@implementation CommonUtils
+ (BOOL)checkNewUserPassword:(NSString *)password{
    return YES;
}
+ (BOOL)checkNewUserID:(NSString *)userId{
    return YES;
}
+ (UIColor*)colorWithHexString:(NSString*)hexString{
    if(nil == hexString || hexString.length < 7){
        return nil;
    }
    
    unsigned int red, green, blue;
    
    NSRange range = NSMakeRange(1, 2);
    [[NSScanner scannerWithString:[hexString substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[hexString substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[hexString substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(CGFloat)(red/255.0f) green:(CGFloat)(green/255.0f) blue:(CGFloat)(blue/255.0f) alpha:1.0f];
}

//弹框
+(void)showAlert:(NSString *)title content:(NSString *)content{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:content delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}


+ (UIButton*)buttonWithType:(UIButtonType)type frame:(CGRect)frame title:(NSString*)title bgImageNormal:(UIImage*)bgImageNormal bgImageHighlighted:(UIImage*)bgImageHighlighted bgImageSelected:(UIImage*)bgImageSelected addTarget:(id)target action:(SEL)action tag:(NSInteger)tag{
    
    UIButton *button = [UIButton buttonWithType:type];
    button.frame = frame;
    button.tag = tag;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    if(nil != title){
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    if(nil != bgImageNormal){
        [button setBackgroundImage:bgImageNormal forState:UIControlStateNormal];
    }
    if(nil != bgImageHighlighted){
        [button setBackgroundImage:bgImageHighlighted forState:UIControlStateHighlighted];
    }
    if(nil != bgImageSelected){
        [button setBackgroundImage:bgImageSelected forState:UIControlStateSelected];
    }
    
    return button;
}

+ (UIButton*)buttonWithType:(UIButtonType)type frame:(CGRect)frame title:(NSString*)title imageNormal:(UIImage*)imageNormal imageHighlighted:(UIImage*)imageHighlighted imageSelected:(UIImage*)imageSelected addTarget:(id)target action:(SEL)action tag:(NSInteger)tag{
    
    UIButton *button = [UIButton buttonWithType:type];
    button.frame = frame;
    button.tag = tag;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    if(nil != title){
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    if(nil != imageNormal){
        [button setImage:imageNormal forState:UIControlStateNormal];
    }
    if(nil != imageHighlighted){
        [button setImage:imageHighlighted forState:UIControlStateHighlighted];
    }
    if(nil != imageSelected){
        [button setImage:imageSelected forState:UIControlStateSelected];
    }
    
    return button;
}

+ (UIButton*)buttonWithType:(UIButtonType)type frame:(CGRect)frame title:(NSString*)title colorNormal:(UIColor*)colorNormal colorHighlighted:(UIColor*)colorHighlighted colorSelected:(UIColor*)colorSelected addTarget:(id)target action:(SEL)action tag:(NSInteger)tag{
    
    UIButton* button = [UIButton buttonWithType:type];
    button.frame = frame;
    button.tag = tag;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    CGSize size = CGSizeMake(frame.size.width, frame.size.height);
    if(nil != title){
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    if(nil != colorNormal){
        [button setBackgroundImage:[ImageUtils createImageWithColor:colorNormal size:size] forState:UIControlStateNormal];
    }
    if(nil != colorHighlighted){
        [button setBackgroundImage:[ImageUtils createImageWithColor:colorHighlighted size:size] forState:UIControlStateHighlighted];
    }
    if(nil != colorSelected){
        [button setBackgroundImage:[ImageUtils createImageWithColor:colorSelected size:size] forState:UIControlStateSelected];
    }
    
    return button;
}

+ (UILabel*)labelWithFrame:(CGRect)frame text:(NSString*)text textColor:(UIColor*)textColor textFont:(UIFont*)textFont tag:(NSInteger)tag{
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.tag = tag;
    label.text = text;
    label.textColor = textColor;
    label.font = textFont;
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    
    return label;
}

+ (UITextField*)textFieldWithFrame:(CGRect)frame text:(NSString*)text textColor:(UIColor*)textColor textFont:(UIFont*)textFont tag:(NSInteger)tag{

    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.tag = tag;
    textField.text = text;
    textField.textColor = textColor;
    textField.font = textFont;
    textField.textAlignment = NSTextAlignmentCenter;
    textField.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    return textField;
}

+ (NSString*)formatDeviceToken:(NSData*)deviceToken{
    NSCharacterSet* cs = [NSCharacterSet characterSetWithCharactersInString:@"< >"];
    return [[[deviceToken description] componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
}

+ (BOOL)objectIsValid:(id)object{
    if([NSNull null] != object && nil != object && [object isKindOfClass:[NSString class]] && ((NSString*)object).length > 0){
        return YES;
    }else if([NSNull null] != object && nil != object && [object isKindOfClass:[NSArray class]] && [(NSArray*)object count] > 0){
        return YES;
    }else if([NSNull null] != object && nil != object && [object isKindOfClass:[NSMutableArray class]] && [(NSMutableArray*)object count] > 0){
        return YES;
    }else if([NSNull null] != object && nil != object && [object isKindOfClass:[NSDictionary class]]){
        return YES;
    }else if([NSNull null] != object && nil != object && [object isKindOfClass:[NSMutableDictionary class]]){
        return YES;
    }else if ([NSNull null] != object && nil != object && [object isKindOfClass:[NSNumber class]]) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark calculate size
+ (CGSize)calculateTextSize:(NSString *)textString constrainedSize:(CGSize)size textFont:(UIFont *)font lineBreakMode:(NSLineBreakMode)breakMode {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = breakMode;
    CGFloat systemVersion = SYSTEM_VERSION_FLOAT;
    CGSize textSize = CGSizeZero;
    if (systemVersion >= 7.0) {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
        NSDictionary *attributes = @{NSFontAttributeName:font,
                                     NSParagraphStyleAttributeName:paragraphStyle
                                     };
        textSize = [textString boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
#else
        textSize = [textString sizeWithFont:font constrainedToSize:size lineBreakMode:breakMode];
        
#endif
    } else {
#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_7_0
        textSize = [textString sizeWithFont:font constrainedToSize:size lineBreakMode:breakMode];
#endif
    }
    return textSize;

}


+ (UIViewController *)getCurrentViewController
{
    UIViewController *result = nil;
    //获取当前显示的vc
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
#pragma mark --- 加上后点击退出登录会崩溃
//    UIView *frontView = [[window subviews] objectAtIndex:10];
//    id nextResponder = [frontView nextResponder];
    
//    if ([nextResponder isKindOfClass:[UIViewController class]])
//        result = nextResponder;
//    else
//        result = window.rootViewController;
    return result;
}

+ (CGSize)sizeWithContentString:(NSString *)string font:(UIFont *)font size:(CGSize)size
{
    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGRect summaryRect = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    return summaryRect.size;
}

//计算控件的高度
+(CGSize)sizeWithContentString:(NSString *)string size:(CGSize)size lineSpace:(NSInteger)space font:(UIFont *)font
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    CGSize textSize = CGSizeZero;
    NSDictionary *attributes = @{NSFontAttributeName:font,
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    textSize = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    return textSize;
}

+(void)setExterTableViewCellHidden:(UITableView *)tableView{
    UIView  *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

+ (void)viewUpAnimation:(UIView *)sender andHeight:(CGFloat)height andUp:(BOOL)isUp
{
    [UIView beginAnimations:@"animation0" context:nil];
    [UIView setAnimationDuration:0.25f];//动画时间
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatAutoreverses:NO];
    CGRect rect = sender.frame;
    if (isUp) {
        rect.origin.y = rect.origin.y - height;
    }else{
        rect.origin.y = rect.origin.y + height;
    }
    sender.frame = rect;
    [UIView commitAnimations];
}

+ (BOOL) checkIsAllNumber:(NSString *)content
{
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^0-9]" options:0 error:&error];
    NSArray *matches = [regex matchesInString:content options:0 range:NSMakeRange(0, [content length])];
    NSMutableString *content_sb = [[NSMutableString alloc]init];
    for (NSTextCheckingResult *match in matches) {
        NSRange matchRange = [match range];
        [content_sb appendString:[content substringWithRange:matchRange]];
    }
    return [content_sb length]==0?YES:NO;
}

+ (BOOL)checkPhoneNumberIsValid:(NSString *)phoneNumber{
    BOOL allNumber = NO;
    BOOL length = NO;
    BOOL prefix = NO;
    if ([self checkIsAllNumber:phoneNumber]) {
        allNumber = YES;
    }
    if ([phoneNumber length] == 11) {
        length = YES;
    }
    if ([phoneNumber hasPrefix:@"13"]||[phoneNumber hasPrefix:@"15"]||[phoneNumber hasPrefix:@"18"]||[phoneNumber hasPrefix:@"14"]||[phoneNumber hasPrefix:@"17"]) {
        prefix = YES;
    }
    
    if (allNumber && length && prefix) {
        return YES;
    } else {
        return  NO;
    }

}

#pragma mark - 弹框
+ (void) showAlertViewTitle:(NSString *)mTitile message:(NSString *)mMessage{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:mTitile message:mMessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

@end
