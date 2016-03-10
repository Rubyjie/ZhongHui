//
//  ChooseCustomerController.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/28.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol popCustomerViewDelegate <NSObject>

//-(void)popViewWithCustomer:(NSString *)customer cutId:(NSString *)cutId;

-(void)popCustomerAddCluesWithName:(NSString *)name cusId:(NSString *)cusId cusLevel:(NSString *)cusLevel type:(NSString *)type jiTuan:(NSString *)jiTuan userXZ:(NSString *)userXZ address:(NSString *)address jyXZ:(NSString *)jyXZ postCode:(NSString *)postCode   openTime:(NSString *)openTime;

@end

@interface ChooseCustomerController : UIViewController

@property (nonatomic, weak)id <popCustomerViewDelegate>delegate;


//#pragma mark - 区分客户下添加线索时
//@property (nonatomic, strong)NSString *customerAddCluesType;
@end
