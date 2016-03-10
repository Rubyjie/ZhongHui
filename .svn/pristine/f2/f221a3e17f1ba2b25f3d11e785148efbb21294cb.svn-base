//
//  ProcesTaskView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/23.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ProcesTaskView.h"

@interface ProcesTaskView () <UITextViewDelegate>

@property (nonatomic, strong)UILabel *placeholderLabel;

@property (nonatomic, strong)UILabel *notePlaceholderLabel;

@end

@implementation ProcesTaskView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
       
        // 初始化任务处理的View
        [self initProcesTaskView];
    }
    return self;
}

-(void)initProcesTaskView
{
    NSArray *buttonArray = @[@"处理状态",@"处理时间"];

    for (int i = 0; i < buttonArray.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(20, 60+(40+20)*i, PHONE_UISCREEN_WIDTH-40, 40);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.backgroundColor = [UIColor grayColor];
        [button setTitle:[buttonArray objectAtIndex:i] forState:UIControlStateNormal];
        [self addSubview:button];
    }
    
    UITextView *resultsView = [[UITextView alloc]initWithFrame:CGRectMake(20, 200, PHONE_UISCREEN_WIDTH-40, 80)];
    resultsView.delegate = self;
    resultsView.backgroundColor = [UIColor whiteColor];
    [self addSubview:resultsView];
    
    self.placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 200, 30)];
    self.placeholderLabel.textColor = [UIColor grayColor];
    self.placeholderLabel.font = [UIFont systemFontOfSize:14];
    self.placeholderLabel.text = @"请输入处理结果内容";
    self.placeholderLabel.textColor = [UIColor grayColor];
    self.placeholderLabel.hidden = NO;
    self.placeholderLabel.enabled = NO; //label必须设置为不可用
    [resultsView addSubview:self.placeholderLabel];

    
    
    UITextView *noteView = [[UITextView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(resultsView.frame)+20, PHONE_UISCREEN_WIDTH-40, 80)];
    noteView.backgroundColor = [UIColor whiteColor];
    [self addSubview:noteView];
    
    
    self.notePlaceholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 200, 30)];
    self.notePlaceholderLabel.textColor = [UIColor grayColor];
    self.notePlaceholderLabel.font = [UIFont systemFontOfSize:14];
    self.notePlaceholderLabel.text = @"请输入备注内容";
    self.notePlaceholderLabel.textColor = [UIColor grayColor];
    self.notePlaceholderLabel.hidden = NO;
    self.notePlaceholderLabel.enabled = NO; //label必须设置为不可用
    [noteView addSubview:self.notePlaceholderLabel];
    
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(20, CGRectGetMaxY(noteView.frame)+20, PHONE_UISCREEN_WIDTH-40, 30);
    but.backgroundColor = RGB(0, 195, 236);
    [but setTitle:@"确定" forState:UIControlStateNormal];
    [self addSubview:but];
}


#pragma mark  UItextViewDelegate 这个可以用
-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        
        self.placeholderLabel.text = @"请简要描述您的说明内容";
        
    }else{
        
        self.placeholderLabel.text = @"";
        
        if ([textView.text length] > 100) {
            
            textView.text = [textView.text substringToIndex:100];
            [self endEditing:YES];
            [[Session sharedSession].tpView presectLoadingTips:@"超出最大限制"];
        }
    }
}


@end
