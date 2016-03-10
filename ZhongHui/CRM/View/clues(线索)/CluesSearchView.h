//
//  CluesSearchView.h
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/17.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol jiTuanButtonDelegate <NSObject>

-(void)swithButtonChooseCustomerWithTag:(NSInteger)tag;

@end

@interface CluesSearchView : UIView

@property (nonatomic, strong)UITextField *cusText;

@property (nonatomic, strong)UIButton *levelButton;
@property (nonatomic, strong)NSString *levelValue;


@property (nonatomic, strong)UIButton *typeButton;
@property (nonatomic, strong)NSString *typeValue;

@property (nonatomic, strong)UIButton *jiTuanButton;


@property (nonatomic, strong)UIButton *userXZButton;
@property (nonatomic, strong)NSString *userValue;

@property (nonatomic, strong)UIButton *jyXzButton; // 经营性质
@property (nonatomic, strong)NSString *jyxzValue;


@property (nonatomic, strong)UIButton *ProvinceButton;
@property (nonatomic, strong)NSString *provinceId;

@property (nonatomic, strong)UIButton *cityButton;
@property (nonatomic, strong)NSString *cityId;

@property (nonatomic, strong)UIButton *areaButton;
@property (nonatomic, strong)NSString *areaId;

@property (nonatomic, strong)UIButton *sourceButton;
@property (nonatomic, strong)NSString *sourceValue;

@property (nonatomic, strong)UIButton *startButton;
@property (nonatomic, strong)NSString *startStr;


@property (nonatomic, strong)UIButton *endButton;
@property (nonatomic, strong)NSString *endStr;

@property (nonatomic, strong)UIButton *statusButton;
@property (nonatomic, strong)NSString *statusValue;

@property (nonatomic, weak)id <jiTuanButtonDelegate>delegate;

@end
