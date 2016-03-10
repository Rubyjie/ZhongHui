//
//  RemindView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/17.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "RemindView.h"
#import "DefaultCell.h"

@interface RemindView () <DefaultDataPickerDelegate>
@property(nonatomic,strong)DefaultCell *TimePickerCell;


@end

@implementation RemindView

-(DefaultCell*)TimePickerCell{
    
    if (!_TimePickerCell) {
        _TimePickerCell = [[DefaultCell alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        _TimePickerCell.delegate = self;
        _TimePickerCell.whichCell = 1;
    }
    
    return _TimePickerCell;
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


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        NSArray *textArray = @[@"       提醒:",@"提醒时间:"];
        
        for (int i = 0; i < textArray.count; i++) {
            
            UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10+(40 * i), 80, 40)];
            textLabel.text = [textArray objectAtIndex:i];
            textLabel.font = [UIFont systemFontOfSize:16];
            textLabel.textColor = [UIColor grayColor];
            [self addSubview:textLabel];
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(CGRectGetMaxX(textLabel.frame)+5, 10 + (40*i), PHONE_UISCREEN_WIDTH - 95 - 10, 40);
            [button setTitle:@"点击选择" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [button addTarget:self action:@selector(swithButtonChooseTime:) forControlEvents:UIControlEventTouchUpInside];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            button.backgroundColor = [UIColor whiteColor];
            button.tag = 300 + i;
            self.timeButton = button;
            [self addSubview:button];
            
            if (i > 0) {
                
                CALayer *linelayer = [[CALayer alloc]init];
                linelayer.backgroundColor = LINE_COLOR.CGColor;
                linelayer.frame = CGRectMake(95 ,10 + 39.5,PHONE_UISCREEN_WIDTH - 95 - 10, 0.5);
                [self.layer addSublayer:linelayer];
                
                UIButton *determineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                determineBtn.frame = CGRectMake(10, CGRectGetMaxY(button.frame)+20, PHONE_UISCREEN_WIDTH - 20, 40);
                [determineBtn setTitle:@"确定" forState:UIControlStateNormal];
                [determineBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                determineBtn.backgroundColor = NAV_COLOR;
                [self addSubview:determineBtn];
            }
        }
    }
    return self;
}

-(void)swithButtonChooseTime:(UIButton *)button
{
    if (button.tag == 301) {
        
        [self.TimePickerCell showDatapicker];
    }
}

@end
