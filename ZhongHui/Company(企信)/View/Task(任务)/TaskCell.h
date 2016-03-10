//
//  TaskCell.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/18.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol taskOperationDelegate <NSObject>

-(void)selectedButtonOperationTaskWithTag:(NSInteger)tag;

@end

@interface TaskCell : UITableViewCell

@property (nonatomic, weak) id <taskOperationDelegate>delegate;

@end
