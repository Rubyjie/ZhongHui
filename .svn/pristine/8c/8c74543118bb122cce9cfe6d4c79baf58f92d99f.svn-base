//
//  ZHButton.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/9.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "ZHButton.h"

@interface ZHButton ()

// 图标的比例
#define IWTabBarButtonImageRatio 0.6
// 按钮的默认文字颜色
#define  IWTabBarButtonTitleColor (iOS7 ? [UIColor blackColor] : [UIColor whiteColor])
// 按钮的选中文字颜色
#define  IWTabBarButtonTitleSelectedColor (iOS7 ? IWColor(234, 103, 7) : IWColor(248, 139, 0))



@end

@implementation ZHButton

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        // 图标居中
        self.imageView.contentMode = UIViewContentModeCenter;
        // 文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        // 文字颜色
        [self setTitleColor:IWTabBarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:IWTabBarButtonTitleSelectedColor forState:UIControlStateSelected];
        
    }
    return self;
}

// 重写去掉高亮状态
- (void)setHighlighted:(BOOL)highlighted {
    
    highlighted = NO;
}


// 内部图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * IWTabBarButtonImageRatio;
    if (PHONE_UISCREEN_IPHONE4) {
        
        return CGRectMake(0, 0, imageW, imageH);

    }else if (PHONE_UISCREEN_IPHONE5) {
    
        return CGRectMake(0, 10, imageW, imageH);

    }else {
    
        return CGRectMake(0, 20, imageW, imageH);
    }
}

// 内部文字的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * IWTabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

@end
