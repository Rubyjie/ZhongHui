//
//  ContractResultCell.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/23.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContractResultCell : UITableViewCell

@property (nonatomic, strong)UILabel *contractName;
@property (nonatomic, strong)UILabel *contractTime;
@property (nonatomic, strong)UILabel *contractResult;
@property (nonatomic, strong)UILabel *yuanYinLabel;
@property (nonatomic, strong)UILabel *shuoMingLabel;

#pragma mark --- 给控件赋值
- (void)setConName:(NSString *)conName contractTime:(NSString *)contractTime contractResult:(NSString *)contractResult yuanYin:(NSString *)yuanYin shuoMing:(NSString *)shuoMing;

#pragma mark --- 根据内容计算cell的高度
+ (CGFloat)getCellheightWithConName:(NSString *)conName conTime:(NSString *)conTime conRsult:(NSString *)conResult yuanYin:(NSString*)yuanYin shuoMing:(NSString *)shuoMing;

@end
