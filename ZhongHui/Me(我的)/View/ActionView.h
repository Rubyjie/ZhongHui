//
//  ActionView.h
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/11.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ActionViewDelegate <NSObject>

- (void)selectWhichToPush:(NSInteger)tag;

@end

@interface ActionView : UIView

@property (nonatomic, weak) __weak id <ActionViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame titleArr:(NSArray *)titlearray colorArr:(NSArray *)colorArray;


- (void)showAlert;
- (void)Hidden;


@end
