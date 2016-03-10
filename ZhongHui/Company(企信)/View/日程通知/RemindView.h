//
//  RemindView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/17.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol timeButtonDelegate <NSObject>
//
//-(void)selectedButtonChooseTimeWithTag:(NSInteger)tag;
//
//@end

@interface RemindView : UIView

//@property (nonatomic, weak)id <timeButtonDelegate>delegate;

@property (nonatomic, strong)UIButton *timeButton;

@property (nonatomic, strong)NSString *statrDateStr;   //时间戳

@end
