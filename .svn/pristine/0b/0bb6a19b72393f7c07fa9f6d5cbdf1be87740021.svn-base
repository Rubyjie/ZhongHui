//
//  ApplicantView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol applicantButtonDelegate <NSObject>


#pragma mark 900待提交  901处理中  902已结案
-(void)selectedApplicantStateWithTag:(NSInteger)tag;

@end

@interface ApplicantView : UIView

@property (nonatomic, weak)id <applicantButtonDelegate>delegate;

@end
