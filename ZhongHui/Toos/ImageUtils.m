//
//  ImageUtils.m
//  SJB
//
//  Created by sheng yinpeng on 13-7-25.
//  Copyright (c) 2013年 sheng yinpeng. All rights reserved.
//

#import "ImageUtils.h"

@implementation ImageUtils

+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0.0, 0.0,size.width,size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage*)convertViewToImage:(UIView*)view
{
    UIGraphicsBeginImageContext(CGSizeMake(view.bounds.size.width, view.bounds.size.width));
    view.layer.contentsScale = [UIScreen mainScreen].scale;
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageForView:(UIView *)view {
    CGFloat scale = [[UIScreen mainScreen] scale];  // we need to size the graphics context according to the device scale
    view.layer.contentsScale = scale;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 view.frame.size.width*scale,
                                                 view.frame.size.height*scale,
                                                 8,                     /* bits per component*/
                                                 view.frame.size.width*scale * 4,  /* bytes per row */
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    
    CGColorSpaceRelease(colorSpace);
    
    if (context != NULL) {
        CGContextSetTextMatrix(context, CGAffineTransformIdentity);
        CGAffineTransform flipVertical = CGAffineTransformMake(1,0,0,-1,0,view.frame.size.height * scale);
        CGContextConcatCTM(context, flipVertical);
    }
    
    CGContextClipToRect(context, CGRectMake(0, 0, view.frame.size.width*scale, view.frame.size.height*scale));
    
    CGContextScaleCTM(context, scale, scale);
    
    [view.layer renderInContext:context];
    
    CGImageRef image = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    
    UIImage *newImage = [UIImage imageWithCGImage:image];
    CGImageRelease(image);
    
    return newImage;
}

+ (UIImage *)getImageFromLayer:(CALayer *)layer {
    UIGraphicsBeginImageContext(CGSizeMake(layer.bounds.size.width, layer.bounds.size.height));
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    layer.contentsScale = [UIScreen mainScreen].scale;
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

//通过layer来实现
+ (UIImage *)createGradientImageFromColors:(NSArray *)colors gradientLocations:(NSArray *)locations size:(CGSize)size {
    NSMutableArray *cgColors = [NSMutableArray array];
    for (UIColor *color in colors) {
        [cgColors addObject:(__bridge id)color.CGColor];
    }
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = CGRectMake(0.0, 0.0, size.width, size.height);
    gradient.colors = cgColors;
    gradient.locations = locations;
    gradient.startPoint = CGPointMake(0.0, 0.5);
    gradient.endPoint = CGPointMake(1.0, 0.5);
    
    return [self getImageFromLayer:gradient];
}

//通过cgcontext来实现
+ (UIImage *)createGradientImageFromColors:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint imageSize:(CGSize)size opaque:(BOOL)opaque {
    NSMutableArray *cgColors = [NSMutableArray array];
    for (UIColor *color in colors) {
        [cgColors addObject:(__bridge id)color.CGColor];
    }
    
    UIGraphicsBeginImageContextWithOptions(size, opaque, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)cgColors, NULL);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}

@end
