//
//  TiXingView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/22.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TiXingButtonDelegate <NSObject>

#pragma mark - 点击确定按钮
-(void)selectedButtonSavePlan;

@end

@interface TiXingView : UIView

@property (nonatomic, weak) id <TiXingButtonDelegate>delegate;

@property (nonatomic, strong)UIButton *timeButton;

@property(nonatomic,strong)NSString *statrDateStr;   //时间戳

@property(nonatomic,strong)UIButton *buttonStatu;    //提醒状态

@end
