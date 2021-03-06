//
//  VisitPlanCell.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VisitPlanCell;
@class VisitFrame;

@protocol visitPlanCellDelegate <NSObject>

#pragma mark - 600回复  601跟进   602提醒    603取消 604归档 
//-(void)swithVisitPlanButtonWithTag:(NSInteger)tag idStr:(NSString *)planId row:(NSInteger)selectRow;
-(void)swithVisitPlanCell:(VisitPlanCell *)cell buttonWithTag:(NSInteger)tag idStr:(NSString *)planId row:(NSInteger)selectRow;



@end

@interface VisitPlanCell : UITableViewCell

@property (nonatomic, weak) id <visitPlanCellDelegate>delegate;

@property (nonatomic, strong)UILabel *nameLabel;  //发送人

@property (nonatomic, strong)UILabel *stateLabel; //状态

@property (nonatomic, strong)UILabel *timeLabel;  //时间

@property (nonatomic, strong)UILabel *contentLabel;//内容

@property (nonatomic, strong)UILabel *TiXingTime;  //提醒时间

@property (nonatomic, strong)UILabel *TiXingTime2; //

@property (nonatomic, strong)UILabel *customerLabel; //客户

@property (nonatomic, strong)UILabel *contractLabel; //联系人

@property (nonatomic, strong)NSString *visitId;

@property (nonatomic, assign)NSInteger touchRow;

@property (nonatomic, strong) VisitFrame *visitFrame;


#pragma mark --- 给控件赋值
//- (void)setName:(NSString *)name state:(NSString *)state time:(NSString *)time content:(NSString *)content tiXingTime:(NSString *)tiXingTime customer:(NSString *)customer contract:(NSString *)contract;

#pragma mark --- 根据内容计算cell的高度
+ (CGFloat)getCellHeightWithName:(NSString *)name state:(NSString *)state time:(NSString *)time content:(NSString*)content tiXingTime:(NSString *)tiXingTime customer:(NSString *)customer contract:(NSString *)contract;


@end
