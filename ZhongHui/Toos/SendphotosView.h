//
//  SendphotosView.h
//  把图片写进相册的方法
//
//  Created by 刘彦超 on 16/3/4.
//  Copyright © 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SendphotosView : UIView


#pragma mark - 添加新的图片
-(void)addImage:(UIImage *)image;


#pragma mark - 返回内部所有的图片
-(NSArray *)totalImages;

@end
