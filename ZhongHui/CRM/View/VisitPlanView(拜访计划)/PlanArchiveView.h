//
//  PlanArchiveView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/22.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PlanArchiveDelegate <NSObject>

#pragma mark - 点击按钮归档计划
-(void)clcikButtonArchive;

@end

@interface PlanArchiveView : UIView

@property (nonatomic,weak)id <PlanArchiveDelegate>delegate;

@property (nonatomic, strong)NSString *textStr;
@end
