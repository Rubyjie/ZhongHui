//
//  AddContractView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/25.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol addContractButtonDelegate <NSObject>

-(void)selectedButtonChooseCustomerWithTag:(NSInteger)tag;

@end

@interface AddContractView : UIView

@property (nonatomic, strong)UITextField *contentText1;
@property (nonatomic, strong)UITextField *contentText2;
@property (nonatomic, strong)UITextField *contentText3;
@property (nonatomic, strong)UITextField *contentText4;
@property (nonatomic, strong)UIButton *customerButton;
@property (nonatomic, strong)UITextField *contentText6;
@property (nonatomic, strong)UITextField *contentText7;
@property (nonatomic, strong)UITextField *contentText8;
@property (nonatomic, strong)UITextField *contentText9;
@property (nonatomic, strong)UITextField *contentText10;
@property (nonatomic, strong)UITextField *contentText11;
@property (nonatomic, strong)UITextField *contentText12;
@property (nonatomic, strong)UITextField *contentText13;
@property (nonatomic, strong)UITextField *contentText14;
@property (nonatomic, strong)UITextField *contentText15;
@property (nonatomic, strong)UITextField *contentText16;
@property (nonatomic, strong)UIButton *relatButton;  //角色关系
@property (nonatomic, strong)NSString *relatValue;

@property (nonatomic, strong)UIButton *qinMiButton;  //亲密程度
@property (nonatomic, strong)NSString *qinMiValue;

@property (nonatomic, strong)UIButton    *sexButton;
@property (nonatomic, strong)NSString    *sexValue;

@property (nonatomic, strong)UITextView *beiZhuText;
@property (nonatomic, strong)UITextView *addressText; // 地址

@property (nonatomic, strong)UIButton  *statusButton;
@property (nonatomic, strong)UIButton  *headButton;


@property (nonatomic, strong)NSString  *statusValue;

// 判断是修改还是添加
@property (nonatomic, strong)NSString *changeAndAdd;


@property (nonatomic, weak) id <addContractButtonDelegate>delegate;



@end
