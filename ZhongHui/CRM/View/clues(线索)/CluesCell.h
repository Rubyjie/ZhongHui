//
//  CluesCell.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol cluesCellDelegate <NSObject>


#pragma mark - 520联系人 521计划  522记录 523委托 524关闭 查联系人的时候需要传线索下的客户id   线索列表进入拜访计划，可添加拜访计划，添加时默认显示线索下的客户，业务类型，相关业务（线索），不能修改
-(void)swithButtonQueryCluesWithTag:(NSInteger)tag cluesId:(NSString *)cluesId cusId:(NSString *)cusId cusName:(NSString *)cusName yeWuType:(NSString *)yeWuType clues:(NSString *)clues row:(NSInteger)seleRow;

@end

@interface CluesCell : UITableViewCell

@property (nonatomic, weak)id <cluesCellDelegate>delegate;

@property (nonatomic, strong)UILabel *customerName;
@property (nonatomic, strong)UILabel *headName;
@property (nonatomic, strong)UILabel *visitNumber;
@property (nonatomic, strong)UILabel *genZongTime;
@property (nonatomic, strong)UILabel *stateLabel;

@property (nonatomic, strong)NSString *cluesId;
@property (nonatomic, strong)NSString *cusId;
@property (nonatomic, strong)NSString *cusName;
@property (nonatomic, strong)NSString *yeWuType; //业务类型
@property (nonatomic, strong)NSString *clues;    //相关业务(线索)
@property (nonatomic, assign)NSInteger seleRow;
@end
