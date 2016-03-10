//
//  VisitFrame.h
//  ZhongHui
//
//  Created by 刘彦超 on 16/3/9.
//  Copyright © 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import <Foundation/Foundation.h>
@class VisitModel;

#define VisitFrameMargin 5

@interface VisitFrame : NSObject

@property (nonatomic, assign, readonly) CGRect photoImageF;
@property (nonatomic, assign, readonly) CGRect nameViewF;
@property (nonatomic, assign, readonly) CGRect stateViewF;
@property (nonatomic, assign, readonly) CGRect timeViewF;
@property (nonatomic, assign, readonly) CGRect startTimeF;
@property (nonatomic, assign, readonly) CGRect endTimeF;
@property (nonatomic, assign, readonly) CGRect contentViewF;
@property (nonatomic, assign, readonly) CGRect customerViewF;
@property (nonatomic, assign, readonly) CGRect contractViewF;
@property (nonatomic, assign, readonly) CGRect toolBarViewF;



@property (nonatomic, assign) CGFloat cellHight;

@property (nonatomic, strong)VisitModel *visitData;

@end
