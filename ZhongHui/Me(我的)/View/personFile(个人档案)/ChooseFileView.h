//
//  ChooseFileView.h
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/1.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseFileView : UIView


@property (nonatomic, strong)UIImageView *iconImage;

@property (nonatomic, strong)UITextField *nameText;
@property (nonatomic, strong)UITextField *numberText;
@property (nonatomic, strong)UITextField *phoneText;
@property (nonatomic, strong)UITextField *emailText;
@property (nonatomic, strong)UITextField *zhiwuText;
@property (nonatomic, strong)UITextField *positionText;
@property (nonatomic, strong)UITextField *beizhuText;


@property (nonatomic, strong)UIButton *sexButton;
@property (nonatomic, strong)NSString *sexValue;

@property (nonatomic, strong)UIButton *jiGouButton;
@property (nonatomic, strong)NSString *jiGouId;

@property (nonatomic, strong)UIButton *shiyeButton;
@property (nonatomic, strong)NSString *shiyeValue;

@property (nonatomic, strong)UIButton *statusButton;
@property (nonatomic, strong)NSString *statusValue;

@end
