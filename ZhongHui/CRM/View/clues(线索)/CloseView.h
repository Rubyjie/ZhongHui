//
//  CloseView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/22.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol queDingButtonDelegate <NSObject>

-(void)swithButtonCloseClues;

@end

@interface CloseView : UIView


@property (nonatomic, weak) id<queDingButtonDelegate>delegate;

@property (nonatomic, strong)UILabel *cusName;

@property (nonatomic, strong)UIButton *chooseButton1;
@property (nonatomic, strong)UIButton *chooseButton2;
@property (nonatomic, strong)UIButton *chooseButton3;

@property (nonatomic, strong)NSString *endDateStr;   //时间戳
@property (nonatomic, strong)NSString *resultStr;    
@property (nonatomic, strong)NSString *yuanYinStr;

@property (nonatomic, strong)UITextView *contentText;

@end
