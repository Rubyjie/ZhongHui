//
//  ApprovalCell.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/18.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol approverButtonDelegate <NSObject>

#pragma mark - 点击button100查看批复、101记录、102催单明细
-(void)swithButtonLookApproverWithRecordWithReminderWithTag:(NSInteger)tag;

@end

@interface ApprovalCell : UITableViewCell

@property (nonatomic, weak) id <approverButtonDelegate> delegate;

@end
