//
//  YCTabBar.m
//  Weibo
//
//  Created by 刘彦超 on 15/12/10.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "YCTabBar.h"
#import "UIImage+MJ.h"
#import "YCBarButton.h"

@interface YCTabBar ()

@property (nonatomic,weak)YCBarButton *selectedButton;

@end
@implementation YCTabBar

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        if (!iOS7) {
            
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];

        }
        
    }
    return self;
}


-(void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    // 1.创建按钮
    YCBarButton *button = [YCBarButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:button];
    
    // 2.设置数据 封装item
    button.item = item;
    
    /* 封装item
    [button setTitle:item.title forState:UIControlStateNormal];
    [button setImage:item.image forState:UIControlStateNormal];
    [button setImage:item.selectedImage forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
     */
    
    // 3.监听按钮点击
    [button addTarget:self action:@selector(buttonClcik:) forControlEvents:UIControlEventTouchDown];
    
    // 4.默认选中第0个按钮
    if (self.subviews.count == 1) {
        
        [self buttonClcik:button];
    }
}

-(void)buttonClcik:(YCBarButton *)button
{
#pragma mark - 代理写在前面
    if ([self.delegate respondsToSelector:@selector(tabbar:didSelectedButtonForm:to:)]) {
        
        [self.delegate tabbar:self didSelectedButtonForm:self.selectedButton.tag to:button.tag]; //button新的按钮
    }
    
    //1.让当前选中的按钮取消选中
    self.selectedButton.selected = NO;
    
    //2.新点击的按钮设成选中状态
    button.selected = YES;
    
    self.selectedButton = button;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat buttonY = 0;
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonW = self.frame.size.width / self.subviews.count;


    for (int index = 0; index < self.subviews.count; index++) {
        
        // 1.取出button
        YCBarButton *button = self.subviews[index];
        
        // 2.设置button的frame
        CGFloat buttonX = index * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 3. 绑定tag
        button.tag = index;

    }
}

@end
