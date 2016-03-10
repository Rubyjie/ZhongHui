//
//  ArchivView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ArchivView.h"

@interface ArchivView ()<UITextViewDelegate>

@property (nonatomic, strong)UILabel *placeholderLabel;

@end

@implementation ArchivView

static float ArchivLeftMargin = 10;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initArchivView];
    }
    return self;
}


-(void)initArchivView
{
    NSArray *titleArray = @[@"结果",@"原因"];
    
    for (int i = 0; i < titleArray.count; i++) {
        
        CALayer *linelayer = [[CALayer alloc]init];
        linelayer.backgroundColor = [[UIColor whiteColor]CGColor];
        linelayer.frame = CGRectMake(0 ,ArchivLeftMargin + 40*i,PHONE_UISCREEN_WIDTH, 40);
        [self.layer addSublayer:linelayer];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(ArchivLeftMargin, ArchivLeftMargin + (40 * i), PHONE_UISCREEN_WIDTH, 40);
        [btn setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:RGB(98, 98, 98) forState:UIControlStateNormal];
        btn.titleLabel.textAlignment = NSTextAlignmentLeft;
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [btn addTarget:self action:@selector(swithButtonChooseRuselt:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 50 + i;
        [self addSubview:btn];
        
        UIImageView *ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 40, 18 + (45 *i), 15, 15)];
        ImageView.image = [UIImage imageNamed:@"right"];
        [self addSubview:ImageView];
        

        if (i < 1) {
            CALayer *linelayer = [[CALayer alloc]init];
            linelayer.backgroundColor = LINE_COLOR.CGColor;
            linelayer.frame = CGRectMake(0 ,ArchivLeftMargin + 39.5,PHONE_UISCREEN_WIDTH, 0.5);
            [self.layer addSublayer:linelayer];
            
        }
    }
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0,120, PHONE_UISCREEN_WIDTH, 150)];
    textView.delegate = self;
    textView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:textView];
    
    self.placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMinY(textView.frame), 200, 30)];
    self.placeholderLabel.textColor = [UIColor grayColor];
    self.placeholderLabel.font = [UIFont systemFontOfSize:14];
    self.placeholderLabel.text = @"请简要描述您的说明内容";
    self.placeholderLabel.textColor = [UIColor grayColor];
    self.placeholderLabel.hidden = NO;
    self.placeholderLabel.enabled = NO; //label必须设置为不可用
    [self addSubview:self.placeholderLabel];
    
    
    UIButton *postButton = [UIButton buttonWithType:UIButtonTypeCustom];
    postButton.backgroundColor = NAV_COLOR;
    [postButton setTitle:@"确定" forState:UIControlStateNormal];
    postButton.frame = CGRectMake(0, CGRectGetMaxY(textView.frame)+20, PHONE_UISCREEN_WIDTH, 40);
    [self addSubview:postButton];
    
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}


-(void)swithButtonChooseRuselt:(UIButton *)button
{
    [self.delegate swithButtonChooseResultAndCausesWithTag:button.tag];
}





@end
