//
//  CompanyView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/15.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol companyViewDelegate <NSObject>

-(void)swithButtonJumpViewControllerWithTag:(NSInteger)tag;

@end

@interface CompanyView : UIView

@property (nonatomic, weak)id <companyViewDelegate>delegate;
@end
