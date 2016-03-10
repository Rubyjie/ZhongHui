//
//  CuiDanVIew.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/23.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CuiDanVIew.h"

@interface CuiDanVIew () <UITextFieldDelegate>

@property (nonatomic, strong)UILabel *placeholderLabel;

@end

@implementation CuiDanVIew

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initCuiDanVIew];
    }
    return self;
}

-(void)initCuiDanVIew
{
    NSArray *buttonArray = @[@"来源类型",@"来源"];
    
    for (int i = 0; i < buttonArray.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(20, 20+(40+20)*i, PHONE_UISCREEN_WIDTH-40, 40);
        [button setTitle:[buttonArray objectAtIndex:i] forState:UIControlStateNormal];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.backgroundColor = RGB(0, 195, 236);
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:button];
    }
    
    NSArray *titleArray = @[@"请输入说明内容",@"请输入要求内容"];
    
    for (int i = 0; i < titleArray.count; i++) {
        
        UITextField *textView = [[UITextField alloc]initWithFrame:CGRectMake(20, 150+(40+20)*i, PHONE_UISCREEN_WIDTH-40, 40)];
        textView.delegate = self;
        textView.placeholder = [titleArray objectAtIndex:i];
        textView.backgroundColor = [UIColor whiteColor];
        self.textView = textView;
        [self addSubview:textView];
    
    }
    
    
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(20, CGRectGetMaxY(self.textView.frame)+40, PHONE_UISCREEN_WIDTH-40, 30);
    butt.backgroundColor = RGB(0, 195, 236);
    [butt setTitle:@"确定" forState:UIControlStateNormal];
    [self addSubview:butt];


}

//#pragma mark  UItextViewDelegate 这个可以用
//-(void)textViewDidChange:(UITextView *)textView
//{
//    
//    if (textView.text.length == 0) {
//        
//        self.placeholderLabel.text = @"请简要描述您的说明内容";
//        
//    }else{
//        
//        self.placeholderLabel.text = @"";
//        
//        if ([textView.text length] > 100) {
//            
//            textView.text = [textView.text substringToIndex:100];
//            [self endEditing:YES];
//            [[Session sharedSession].tpView presectLoadingTips:@"超出最大限制"];
//        }
//    }
//}


@end
