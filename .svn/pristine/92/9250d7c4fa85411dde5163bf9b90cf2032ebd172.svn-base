//
//  CustomerSearchController.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol popViewDelegate <NSObject>

#pragma mark - 声明代理把搜索的内容传到客户列表
-(void)swithButtonPopViewWithArray:(NSMutableArray *)array;

@end

@interface CustomerSearchController : UIViewController

@property (nonatomic, weak)id <popViewDelegate>delegate;

@end
