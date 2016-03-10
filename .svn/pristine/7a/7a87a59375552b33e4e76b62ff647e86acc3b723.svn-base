//
//  PopupView.h
//  E家洁app
//
//  Created by 刘彦超 on 15/10/8.
//  Copyright (c) 2015年 刘彦超. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PopupView;

@protocol PopviewDelegate <NSObject>

//tag是点击的button是哪个
- (void)selectWhichButtonWithTag:(NSInteger )tag popView:(PopupView *)popview;

@end

@interface PopupView : UIView

@property (nonatomic, weak) id <PopviewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArr;

- (void)showAlert;

- (void)hiddenAlert;

@property (nonatomic, strong) UIButton *chooseButton;

@end
