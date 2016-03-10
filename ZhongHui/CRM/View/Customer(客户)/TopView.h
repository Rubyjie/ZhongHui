//
//  TopView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/24.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CusDeailButtonDelegate <NSObject>

#pragma mark   10000明细 10001员工 10002联系人  10003连络记录  10004相关线索  10005歇业安排 10006内部资产
-(void)swithButtonQueryCusDeailsWithTag:(NSInteger)tag;

@end

@interface TopView : UIView

@property (nonatomic, weak) id <CusDeailButtonDelegate>delegate;

@end
