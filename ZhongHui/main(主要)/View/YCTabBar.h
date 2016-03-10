//
//  YCTabBar.h
//  Weibo
//
//  Created by 刘彦超 on 15/12/10.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YCTabBar;

@protocol YCTabBarDelegate <NSObject>

-(void)tabbar:(YCTabBar *)tabbar didSelectedButtonForm:(NSInteger)from to:(NSInteger)to;

@end

@interface YCTabBar : UIView

-(void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (nonatomic,weak)id<YCTabBarDelegate>delegate;

@end
