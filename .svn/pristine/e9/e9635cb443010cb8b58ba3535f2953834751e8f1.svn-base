//
//  ReplyView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/17.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ReplyView.h"
#import "AFNetworking.h"

@interface ReplyView () <UITextViewDelegate>

@property (nonatomic, strong)UILabel *placeholderLabel;


@end
@implementation ReplyView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        NSArray *titleArray = @[@"意见",@"原因"];
        
        for (int i = 0; i < titleArray.count; i++) {
            
            CALayer *linelayer = [[CALayer alloc]init];
            linelayer.backgroundColor = [[UIColor whiteColor]CGColor];
            linelayer.frame = CGRectMake(0 ,10 + 40*i,PHONE_UISCREEN_WIDTH, 40);
            [self.layer addSublayer:linelayer];
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(10, 10 + (40 * i), PHONE_UISCREEN_WIDTH, 40);
            [btn setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
            [btn setTitleColor:RGB(98, 98, 98) forState:UIControlStateNormal];
            btn.titleLabel.textAlignment = NSTextAlignmentLeft;
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [btn addTarget:self action:@selector(swithButtonChoose:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = 10 + i;
            self.chooseButton = btn;
            [self addSubview:btn];
            
            
            UIImageView *ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 40, 18 + (45 *i), 15, 15)];
            ImageView.image = [UIImage imageNamed:@"right"];
            [self addSubview:ImageView];
            
            if (i < 1) {
                CALayer *linelayer = [[CALayer alloc]init];
                linelayer.backgroundColor = LINE_COLOR.CGColor;
                linelayer.frame = CGRectMake(0 ,10 + 39.5,PHONE_UISCREEN_WIDTH, 0.5);
                [self.layer addSublayer:linelayer];

            }
        }
        
#pragma mark - 这个label是80个宽度，又减40是箭头的位置
        // 意见
        UILabel *chooseLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 80 - 40, 10,  80 , 40)];
        self.chooseLabel = chooseLabel;
        [self addSubview:chooseLabel];
        
        // 原因
        UILabel *secondLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 80 - 40, 10 + 40, 80, 40)];
        self.secondLabel = secondLabel;
        [self addSubview:secondLabel];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 110, 50, 20)];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.text = @"说明";
        [self addSubview:titleLabel];
        
        UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame)+5, PHONE_UISCREEN_WIDTH, 150)];
        textView.delegate = self;
        textView.backgroundColor = [UIColor whiteColor];

        [self addSubview:textView];
        
        self.placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(titleLabel.frame)+5, 200, 30)];
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
    return self;
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


-(void)swithButtonChoose:(UIButton *)button
{
    [self.delegate selectedButtonChooseOpinionWithTag:button.tag];
}


@end
