//
//  ReplyMessageController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ReplyMessageController.h"

@interface ReplyMessageController ()<UITextViewDelegate>

@property (nonatomic, strong)UILabel *placeholderLabel;
@end

@implementation ReplyMessageController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"消息回复";
    
    self.view.backgroundColor = RGB(227, 227, 227);
    
    UITextView *replyMessage = [[UITextView alloc]initWithFrame:CGRectMake(10, 10, PHONE_UISCREEN_WIDTH-10-10, 180)];
    replyMessage.backgroundColor = [UIColor whiteColor];
    replyMessage.returnKeyType = UIReturnKeyDefault;//返回键的类型
    replyMessage.keyboardType = UIKeyboardTypeDefault;//键盘类型
    replyMessage.scrollEnabled = YES;//是否可以拖动
    replyMessage.delegate = self;
//    replyMessage.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度

    [self.view addSubview:replyMessage];
    
    self.placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMinY(replyMessage.frame), 200, 30)];
    self.placeholderLabel.textColor = [UIColor grayColor];
    self.placeholderLabel.font = [UIFont systemFontOfSize:14];
    self.placeholderLabel.text = @"请简要描述您的说明内容";
    self.placeholderLabel.textColor = [UIColor grayColor];
    self.placeholderLabel.hidden = NO;
    self.placeholderLabel.enabled = NO; //label必须设置为不可用
    [self.view addSubview:self.placeholderLabel];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10,CGRectGetMaxY(replyMessage.frame)+20 , PHONE_UISCREEN_WIDTH-10-10, 30);
    button.backgroundColor = RGB(0, 195, 236);
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
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
            [self.view endEditing:YES];
            [[Session sharedSession].tpView presectLoadingTips:@"超出最大限制"];
        }
    }
}


@end
