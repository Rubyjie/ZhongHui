//
//  ConMainView.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/6.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "ConMainView.h"

@interface ConMainView ()

@property (nonatomic, strong) UIButton *firstButton;
@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) CALayer *lineLayer;

@end

@implementation ConMainView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        NSArray *textArray = @[@"明细",@"拜访计划",@"拜访纪录",@"员工"];
        
        CGFloat buttonW = PHONE_UISCREEN_WIDTH / textArray.count;
        
        for (int i = 0; i < textArray.count; i++) {
            
            UIButton *Button = [UIButton buttonWithType:UIButtonTypeCustom];
            
            Button.frame = CGRectMake(buttonW * i , 0, buttonW, 40);
            
            Button.titleLabel.font = [UIFont systemFontOfSize:14];
            
            [Button addTarget:self action:@selector(ClcikButton:) forControlEvents:UIControlEventTouchUpInside];
            [Button setTitleColor:RGB(0, 195, 236) forState:UIControlStateSelected];
            Button.tag = 400 + i;
            
            
            if (Button.tag == 400) {
                Button.selected = YES;
                self.firstButton = Button;
            }
            
            [Button setTitle:[textArray objectAtIndex:i] forState:UIControlStateNormal];
            self.backgroundColor = [UIColor grayColor];
            [self addSubview:Button];
        }
        
        CALayer *linelayer = [[CALayer alloc] init];
        linelayer.frame = CGRectMake(0, 39, buttonW, 1);
        linelayer.backgroundColor = RGB(27, 195, 237).CGColor;
        [self.layer addSublayer:linelayer];
        self.lineLayer = linelayer;
        
    }
    return self;
}

-(void)ClcikButton:(UIButton *)button
{
    if (button.tag != 400) {
        
        self.firstButton.selected = NO;
    }
    // 1.让当前选中的按钮取消选中
    self.selectButton.selected = NO;
    
    // 2.新点击的按钮设成选中状态
    button.selected = YES;
    
    self.selectButton = button;

    
    float _btnwidth = PHONE_UISCREEN_WIDTH / 4;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.lineLayer.frame = CGRectMake(_btnwidth*(button.tag-400), 39, _btnwidth, 1);
        
    }];
    [self.delegate swithButtonQueryConDeailsAndEmployeesWithTag:button.tag];
}


@end
