//
//  VisitPlanViewController.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface VisitPlanViewController : UIViewController


@property (nonatomic, strong)NSString *planStr;      //判断是哪的计划

@property (nonatomic, strong)NSString *contractIdStr;//联系人id

@property (nonatomic, strong)NSString *cluesIds;     //线索id


@property (nonatomic, strong)NSString *cusName;
@property (nonatomic, strong)NSString *cusId;
@property (nonatomic, strong)NSString *yeWuType;
@property (nonatomic, strong)NSString *xgYeWu;
@property (nonatomic, strong)NSString *yeWuValue;

@end
