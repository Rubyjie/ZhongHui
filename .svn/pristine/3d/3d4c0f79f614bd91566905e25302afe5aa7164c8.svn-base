//
//  scheduleFowView.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/29.
//  Copyright © 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "scheduleFowView.h"

@interface scheduleFowView () <UITextViewDelegate>

@end

@implementation scheduleFowView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        
        [self initScheduleFowView];
    }
    return self;
}

-(void)initScheduleFowView
{
    NSArray *textArray = @[@"跟进时间",@"结束",@"原因",@"内容",@"说明"];
    for (int i = 0; i < textArray.count; i++) {
        
        CALayer *henglayer = [[CALayer alloc] init];
        henglayer.backgroundColor = RGB(0, 195, 236).CGColor;
        henglayer.frame = CGRectMake(0, 50+49.5*i, PHONE_UISCREEN_WIDTH, 0.5);
        [self.layer addSublayer:henglayer];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 50*i, 50, 50)];
        titleLabel.textColor = [UIColor grayColor];
        titleLabel.adjustsFontSizeToFitWidth = YES;
        titleLabel.tag = 10 + i;
        titleLabel.text = [textArray objectAtIndex:i];
        if (titleLabel.tag == 10 || titleLabel.tag == 11 || titleLabel.tag == 12) {
            
            titleLabel.textColor = [UIColor redColor];
        }
        titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:titleLabel];
        
        
        if (i == 0 || i == 1 || i == 2) {
            
            UIButton *chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
            chooseButton.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame)+10, 50*i, PHONE_UISCREEN_WIDTH-70, 50);
            [chooseButton setTitle:@"请选择" forState:UIControlStateNormal];
            [chooseButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            chooseButton.titleLabel.font = [UIFont systemFontOfSize:14];
            chooseButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [self addSubview:chooseButton];

        }else {
        
            
            UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame)+10, (50*i), PHONE_UISCREEN_WIDTH - 70, 50)];
            textView.backgroundColor = [UIColor clearColor];
            textView.text = @"请输入";
            textView.textColor = RGB(192, 192, 194);
            textView.delegate = self;
            
            //            CGFloat fontCapHeight = textView.font.capHeight; // 文字大小所占的高度
            CGFloat topMargin = 10; // 跟顶部的间距
            textView.contentInset = UIEdgeInsetsMake(topMargin , 0, 0, 0);
            textView.font = [UIFont systemFontOfSize:14];
            [self addSubview:textView];

        
        }
        
    }
    
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(20, 5*50+20, PHONE_UISCREEN_WIDTH-40, 30);
    butt.backgroundColor = RGB(0, 195, 236);
    [butt setTitle:@"确定" forState:UIControlStateNormal];
    [self addSubview:butt];

    
}

@end
