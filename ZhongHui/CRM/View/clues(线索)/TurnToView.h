//
//  TurnToView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/24.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TurnToView : UIView

@property (nonatomic, strong)UILabel *cusLabel;
@property (nonatomic, strong)UIButton *yuanYinButton;
@property (nonatomic, strong)NSString *yuanYinValue;


@property (nonatomic, strong)UIButton *yeiTaiButton;
@property (nonatomic, strong)NSString *yeTaiValue;

@property (nonatomic, strong)UIButton *jiGouButton;
@property (nonatomic, strong)NSString *jiGouId;

@property (nonatomic, strong)UIButton *headNameButton;
@property (nonatomic, strong)NSString *headId;

@property (nonatomic, strong)UITextView *shuoMingText;


@end
