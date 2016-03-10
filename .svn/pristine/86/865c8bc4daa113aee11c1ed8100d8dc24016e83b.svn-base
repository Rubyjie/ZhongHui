//
//  UIImage+MJ.m
//  Weibo
//
//  Created by 刘彦超 on 15/12/9.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "UIImage+MJ.h"

@implementation UIImage (MJ)

+(UIImage *)imageWithName:(NSString *)name
{
    if (iOS7) {
        //ios7的图片
        NSString *newName = [name stringByAppendingString:@"_os7"];
        UIImage *image = [UIImage imageNamed:newName];
        if (image == nil) {//如果没有_os7后缀的图片，就加载原来的图片
            image = [UIImage imageNamed:name];
        }
        return image;
    }
    //非ios7
    return [UIImage imageNamed:name];
}

+(UIImage *)resizeImageWithName:(NSString *)name
{
    UIImage *image = [UIImage imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];

}

@end
