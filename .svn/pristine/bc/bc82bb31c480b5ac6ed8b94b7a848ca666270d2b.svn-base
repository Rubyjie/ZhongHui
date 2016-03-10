//
//  CustomerSearchView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol customerButtonDelegate <NSObject>

-(void)swithButtonChooseJiGouDataWithTag:(NSInteger)tag;


@end



@interface CustomerSearchView : UIView

@property (nonatomic, strong)UITextField *cusText;
@property (nonatomic, strong)UITextField *cusCodeText;

@property (nonatomic, strong)UIButton *jiTuanButton;
@property (nonatomic, strong)UIButton *openStartButton;  // 开业开始时间
@property (nonatomic, strong)NSString *openStartStr;


@property (nonatomic, strong)UIButton *openEndButton;    // 开业截止时间
@property (nonatomic, strong)NSString *openEndStr;


@property (nonatomic, strong)UIButton *decorateStartButton; //装修开始时间
@property (nonatomic, strong)NSString *decorateStartStr;

@property (nonatomic, strong)UIButton *decorateEndButton;   //装修截止时间
@property (nonatomic, strong)NSString *decorateEndStr;



@property (nonatomic, strong)UIButton *provinceButton;
@property (nonatomic, strong)NSString *provinceId;


@property (nonatomic, strong)UIButton *cityButton;
@property (nonatomic, strong)NSString *cityId;

@property (nonatomic, strong)UIButton *areaButton;
@property (nonatomic, strong)NSString *areaId;

@property (nonatomic, strong)UIButton *typeButton;
@property (nonatomic, strong)NSString *typeValue;

@property (nonatomic, strong)UIButton *levelButton;
@property (nonatomic, strong)NSString *levelValue;

@property (nonatomic, strong)UIButton *jyXzButton;          // 经营性质
@property (nonatomic, strong)NSString *jyXzValue;

@property (nonatomic, strong)UIButton *assetsOwnerButton;   // 资产归属
@property (nonatomic, strong)NSString *assetsOwnerValue;

@property (nonatomic, strong)UIButton *managerButton;
@property (nonatomic, strong)NSString *managerValue;


@property (nonatomic, strong)UIButton *statusButton;
@property (nonatomic, strong)NSString *statusValue;


@property (nonatomic, weak) id <customerButtonDelegate>delegate;
@end
