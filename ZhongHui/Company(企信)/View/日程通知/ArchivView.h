//
//  ArchivView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ArchivButtonDelegate <NSObject>

#pragma mark - 50结果  51原因
-(void)swithButtonChooseResultAndCausesWithTag:(NSInteger)tag;

@end

@interface ArchivView : UIView

@property (nonatomic, weak)id <ArchivButtonDelegate>delegate;

@end
