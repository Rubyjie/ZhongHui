//
//  InvitedView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "InvitedView.h"

@implementation InvitedView

static float  InvitedViewLeftMargin = 20;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        CALayer *shulayer = [[CALayer alloc] init];
        shulayer.backgroundColor = LINE_COLOR.CGColor;
        shulayer.frame = CGRectMake(0, 49.5, PHONE_UISCREEN_WIDTH, 0.5);
        [self.layer addSublayer:shulayer];
        
        UILabel *invitedName = [[UILabel alloc]initWithFrame:CGRectMake(InvitedViewLeftMargin, 0, 50, 50)];
        invitedName.text = @"邀请人";
        invitedName.textColor = [UIColor redColor];
        invitedName.font = [UIFont systemFontOfSize:14];
        [self addSubview:invitedName];
        
        CGFloat buttonW = PHONE_UISCREEN_WIDTH - InvitedViewLeftMargin*2 - 60;
        UIButton *InvitedButton = [UIButton buttonWithType:UIButtonTypeCustom];
        InvitedButton.frame = CGRectMake(CGRectGetMaxX(invitedName.frame), 0, buttonW, 50);
        [InvitedButton setTitle:@"点击邀请" forState:UIControlStateNormal];
        [InvitedButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        InvitedButton.titleLabel.font = [UIFont systemFontOfSize:14];
        InvitedButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self addSubview:InvitedButton];
        
        
        
        CGFloat buttonWidth = PHONE_UISCREEN_WIDTH - 40;
        UIButton *determineButton = [UIButton buttonWithType:UIButtonTypeCustom];
        determineButton.frame = CGRectMake(20, CGRectGetMaxY(InvitedButton.frame)+20, buttonWidth, 30);
        
        determineButton.backgroundColor = RGB(0, 195, 236);
        [determineButton setTitle:@"确定" forState:UIControlStateNormal];
        [self addSubview:determineButton];
        
    }
    return self;
}
@end
