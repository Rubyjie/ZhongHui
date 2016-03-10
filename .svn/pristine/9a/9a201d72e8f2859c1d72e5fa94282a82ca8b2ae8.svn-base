//
//  CustomerCell.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol customerButtonDelegate <NSObject>

#pragma mark 700联系人 701联络方式  702新增线索
-(void)swithButtonQueryContractAndContractWayAddCluesButtonWithTag:(NSInteger)tag customerId:(NSString *)customerId row:(NSInteger)seleRow;

#pragma mark 传的参数太多了，所以直接传customerId重新请求一次数据
//cusName:(NSString *)cusName cusLevel:(NSString *)cusLevel type:(NSString *)type jiTuan:(NSString *)jiTuan userXZ:(NSString *)userXZ address:(NSString *)address jyXZ:(NSString *)jyXZ   attStr:(NSString *)attStr size:(NSString *)size ctripType:(NSString *)ctripType manager:(NSString *)manager souName:(NSString *)souName aera:(NSString *)aera row:(NSInteger)seleRow;

@end


@interface CustomerCell : UITableViewCell

@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *numberLabel;
@property (nonatomic, strong)UILabel *stateLabel;
@property (nonatomic, strong)UILabel *levelLabel;
@property (nonatomic, strong)UILabel *typeLabel;
@property (nonatomic, strong)UILabel *beiZhuLabel;


// 客户的id
@property (nonatomic, strong)NSString *customerId;

@property (nonatomic, assign)NSInteger seleRow;



@property (nonatomic, weak) id <customerButtonDelegate>delegate;


@end
