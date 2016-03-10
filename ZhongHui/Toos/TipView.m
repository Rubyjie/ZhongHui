//
//  TipView.m
//  DATEBAO
//
//  Created by on 15/8/12.
//  Copyright (c) 2015年 . All rights reserved.
//

#import "TipView.h"


@interface TipView ()
{
  
    UIView *_tipview;
    UIImageView *tipimageview;
    UILabel *_tiplabel;
    int a;
}
@property (nonatomic,strong) UIView *tipview;
@property (nonatomic,strong) UILabel *tiplabel;
@end
@implementation TipView

-(UIView*)tipview
{
    if (!_tipview) {
        _tipview = [[UIView alloc]init];
    }
    return _tipview;
}
- (UILabel*)tiplabel
{
    if (!_tiplabel) {
        _tiplabel = [[UILabel alloc]init];
    }
    return _tiplabel;
}

//弹窗
- (void)presentSuccessTips:(NSString *)message
{
    a = 0;
    self.tipview.frame = CGRectMake(0, 0, 100, 50);
    _tipview.center = [UIApplication sharedApplication].keyWindow.center;
    _tipview.layer.cornerRadius = 6;
    _tipview.layer.masksToBounds = YES;
    _tipview.backgroundColor = [UIColor blackColor];
    _tipview.alpha = 0.0;
    tipimageview = [[UIImageView alloc]initWithFrame:CGRectMake(30, 18, 78/2, 63/2)];
    tipimageview.image = [UIImage imageNamed:@"002-@2x"];
    tipimageview.alpha = 0.0;
    [_tipview addSubview:tipimageview];
    
    self.tiplabel.frame = CGRectMake(0, 17, _tipview.frame.size.width, 16);
    self.tiplabel.backgroundColor = [UIColor clearColor];
    self.tiplabel.textAlignment = NSTextAlignmentCenter;
    self.tiplabel.textColor = [UIColor whiteColor];
    self.tiplabel.font = [UIFont systemFontOfSize:12];
    self.tiplabel.text = message;
    self.tiplabel.alpha = 0.0;
    [_tipview addSubview:self.tiplabel];
    
    [[UIApplication sharedApplication].keyWindow addSubview:_tipview];
    [UIView animateWithDuration:0.3 animations:^{
        _tipview.alpha = 0.5;
        self.tiplabel.alpha = 1.0;
        tipimageview.alpha = 1.0;
    }];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(hiddenAndremove) userInfo:nil repeats:NO];
    
}

- (void)hiddenAndremove
{
    
    [UIView animateWithDuration:0.6 animations:^{
        _tipview.alpha = 0.0;
        self.tiplabel.alpha = 0.0;
        tipimageview.alpha = 0.0;
    } completion:^(BOOL finished) {
        [_tipview removeFromSuperview];
        self.tiplabel.text = @"";
    }];
    
}

- (void)presentMessageTips:(NSString *)message
{
    self.tipview.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH/2, 30);
    CGSize Mysize = [self returnMysizeWithCgsize:CGSizeMake(PHONE_UISCREEN_WIDTH, 30) text:message font:[UIFont systemFontOfSize:12]];
    self.tipview.frame = CGRectMake(0, 0, Mysize.width+20, 30);
    _tipview.center = [UIApplication sharedApplication].keyWindow.center;
    _tipview.layer.cornerRadius = 3;
    _tipview.layer.masksToBounds = YES;
    _tipview.backgroundColor = [self getColor:@"333333"];
    _tipview.alpha = 0.8;
    
    self.tiplabel.frame = CGRectMake(0, 0, _tipview.frame.size.width, 30);
    self.tiplabel.backgroundColor = [UIColor clearColor];
    self.tiplabel.textAlignment = NSTextAlignmentCenter;
    self.tiplabel.textColor = [self getColor:@"ffffff"];
    self.tiplabel.font = [UIFont systemFontOfSize:12];
    self.tiplabel.text = message;
    self.tiplabel.adjustsFontSizeToFitWidth = YES;
    self.tiplabel.alpha = 1;
    [_tipview addSubview:self.tiplabel];
    
    
    [UIView animateWithDuration:0.1 animations:^{
        _tipview.alpha = 0.8;
        self.tiplabel.alpha = 1.0;
        [[UIApplication sharedApplication].keyWindow addSubview:_tipview];
    }];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(removeMessageTip) userInfo:nil repeats:NO];

}
- (void)removeMessageTip
{
   [UIView animateWithDuration:0.2 animations:^{
       _tipview.frame = CGRectMake(PHONE_UISCREEN_WIDTH/2, PHONE_UISCREEN_HEIGHT/2, 0,0);
       self.tiplabel.text= @"";
       self.tiplabel.alpha = 0.0;
       _tipview.alpha = 0.0;
       
   } completion:^(BOOL finished) {
       [self.tipview removeFromSuperview];
       [self.tiplabel removeFromSuperview];
       self.tiplabel.text = nil;
   }];
}

- (void)presentFailureTips:(NSString *)message
{
    [self presentSuccessTips:message];
     tipimageview.image = [UIImage imageNamed:@"001-@2x"];
 }

- (void)presectLoadingTips:(NSString *)messsage
{
    [self presentSuccessTips:messsage];
    tipimageview.image = [UIImage imageNamed:@"transform-"];
    tipimageview.frame = CGRectMake(17, 3, 66, 66);
    [self begainLoading];
    
}
- (void)begainLoading
{
    
    [UIView animateWithDuration:0.6 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        tipimageview.transform = CGAffineTransformRotate(tipimageview.transform, M_PI);
        
    } completion:^(BOOL finished) {
        if (!a) {
            [self begainLoading];
        }
    }];
}
- (void)stopLoading
{
    a = 1;
}
-(UIColor *) getColor:(NSString *)hexColor
{
    unsigned int red, green, blue;
    NSRange range;
    range.length =2;
    
    range.location =0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&red];
    range.location =2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
    range.location =4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green/255.0f)blue:(float)(blue/255.0f)alpha:1.0f];
}
- (CGSize)returnMysizeWithCgsize:(CGSize)mysize text:(NSString*)mystring font:(UIFont*)myfont
{
    CGSize size;
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:myfont,NSFontAttributeName, nil];
    size = [mystring boundingRectWithSize:mysize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    return size;
}
@end
