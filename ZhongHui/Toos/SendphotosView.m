//
//  SendphotosView.m
//  把图片写进相册的方法
//
//  Created by 刘彦超 on 16/3/4.
//  Copyright © 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "SendphotosView.h"

@implementation SendphotosView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
    }
    return self;
}


-(void)addImage:(UIImage *)image
{
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = image;
    [self addSubview:imageView];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    int imageCount = self.subviews.count;
    CGFloat imageViewW = 70;
    CGFloat imageViewH = 70;
    int maxColumns = 4; // 一行最多显示4张图片
    CGFloat margin = (self.frame.size.width - imageViewW * maxColumns) / (maxColumns + 1);
    for (int i = 0; i < imageCount; i ++) {
        
        UIImageView *imageView = self.subviews[i];
        CGFloat imageViewX = margin + (i % maxColumns) * (imageViewW + margin);
        CGFloat imageViewY = (i / maxColumns) * (imageViewH + margin);
        imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    }
}

-(NSArray *)totalImages
{
    NSMutableArray *images = [NSMutableArray array];
    for (UIImageView *imageView in self.subviews) {
        
        [images addObject:imageView.image];
    }
    return images;
}

@end
