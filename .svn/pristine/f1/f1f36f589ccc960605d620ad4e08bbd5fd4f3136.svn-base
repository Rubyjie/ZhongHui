//
//  CluesXQTopView.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/11.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "CluesXQTopView.h"

@interface CluesXQTopView()
@property (nonatomic, strong)UIButton *firstButton;
@property (nonatomic, strong)UIButton *selectedButton;
@property (nonatomic, strong)CALayer *linelayer;

@end

@implementation CluesXQTopView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initCluesTopView];
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}


-(void)initCluesTopView
{
    NSArray *topButtonArray = @[@"明细",@"拜访计划",@"联络记录"];
    
    CGFloat buttonWidth = PHONE_UISCREEN_WIDTH / topButtonArray.count;
    for (int i = 0; i < topButtonArray.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((buttonWidth*i), 0, buttonWidth, 40);
        [button setTitle:[topButtonArray objectAtIndex:i] forState:UIControlStateNormal];
        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        button.tag = 1000 + i;
        [button setTitleColor:RGB(0, 195, 236) forState:UIControlStateSelected];
        if (button.tag == 1000) {
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
    linelayer.frame = CGRectMake(0, 39, buttonWidth, 1);
    linelayer.backgroundColor = RGB(27, 195, 237).CGColor;
    [self.layer addSublayer:linelayer];
    self.linelayer = linelayer;


}

-(void)topButtonClcik:(UIButton *)button
{
    if (button.tag != 1000) {
        
        self.firstButton.selected = NO;
    }
    // 1.让当前选中的按钮取消选中
    self.selectedButton.selected = NO;
    
    // 2.新点击的按钮设成选中状态
    button.selected = YES;
    
    self.selectedButton = button;
    
    float _btnwidth = PHONE_UISCREEN_WIDTH / 3;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.linelayer.frame = CGRectMake(_btnwidth*(button.tag-1000), 39, _btnwidth, 1);
        
    }];

    [self.delegate swithButtonQueryCluesDeailsAndVisitPlanAndConRecordWithTag:button.tag];
}

@end
