//
//  TopView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/24.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "TopView.h"

@interface TopView ()

@property (nonatomic,weak)UIButton *selectedButton;

@property (nonatomic,weak)UIButton *firstButton;

@property (nonatomic, strong)CALayer *linelayer;

@end

@implementation TopView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
    
        [self initTopView];
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}

-(void)initTopView{
    
    NSArray *topButtonArray = @[@"明细",@"员工",@"联系人",@"联络记录",@"相关线索",@"歇业安排",@"内部资产"];
    
    
    CGFloat buttonWidth = PHONE_UISCREEN_WIDTH / 4;
    for (int i = 0; i < topButtonArray.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((buttonWidth*i), 0, buttonWidth, 40);
        [button setTitle:[topButtonArray objectAtIndex:i] forState:UIControlStateNormal];
        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        button.tag = 10000 + i;
        [button setTitleColor:RGB(0, 195, 236) forState:UIControlStateSelected];
        if (button.tag == 10000) {
            button.selected = YES;
            self.firstButton = button;
        }
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        [button addTarget:self action:@selector(topButtonClcik:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        CALayer *shulayer = [[CALayer alloc] init];
        shulayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
        shulayer.frame = CGRectMake(buttonWidth*i, 5, 0.5, 30);
        [self.layer addSublayer:shulayer];
        
    }
    
    CALayer *linelayer = [[CALayer alloc] init];
    linelayer.frame = CGRectMake(0, 39, PHONE_UISCREEN_WIDTH/4, 1);
    linelayer.backgroundColor = RGB(27, 195, 237).CGColor;
    [self.layer addSublayer:linelayer];
    self.linelayer = linelayer;

}

-(void)topButtonClcik:(UIButton *)button
{
    
    float _btnwidth = PHONE_UISCREEN_WIDTH / 4;

    if (button.tag != 10000) {
        
        self.firstButton.selected = NO;
    }
    // 1.让当前选中的按钮取消选中
    self.selectedButton.selected = NO;
    
    // 2.新点击的按钮设成选中状态
    button.selected = YES;
    
    self.selectedButton = button;

    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.linelayer.frame = CGRectMake(_btnwidth*(button.tag-10000), 39, _btnwidth, 1);
        
    } completion:^(BOOL finished) {
        
    }];
    
    [self.delegate swithButtonQueryCusDeailsWithTag:button.tag];
}

@end
