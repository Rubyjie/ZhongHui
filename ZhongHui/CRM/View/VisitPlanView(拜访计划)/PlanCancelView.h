//
//  PlanCancelView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/22.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol planCancelQueDingDelegate <NSObject>

-(void)selectedButtonQueDingCancel;

@end

@interface PlanCancelView : UIView

@property (nonatomic, weak) id<planCancelQueDingDelegate>delegate;

@property (nonatomic, strong)NSString *YuanYinType;

@property (nonatomic, strong)UITextView *conText;

@end
