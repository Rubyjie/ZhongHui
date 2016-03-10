//
//  ImageUtils.h
//  TravelStudy
//
//  Created by Jaffer on 15/7/15.
//  Copyright (c) 2015年 Damon. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageUtils : NSObject

//创建纯色图片
+(UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size;

// 将View转换成图片
+ (UIImage*)convertViewToImage:(UIView*)view;

+ (UIImage *)imageForView:(UIView *)view;


//创建渐变色图片
+ (UIImage *)createGradientImageFromColors:(NSArray *)colors gradientLocations:(NSArray *)locations size:(CGSize)size;
+ (UIImage *)createGradientImageFromColors:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint imageSize:(CGSize)size opaque:(BOOL)opaque;

@end
