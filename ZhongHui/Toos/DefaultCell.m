//
//  DefaultCell.m
//  E家洁app
//
//  Created by 刘彦超 on 15/8/30.
//  Copyright (c) 2015年 刘彦超. All rights reserved.
//

#import "DefaultCell.h"

@interface DefaultCell ()

@property(nonatomic,strong)UIDatePicker *datePicker;
@property(nonatomic,strong) NSString     *selectTime;
@property(nonatomic,strong) NSString     *selectShijianchuo;
@end

@implementation DefaultCell

-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        UIControl *blackcontrol = [[UIControl alloc]initWithFrame:[UIScreen mainScreen].bounds];
        blackcontrol.backgroundColor = [UIColor blackColor];
        blackcontrol.alpha = 0.5;
        [blackcontrol addTarget:self action:@selector(hiddenView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:blackcontrol];

        UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, PHONE_UISCREEN_HEIGHT-256, PHONE_UISCREEN_WIDTH, 40)];
        headView.backgroundColor = [UIColor whiteColor];
        [self addSubview:headView];

        NSArray *titleArray = @[@"确定",@"取消"];
        
        for (int i = 0; i < 2; i ++) {
            
            UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            selectBtn.frame = CGRectMake((PHONE_UISCREEN_WIDTH-80)*i, 0, 80, 40);
            selectBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            [selectBtn setTitleColor:NAV_COLOR forState:UIControlStateNormal];
            [selectBtn setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
            [selectBtn addTarget:self action:@selector(sureOrcancel:) forControlEvents:UIControlEventTouchUpInside];
            [headView addSubview:selectBtn];
            
        }

        
        self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, PHONE_UISCREEN_HEIGHT-216, PHONE_UISCREEN_WIDTH, 216)];
        //[self.datePicker addSubview:[UIImage imageNamed:@"Gl_book_pickerViewImage2"]];
        self.datePicker.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        [self addSubview:self.datePicker];
        
        [self.datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];//重点：UIControlEventValueChanged
        
        //设置显示格式
        //默认根据手机本地设置显示为中文还是其他语言
        NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];//设置为中文显示
        self.datePicker.locale = locale;
        
        
        //当前时间创建NSDate
        //在当前时间加上的时间：格里高利历
        NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
        //设置时间
        [offsetComponents setYear:0];
        [offsetComponents setMonth:0];
        [offsetComponents setDay:100000];
        [offsetComponents setHour:20];
        [offsetComponents setMinute:0];
        [offsetComponents setSecond:0];

        
        NSDateFormatter* formater = [[NSDateFormatter alloc] init];
        [formater setDateFormat:@"yyyy年MM月dd日"];

        NSDate* maxdate = [formater dateFromString:@"2020年1月1日"];
        NSDate* mindate = [formater dateFromString:@"2000年1月1日"];
        self.datePicker.minimumDate = mindate;
        self.datePicker.maximumDate = maxdate;

        
        if (self.whichCell == 2) {
            
            self.datePicker.minimumDate = [NSDate date];
            self.datePicker.maximumDate = maxdate;
        }
        
        //设置属性
//        self.datePicker.datePickerMode = UIDatePickerModeDate; //不显示具体时间
//         设置显示最大时间（此处为当前时间）
//        [self.datePicker setMaximumDate:[NSDate date]];
        
    }

    return self;
}


-(void)dateChanged:(id)sender{
    
    UIDatePicker *control = (UIDatePicker*)sender;
    NSDate* date = control.date;
    //添加你自己响应代码
    NSLog(@"dateChanged响应事件：%@",date);
    
    //NSDate格式转换为NSString格式
    NSDate *pickerDate = [self.datePicker date];// 获取用户通过UIDatePicker设置的日期和时间
    NSDateFormatter *pickerFormatter = [[NSDateFormatter alloc] init];// 创建一个日期格式器
    
    //时间戳的值
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[pickerDate timeIntervalSince1970]];

    //[pickerFormatter setDateFormat:@"yyyy年MM月dd日(EEEE)   HH:mm:ss"];
    //不带时间的
    [pickerFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    
    NSString *dateString = [pickerFormatter stringFromDate:pickerDate];
    
    //打印显示日期时间
    NSLog(@"格式化显示时间：%@",dateString);
    self.selectTime = dateString;
    self.selectShijianchuo = timeSp;
    
}

- (void)showDatapicker
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

- (void)hiddenDatapicker
{
    [self removeFromSuperview];
}


- (void)sureOrcancel:(UIButton *)sender
{
    [self hiddenDatapicker];
    
    if ([sender.currentTitle isEqualToString:@"确定"]) {
        
        // timeStamp时间戳
        [self.delegate returnTime:self.whichCell shijianchuo:self.selectShijianchuo shijian:self.selectTime];
    }else{
        
        [self hiddenDatapicker];
    }
}


#pragma makr 点击黑色背景 把自己（也就是当前view）从父视图移出去
- (void)hiddenView
{
    [self removeFromSuperview];
}



@end
