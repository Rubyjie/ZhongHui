//
//  TiXingView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/22.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "TiXingView.h"
#import "DefaultCell.h"

@interface TiXingView () <DefaultDataPickerDelegate>

@property(nonatomic,strong)DefaultCell *TiXingDatePickerCell;


@end

@implementation TiXingView

-(DefaultCell*)TiXingDatePickerCell{
    
    if (!_TiXingDatePickerCell) {
        _TiXingDatePickerCell = [[DefaultCell alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        _TiXingDatePickerCell.delegate = self;
        _TiXingDatePickerCell.whichCell = 1;
    }
    
    return _TiXingDatePickerCell;
}


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        
        NSArray *textArray = @[@"提醒:",@"提醒时间:"];

        for (int i = 0; i < textArray.count; i++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(20, 10 + (40*i), PHONE_UISCREEN_WIDTH -40, 40);
            [button setTitle:@"点击选择" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [button addTarget:self action:@selector(ButtonChooseTime:) forControlEvents:UIControlEventTouchUpInside];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            button.backgroundColor = [UIColor whiteColor];
            self.timeButton = button;
            button.tag = 10000 + i;
            [self addSubview:button];
            
            
            
            if (i < 1) {
                
                CALayer *linelayer = [[CALayer alloc]init];
                linelayer.backgroundColor = LINE_COLOR.CGColor;
                linelayer.frame = CGRectMake(20,49.5,PHONE_UISCREEN_WIDTH - 40, 0.5);
                [self.layer addSublayer:linelayer];
                
                
                // 添加分享按钮
                UIButton *checkBox = [UIButton buttonWithType:UIButtonTypeCustom];
                checkBox.selected = NO;  // 默认勾选分享按钮
                [checkBox setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                checkBox.frame = CGRectMake(55, 10, 20, 20);
                [checkBox setImage:[UIImage imageWithName:@"new_feature_share_false"] forState:UIControlStateNormal];
                [checkBox setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateSelected];
                [checkBox addTarget:self action:@selector(checkClcik:) forControlEvents:UIControlEventTouchUpInside];
                self.buttonStatu = checkBox;
                [button addSubview:checkBox];

                
                
                UIButton *determineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                determineBtn.frame = CGRectMake(20, 120, PHONE_UISCREEN_WIDTH - 40, 40);
                [determineBtn setTitle:@"确定" forState:UIControlStateNormal];
                [determineBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [determineBtn addTarget:self action:@selector(clcikButtonSavePlan:) forControlEvents:UIControlEventTouchUpInside];
                determineBtn.backgroundColor = NAV_COLOR;
                [self addSubview:determineBtn];
                
               
            }
        }
    }
    
    return self;
}

-(void)ButtonChooseTime:(UIButton *)button
{
    if (button.tag == 10001) {
        
        [self.TiXingDatePickerCell showDatapicker];

    }
}

-(void)checkClcik:(UIButton *)button
{
    button.selected =! button.isSelected;
}



- (void)returnTime:(NSInteger)whichdatapicker shijianchuo:(NSString *)shijianchuo shijian:(NSString *)timestr
{
    switch (whichdatapicker) {
        case 1:
            
            if (shijianchuo.length < 1) {
                
                NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
                NSDateFormatter *pickerFormatter = [[NSDateFormatter alloc] init];// 创建一个日期格式器
                //时间戳的值
                NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
                //不带时间的
                [pickerFormatter setDateFormat:@"yyyy年MM月dd日"];
                NSString *dateString = [pickerFormatter stringFromDate:datenow];
                
                [self.timeButton setTitle:dateString forState:UIControlStateNormal];
                [self.timeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.statrDateStr = timeSp;
                
            }else{
                
                [self.timeButton setTitle:timestr forState:UIControlStateNormal];
                [self.timeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.statrDateStr = shijianchuo;
            }
            
            break;
        default:
            break;
    }
}

#pragma mark - 点击确定按钮
-(void)clcikButtonSavePlan:(UIButton *)but
{
    [self.delegate selectedButtonSavePlan];
}



@end
