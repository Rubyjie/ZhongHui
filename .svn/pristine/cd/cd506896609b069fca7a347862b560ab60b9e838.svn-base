//
//  PlanArchiveView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/22.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "PlanArchiveView.h"

@interface PlanArchiveView () <UITextViewDelegate>

@property (nonatomic, strong)UILabel *placeholderLabel;

@end

@implementation PlanArchiveView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 30, PHONE_UISCREEN_WIDTH-20, 200)];
        textView.delegate = self;
        textView.scrollEnabled = YES;    //当文字超过视图的边框时是否允许滑动，默认为“YES”
        textView.font = [UIFont systemFontOfSize:15];
        textView.backgroundColor = [UIColor whiteColor];
        [self addSubview:textView];
        
        self.placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 200, 30)];
        self.placeholderLabel.textColor = [UIColor grayColor];
        self.placeholderLabel.font = [UIFont systemFontOfSize:14];
        self.placeholderLabel.text = @"请简要描述您的说明内容";
        self.placeholderLabel.textColor = [UIColor grayColor];
        self.placeholderLabel.hidden = NO;
        self.placeholderLabel.enabled = NO; //label必须设置为不可用
        [textView addSubview:self.placeholderLabel];
        
        
        UIButton *QueDingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        QueDingButton.frame = CGRectMake(10, CGRectGetMaxY(textView.frame)+20, PHONE_UISCREEN_WIDTH-20, 30);
        QueDingButton.userInteractionEnabled=NO;
        QueDingButton.alpha=0.4;
        QueDingButton.tag = 100;
        QueDingButton.backgroundColor = RGB(0, 195, 236);
        [QueDingButton setTitle:@"确定" forState:UIControlStateNormal];
        [QueDingButton addTarget:self action:@selector(quedingButton) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:QueDingButton];
        
        
    }
    return self;
}

#pragma mark  UItextViewDelegate 这个可以用
-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        
        self.placeholderLabel.text = @"请简要描述您的说明内容";
        UIButton *button = (UIButton *)[self viewWithTag:100];
        button.userInteractionEnabled = NO;
        button.alpha=0.4;
        
    }else{
        
        UIButton *button = (UIButton *)[self viewWithTag:100];
        button.userInteractionEnabled = YES;
        button.alpha=1;

        self.placeholderLabel.text = @"";
        
        self.textStr = textView.text;
        
        if ([textView.text length] > 500) {
            
            textView.text = [textView.text substringToIndex:500];
            [self endEditing:YES];
            [[Session sharedSession].tpView presectLoadingTips:@"超出最大限制"];
        }
    }
}


#pragma mark -- textView点击右下角按钮收起键盘
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    [self endEditing:YES];
}

-(void)quedingButton
{
    [self.delegate clcikButtonArchive];
}


@end
