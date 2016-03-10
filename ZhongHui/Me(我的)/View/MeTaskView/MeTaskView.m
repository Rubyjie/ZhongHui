//
//  MeTaskView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "MeTaskView.h"

@interface MeTaskView ()

@property (nonatomic, strong) CALayer *lineLayer;

@property (nonatomic, strong) UIButton *firstButton;

@property (nonatomic, strong) UIButton *selectedButton;

@end

@implementation MeTaskView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor grayColor];
        
        NSArray *meTaskArray = @[@"未执行",@"已执行",@"已取消"];
        
        CGFloat buttonW = PHONE_UISCREEN_WIDTH / meTaskArray.count;
        
        for (int i = 0; i < meTaskArray.count; i++) {
            
            UIButton *meTaskButton = [UIButton buttonWithType:UIButtonTypeCustom];
            
            meTaskButton.frame = CGRectMake(buttonW * i , 0, buttonW, 40);
            
            [meTaskButton addTarget:self action:@selector(ClcikMeTaskButton:) forControlEvents:UIControlEventTouchUpInside];
            
            meTaskButton.tag = 800 + i;
            
            [meTaskButton setTitleColor:RGB(0, 195, 236) forState:UIControlStateSelected];

            if (meTaskButton.tag == 800) {
                
                meTaskButton.selected = YES;
                self.firstButton = meTaskButton;
            }
            
            meTaskButton.titleLabel.font = [UIFont systemFontOfSize:14];
            
            [meTaskButton setTitle:[meTaskArray objectAtIndex:i] forState:UIControlStateNormal];
            
            [self addSubview:meTaskButton];
        }
        
        CALayer *linelayer = [[CALayer alloc] init];
        linelayer.frame = CGRectMake(0, 39, buttonW, 1);
        linelayer.backgroundColor = RGB(27, 195, 237).CGColor;
        [self.layer addSublayer:linelayer];
        self.lineLayer = linelayer;
        
    }
    return self;
}

-(void)ClcikMeTaskButton:(UIButton *)button
{
    if (button.tag != 800) {
        
        self.firstButton.selected = NO;
    }
    
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
    CGFloat buttonW = PHONE_UISCREEN_WIDTH / 3;
    [UIView animateWithDuration:0.25 animations:^{

        self.lineLayer.frame = CGRectMake(buttonW *(button.tag - 800), 39.5, buttonW, 0.5);
    }];
    [self.delegate swithMeTaskButtonQueryTaskStatusWithTag:button.tag];
}


@end
