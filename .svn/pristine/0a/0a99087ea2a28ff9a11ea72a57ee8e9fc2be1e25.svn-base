//
//  ContractCell.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ContractCellDelegate <NSObject>

#pragma mark - 点击添加计划按钮（20）联络结果按钮（21） 22 修改
-(void)ContractButtonAddVisitAndResultsWithTag:(NSInteger)tag  contractId:(NSString *)contractId row:(NSInteger)selectRow;


@end

@interface ContractCell : UITableViewCell

@property (nonatomic, weak) id <ContractCellDelegate>delegate;

@property (nonatomic, strong)NSString *contractId;

@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *buMenLabel;
@property (nonatomic, strong)UILabel *zhiWeiLabel;
@property (nonatomic, strong)UILabel *roleLabel;
@property (nonatomic, strong)UILabel *closelyLabel;
@property (nonatomic, strong)UILabel *customerLabel;

@property (nonatomic, assign)NSInteger selectRow;
@end
