//
//  GongGaoView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/19.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "GongGaoView.h"

@interface GongGaoView ()

@property (nonatomic, strong) UIButton *firstButton;
@property (nonatomic, strong) UIButton *selectedButton;
@property (nonatomic, strong) CALayer *lineLayer;


@end

@implementation GongGaoView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        NSArray *GongGaoArray = @[@"未读公告",@"已读公告"];
        
        CGFloat buttonW = PHONE_UISCREEN_WIDTH / 2;
        
        for (int i = 0; i < GongGaoArray.count; i++) {
            
            UIButton *gongGaoButton = [UIButton buttonWithType:UIButtonTypeCustom];
            
            gongGaoButton.frame = CGRectMake(buttonW * i , 0, buttonW, 40);
            
            [gongGaoButton addTarget:self action:@selector(ClcikGongGaoButton:) forControlEvents:UIControlEventTouchUpInside];
            gongGaoButton.titleLabel.font = [UIFont systemFontOfSize:14];
            [gongGaoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [gongGaoButton setTitleColor:RGB(0, 195, 236) forState:UIControlStateSelected];
            
            gongGaoButton.tag = 400 + i;
            if (gongGaoButton.tag == 400) {
                
                gongGaoButton.selected = YES;
                self.firstButton = gongGaoButton;
            }
            [gongGaoButton setTitle:[GongGaoArray objectAtIndex:i] forState:UIControlStateNormal];
            self.backgroundColor = [UIColor grayColor];
            [self addSubview:gongGaoButton];
        }
        
        CALayer *linelayer = [[CALayer alloc] init];
        linelayer.frame = CGRectMake(0, 39, buttonW, 1);
        linelayer.backgroundColor = RGB(27, 195, 237).CGColor;
        [self.layer addSublayer:linelayer];
        self.lineLayer = linelayer;
        
    }
    return self;
}

-(void)ClcikGongGaoButton:(UIButton *)button
{
    if (button.tag != 400) {
        
        self.firstButton.selected = NO;
    }
    
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
    float _btnwidth = PHONE_UISCREEN_WIDTH/2;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.lineLayer.frame = CGRectMake(_btnwidth*(button.tag-400), 39, _btnwidth, 1);
        
    }];
    [self.delegate swithButtonQueryGongGaoStatuWithTag:button.tag];
}
@end
