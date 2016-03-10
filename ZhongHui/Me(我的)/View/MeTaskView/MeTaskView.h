//
//  MeTaskView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MeTaskButtonDelegate <NSObject>

-(void)swithMeTaskButtonQueryTaskStatusWithTag:(NSInteger)tag;

@end

@interface MeTaskView : UIView

@property (nonatomic, weak)id <MeTaskButtonDelegate>delegate;

@end
