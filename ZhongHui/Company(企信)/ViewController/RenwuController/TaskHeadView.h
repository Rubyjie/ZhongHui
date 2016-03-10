//
//  TaskHeadView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/18.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TaskHeadDelegate <NSObject>

//100 未执行 101 已执行 102 已取消
- (void)headButtonPressedWithTag:(NSInteger)tag;

@end

@interface TaskHeadView : UIView

@property (nonatomic, weak) id <TaskHeadDelegate> delegate;

@end
