//
//  UndoView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/23.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "UndoView.h"

@interface UndoView () <UITextViewDelegate>

@property (nonatomic, strong)UILabel *placeholderLabel;

@end
@implementation UndoView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(20, 40, PHONE_UISCREEN_WIDTH-40, 40);
        button.backgroundColor = RGB(0, 195, 236);
        [button setTitle:@"请撤销原因" forState:UIControlStateNormal];
        [self addSubview:button];
        
        UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(20, 100, PHONE_UISCREEN_WIDTH-40, 100)];
        textView.backgroundColor = [UIColor whiteColor];
        textView.delegate = self;
        [self addSubview:textView];
        
        self.placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 200, 30)];
        self.placeholderLabel.textColor = [UIColor grayColor];
        self.placeholderLabel.font = [UIFont systemFontOfSize:14];
        self.placeholderLabel.text = @"请简要描述您的说明内容";
        self.placeholderLabel.textColor = [UIColor grayColor];
        self.placeholderLabel.hidden = NO;
        self.placeholderLabel.enabled = NO; //label必须设置为不可用
        [textView addSubview:self.placeholderLabel];
        
        
        UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
        butt.frame = CGRectMake(20, CGRectGetMaxY(textView.frame)+40, PHONE_UISCREEN_WIDTH-40, 30);
        butt.backgroundColor = RGB(0, 195, 236);
        [butt setTitle:@"确定" forState:UIControlStateNormal];
        [self addSubview:butt];
        
    }
    return self;
}

@end
