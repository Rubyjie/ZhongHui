//
//  NotificationsCell.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/15.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol toolBarButtonDelegate <NSObject>

-(void)swithButtonPushViewWithTag:(NSInteger)tag;

@end

@interface NotificationsCell : UITableViewCell

@property (nonatomic, weak) id <toolBarButtonDelegate> delegate;

@end
