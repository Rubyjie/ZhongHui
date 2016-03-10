//
//  EntrustView.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/29.
//  Copyright © 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "EntrustView.h"

@interface EntrustView () <UITextViewDelegate>
@property (nonatomic, strong)UILabel *placeholderLabel;


@end

@implementation EntrustView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
    
        [self initEntrustView];
    }
    return self;
}


-(void)initEntrustView
{
    NSArray *titleArray = @[@"负责人",@"原因"];
    for (int i = 0; i < titleArray.count; i++) {
        
        CALayer *henglayer = [[CALayer alloc] init];
        henglayer.backgroundColor = RGB(0, 195, 236).CGColor;
        henglayer.frame = CGRectMake(0, 50+49.5*i, PHONE_UISCREEN_WIDTH, 0.5);
        [self.layer addSublayer:henglayer];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 50*i, 50, 50)];
        titleLabel.textColor = [UIColor grayColor];
        titleLabel.tag = 10 + i;
        titleLabel.text = [titleArray objectAtIndex:i];
        if (titleLabel.tag == 10 || titleLabel.tag == 11) {
            
            titleLabel.textColor = [UIColor redColor];
        }
        titleLabel.font = [UIFont systemFontOfSize:14];
//        titleLabel.font = MYFONT(14);
        [self addSubview:titleLabel];
        
        
        
        UIButton *chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        chooseButton.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame)+10, 50*i, PHONE_UISCREEN_WIDTH-70, 50);
        [chooseButton setTitle:@"请选择" forState:UIControlStateNormal];
        [chooseButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        chooseButton.titleLabel.font = [UIFont systemFontOfSize:14];
        chooseButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self addSubview:chooseButton];
        
    }

    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 50*2+20, PHONE_UISCREEN_WIDTH-20, 200)];
    textView.delegate = self;
    textView.backgroundColor = [UIColor grayColor];
    [self addSubview:textView];
    
    self.placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, PHONE_UISCREEN_WIDTH-30, 30)];
    self.placeholderLabel.textColor = [UIColor grayColor];
    self.placeholderLabel.font = [UIFont systemFontOfSize:14];
    self.placeholderLabel.text = @"请简要描述您的说明内容(500字内)";
    self.placeholderLabel.textColor = [UIColor grayColor];
    self.placeholderLabel.hidden = NO;
    self.placeholderLabel.enabled = NO; //label必须设置为不可用
    [textView addSubview:self.placeholderLabel];

}



#pragma mark  UItextViewDelegate 这个可以用
-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        
        self.placeholderLabel.text = @"请简要描述您的说明内容(500字内)";
        
    }else{
        
        self.placeholderLabel.text = @"";
        
        if ([textView.text length] > 100) {
            
            textView.text = [textView.text substringToIndex:100];
            [self endEditing:YES];
            [[Session sharedSession].tpView presectLoadingTips:@"超出最大限制"];
        }
    }
}

#pragma mark -- textview点击右下角按钮收起键盘
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

@end
