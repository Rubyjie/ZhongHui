//
//  AddConRecord.h
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/14.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol addConRecordButtonDelegate <NSObject>

-(void)swithButtonAddConRecord;

@end

@interface AddConRecord : UIView

@property (nonatomic, strong)UIButton *genJinTime;
@property (nonatomic, strong)UIButton *yuYueTime;
@property (nonatomic, strong)UIButton *resultButton;
@property (nonatomic, strong)NSString *resultValue;

@property (nonatomic, strong)NSString *genJinDateStr;
@property (nonatomic, strong)NSString *yuYueDataStr;


@property (nonatomic, strong)UITextField *yuanYinText;
@property (nonatomic, strong)UITextField *contentText;

@property (nonatomic, weak) id <addConRecordButtonDelegate>delegate;

@end
