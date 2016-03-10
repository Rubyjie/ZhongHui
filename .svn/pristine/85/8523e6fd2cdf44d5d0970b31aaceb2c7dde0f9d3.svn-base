//
//  YCBadgeButton.m
//  Weibo
//
//  Created by 刘彦超 on 15/12/10.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "YCBadgeButton.h"
#import "UIImage+MJ.h"

@implementation YCBadgeButton

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.hidden = YES;
        self.userInteractionEnabled = NO;
        [self setBackgroundImage:[UIImage resizeImageWithName:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:11];

    }

    return self;
}


- (void)setBadgeValue:(NSString *)badgeValue
{
#warning copy
    //    _badgeValue = badgeValue;
    badgeValue = [badgeValue copy];
    
    if (badgeValue) {
        
        self.hidden = NO;
        // 设置文字
        [self setTitle:badgeValue forState:UIControlStateNormal];
        
        // 设置frame
        CGRect frame = self.frame;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        if (badgeValue.length > 1) {
            // 文字的尺寸
            CGSize badgeSize = [badgeValue sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
            badgeW = badgeSize.width + 10;
        }
        frame.size.width = badgeW;
        frame.size.height = badgeH;
        self.frame = frame;
    } else {
        self.hidden = YES;
    }
}

@end
