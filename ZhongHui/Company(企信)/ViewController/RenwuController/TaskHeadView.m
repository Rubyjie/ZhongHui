//
//  TaskHeadView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/18.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "TaskHeadView.h"

@interface TaskHeadView ()
@property (nonatomic, strong) UIButton *firstButton;
@property (nonatomic, strong) UIButton *selectedButton;
@property (nonatomic, strong) CALayer *lineLayer;

@end

@implementation TaskHeadView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor grayColor];
        
        float _btnwidth = PHONE_UISCREEN_WIDTH/3;
        
        
        NSArray *titleArr = @[@"未执行",@"已执行",@"已取消"];
        
        for (int i = 0; i < 3; i ++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTag:100+i];
            [button addTarget:self action:@selector(ButtonPressedWithtag:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.frame = CGRectMake(_btnwidth*i, 0, _btnwidth, 39);
            [button setTitle:[titleArr objectAtIndex:i] forState:UIControlStateNormal];
            [button setTitleColor:RGB(0, 195, 236) forState:UIControlStateSelected];
            if (button.tag == 100) {
                
                button.selected = YES;
                self.firstButton = button;
            }
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [self addSubview:button];
            
        }
        
        CALayer *linelayer = [[CALayer alloc] init];
        linelayer.frame = CGRectMake(0, 39, _btnwidth, 1);
        linelayer.backgroundColor = RGB(27, 195, 237).CGColor;
        [self.layer addSublayer:linelayer];
        self.lineLayer = linelayer;
    }
    
    return self;
}

- (void)ButtonPressedWithtag:(UIButton *)sender
{
    if (sender.tag != 100) {
        
        self.firstButton.selected = NO;
    }
    
    self.selectedButton.selected = NO;
    sender.selected = YES;
    self.selectedButton = sender;
    
    float _btnwidth = PHONE_UISCREEN_WIDTH/3;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.lineLayer.frame = CGRectMake(_btnwidth*(sender.tag-100), 39, _btnwidth, 1);
    }];
    
    [self.delegate headButtonPressedWithTag:sender.tag];
}


@end
