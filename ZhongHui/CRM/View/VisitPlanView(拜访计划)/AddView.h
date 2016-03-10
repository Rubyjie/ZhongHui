//
//  AddView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/22.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol addPlanButtonDelegate <NSObject>

-(void)swithButtonChooseCustomerWithTag:(NSInteger)tag;

-(void)ciclkButtonAddPlan;
@end


@interface AddView : UIView

@property (nonatomic, weak) id <addPlanButtonDelegate>delegate;

@property (nonatomic, strong)UIButton *sxButton;
@property (nonatomic, strong)NSString *sxValue;

@property (nonatomic, strong)UIButton *startTimeButton;
@property (nonatomic, strong)NSString *statrDateStr;

@property (nonatomic, strong)UIButton *endTimeButton;
@property (nonatomic, strong)NSString *endDataStr;

@property (nonatomic, strong)UIButton *headButton; // 负责人
@property (nonatomic, strong)NSString *headJiGouId;// 负责人的机构id
@property (nonatomic, strong)NSString *headId;
@property (nonatomic, strong)UIButton *canYuButton;// 参与人
@property (nonatomic, strong)NSString *canYuId;

@property (nonatomic, strong)UIButton *stateButton;
@property (nonatomic, strong)NSString *stateValue;


@property (nonatomic, strong)UIButton *customerButton; // 客户
@property (nonatomic, strong)NSString *customerId;
@property (nonatomic, strong)UIButton *contractButton; // 联系人
@property (nonatomic, strong)NSString *contractId;     

@property (nonatomic, strong)UIButton *zyxButton; // 重要性
@property (nonatomic, strong)NSString *zyxValue;

@property (nonatomic, strong)UIButton *visitWayButton; // 拜访方式
@property (nonatomic, strong)NSString *visitValue;


@property (nonatomic, strong)UIButton *ywButton; // 业务类型
@property (nonatomic, strong)NSString *ywValue;

@property (nonatomic, strong)UIButton *businessButton; // 相关业务
@property (nonatomic, strong)NSString *busineStr;      // 传的时候传这个
@property (nonatomic, strong)NSString *businessId;

@property (nonatomic, strong)UITextView *titleField;

@property (nonatomic, strong)UITextView *contentField;

@property (nonatomic, strong)UITextView *addressPhone;

@property (nonatomic, strong)UIButton *tiXingButton;
@property (nonatomic, strong)NSString *tiXingStr;

@property (nonatomic, strong)UIButton *isTiXing;
@end
