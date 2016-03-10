//
//  BottomView.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/10.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "BottomView.h"

@interface BottomView ()

@property (nonatomic, strong)CALayer *linelayer;

@property (nonatomic, strong)UIButton *selectedButton;

@end

@implementation BottomView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initBottomView];
        self.backgroundColor = [UIColor grayColor];
    }
    return self;

}

-(void)initBottomView
{
    NSArray *bottomButtonArray = @[@"别名",@"联系",@"文档",@"事项",@"渠道",@"级别"];
    
    CGFloat buttonWidth = PHONE_UISCREEN_WIDTH / bottomButtonArray.count;
    for (int i = 0; i < bottomButtonArray.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((buttonWidth*i), 0, buttonWidth, 30);
        [button setTitle:[bottomButtonArray objectAtIndex:i] forState:UIControlStateNormal];
        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        button.tag = 10000+i;
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        [button addTarget:self action:@selector(bottomButtonClcik:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:RGB(0, 195, 236) forState:UIControlStateSelected];

        [self addSubview:button];
        
        CALayer *shulayer = [[CALayer alloc] init];
        shulayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
        shulayer.frame = CGRectMake(buttonWidth*i, 5, 0.5, 30);
        [self.layer addSublayer:shulayer];
        
    }
    
}

-(void)bottomButtonClcik:(UIButton *)button
{
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    [self.delegate swithButtonQueryCusChildMessageWithTag:button.tag];
    
}




@end
