//
//  NewCluesView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/24.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol newCluesDelegate <NSObject>

//-(void)clcikButtonChooseCluesDataWithTag:(NSInteger)tag;

-(void)swithButtonAddClues;

@end

@interface NewCluesView : UIView

@property (nonatomic, weak)id <newCluesDelegate>delegate;




@property (nonatomic, strong)UILabel *customerLabel; //客户名称
@property (nonatomic, strong)UILabel *levelLabel;   //星级
@property (nonatomic, strong)UILabel *typeLabel;    //类型
@property (nonatomic, strong)UILabel *jiTuanLabel;  //所属集团
@property (nonatomic, strong)UILabel *userXzLabel;  //用户性质
@property (nonatomic, strong)UILabel *jyxzLabel;    //经营性质
@property (nonatomic, strong)UILabel *attLabel;     //酒店属性
@property (nonatomic, strong)UILabel *sizeLabel;    //酒店规模
@property (nonatomic, strong)UILabel *ctripLabel;   //携程类型
@property (nonatomic, strong)UILabel *managerLabel; //管理公司
@property (nonatomic, strong)UILabel *sourceLabel;  //来源名称
@property (nonatomic, strong)UILabel *areaLabel;    //所在区域
@property (nonatomic, strong)UILabel *addressLabel; //详细地址

@property (nonatomic, strong)UIButton *sourceButton;  //来源类型
@property (nonatomic, strong)NSString *sourceValue;


@property (nonatomic, strong)UIButton *timeButton;  //发现时间
@property (nonatomic, strong)NSString *timeStr;

@property (nonatomic, strong)UIButton *yeTaiButton; //归属业态
@property (nonatomic, strong)NSString *yeTaiValue;

@property (nonatomic, strong)UIButton *jiGouButton;//归属机构
@property (nonatomic, strong)NSString *jiGouId;

@property (nonatomic, strong)UIButton *headButton;  //负责人
@property (nonatomic, strong)UIButton *findNameButton; //发现人

@property (nonatomic, strong)UIButton *stateButton;
@property (nonatomic, strong)NSString *stateValue;

@property (nonatomic, strong)UITextView *shuoMingText;

@end
