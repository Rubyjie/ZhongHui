//
//  ApplicantView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ApplicantView.h"

@interface ApplicantView ()

@property (nonatomic, strong) CALayer *lineLayer;


@end

@implementation ApplicantView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor grayColor];
        
        NSArray *applicantArray = @[@"待提交",@"处理中",@"已结案"];
        
        CGFloat buttonW = PHONE_UISCREEN_WIDTH / 3;
        
        for (int i = 0; i < applicantArray.count; i++) {
            
            UIButton *applicantButton = [UIButton buttonWithType:UIButtonTypeCustom];
            applicantButton.frame = CGRectMake(buttonW * i , 0, buttonW, 40);
            [applicantButton addTarget:self action:@selector(ClcikApplicantButton:) forControlEvents:UIControlEventTouchUpInside];
            applicantButton.tag = 900 + i;
            applicantButton.titleLabel.font = [UIFont systemFontOfSize:14];
            [applicantButton setTitle:[applicantArray objectAtIndex:i] forState:UIControlStateNormal];
            [self addSubview:applicantButton];
        }
        
        CALayer *linelayer = [[CALayer alloc] init];
        linelayer.frame = CGRectMake(0, 39, buttonW, 1);
        linelayer.backgroundColor = RGB(27, 195, 237).CGColor;
        [self.layer addSublayer:linelayer];
        self.lineLayer = linelayer;
    }
    return self;
}

-(void)ClcikApplicantButton:(UIButton *)button
{
    CGFloat buttonW = PHONE_UISCREEN_WIDTH / 3;
    [UIView animateWithDuration:0.25 animations:^{
        
        self.lineLayer.frame = CGRectMake(buttonW *(button.tag - 900), 39, buttonW, 1);
    }];
    [self.delegate selectedApplicantStateWithTag:button.tag];
}


@end
