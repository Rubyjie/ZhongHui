//
//  YCBarButton.m
//  Weibo
//
//  Created by 刘彦超 on 15/12/10.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "YCBarButton.h"
#import "UIImage+MJ.h"
#import "YCBadgeButton.h"

@interface YCBarButton ()
@property (nonatomic, strong)YCBadgeButton *badgeButton;

@end
//图标的比例
#define YCBarButtonImageRatio 0.6

#define YCBarButtonTitleColorNomal (iOS7?[UIColor blackColor]:[UIColor whiteColor])



@implementation YCBarButton

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        // 设置button的图片和文字居中
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self setTitleColor:YCBarButtonTitleColorNomal forState:UIControlStateNormal];
        [self setTitleColor: RGB(27, 195, 237) forState:UIControlStateSelected];

         
        // 添加一个提醒数字按钮
        YCBadgeButton *badgeButton = [[YCBadgeButton alloc] init];
        badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:badgeButton];
        self.badgeButton = badgeButton;
    }

    return self;
}

-(void)setHighlighted:(BOOL)highlighted
{
    highlighted = NO;
}


#pragma mark - 设置button内部的图片的frame
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * YCBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
    
}

#pragma mark - 设置button内部的文字的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    // 高度从图片的高度开始
    CGFloat titleY = contentRect.size.height *YCBarButtonImageRatio;
    // 文字的宽度就是button的宽度
    CGFloat titleW = contentRect.size.width;
    // 文字的高度就是button的高度减掉文字的Y
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

-(void)setItem:(UITabBarItem *)item
{
    _item = item;
    
//    //设置文字
//    [self setTitle:item.title forState:UIControlStateNormal];
//    //设置图片
//    [self setImage:item.image forState:UIControlStateNormal];
//    [self setImage:item.selectedImage forState:UIControlStateSelected];
//    
//    //设置提醒数字.如果有值就显示。没有就隐藏
//    if (item.badgeValue) {
//        
//        self.badgeButton.hidden = NO;
//        //设置文字
//        [self.badgeButton setTitle:item.badgeValue forState:UIControlStateNormal];
//        // 设置frame
//        CGFloat badgeY = 5;
//        CGFloat badgeH = self.badgeButton.currentBackgroundImage.size.height;
//        
//        // 文字的尺寸
//        CGSize badgeSize = [item.badgeValue sizeWithFont:self.badgeButton.titleLabel.font];
//        // 距离俩边都是5个点
//        CGFloat badgeW = badgeSize.width + 5 + 5;
//        // X值就是整个按钮的宽度减去badgeButton的宽度
//        CGFloat badgeX = self.frame.size.width - badgeW - 5;
//        self.badgeButton.frame = CGRectMake(badgeX, badgeY, badgeW, badgeH);
//
//    }else{
//    
//        self.badgeButton.hidden = YES;
//    }
    
    // KVO 监听属性改变 重要的（forKeyPath监听属性，context一般传空）
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
#pragma mark - 监听到改变后调这个方法
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    
}


- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

/**
 *  监听到某个对象的属性改变了,就会调用，自动调用
 *
 *  @param keyPath 属性名
 *  @param object  哪个对象的属性被改变
 *  @param change  属性发生的改变
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
//    NSLog(@"----%@的-- %@被改了",object,keyPath);
    
#pragma mark -- 改变后重新赋值
    // 设置文字
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setTitle:self.item.title forState:UIControlStateNormal];
    
    // 设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    // 设置提醒数字
    self.badgeButton.badgeValue = self.item.badgeValue;
    
    // 设置提醒数字的位置
    CGFloat badgeY = 5;
    CGFloat badgeX = self.frame.size.width - self.badgeButton.frame.size.width - 20;
    CGRect badgeF = self.badgeButton.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;
    self.badgeButton.frame = badgeF;
}


@end
