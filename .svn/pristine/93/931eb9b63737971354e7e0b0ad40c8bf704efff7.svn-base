//
//  ReplyView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/17.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol chooseButtonDelegate <NSObject>

#pragma mark - 点击button弹出pickerView选择
-(void)selectedButtonChooseOpinionWithTag:(NSInteger)tag;

@end

@interface ReplyView : UIView

@property (nonatomic, weak)id <chooseButtonDelegate>delegate;

@property (nonatomic, strong) UIButton *chooseButton;

@property (nonatomic, strong) UILabel *chooseLabel;

@property (nonatomic, strong) UILabel *secondLabel;


@end
