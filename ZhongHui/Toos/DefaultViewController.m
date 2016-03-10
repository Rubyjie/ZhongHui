//
//  DefaultViewController.m
//  E家洁app
//
//  Created by 刘彦超 on 15/9/24.
//  Copyright (c) 2015年 刘彦超. All rights reserved.
//

#import "DefaultViewController.h"

@implementation DefaultViewController

-(void)viewDidLoad{

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-216, self.view.frame.size.width, 216)];
    self.datePicker.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.datePicker];
    
    [self.datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];//重点：UIControlEventValueChanged
    
    //设置显示格式
    //默认根据手机本地设置显示为中文还是其他语言
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];//设置为中文显示
    self.datePicker.locale = locale;
    
    
    //当前时间创建NSDate
    NSDate *localDate = [NSDate date];
    //在当前时间加上的时间：格里高利历
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    //设置时间
    [offsetComponents setYear:0];
    [offsetComponents setMonth:0];
    [offsetComponents setDay:1000];
    [offsetComponents setHour:20];
    [offsetComponents setMinute:0];
    [offsetComponents setSecond:0];
    //设置最大值时间
    NSDate *maxDate = [gregorian dateByAddingComponents:offsetComponents toDate:localDate options:0];
    //设置属性
    self.datePicker.minimumDate = localDate;
    self.datePicker.maximumDate = maxDate;
    
    
}

-(void)dateChanged:(id)sender{
    UIDatePicker *control = (UIDatePicker*)sender;
    NSDate* date = control.date;
    //添加你自己响应代码
    NSLog(@"dateChanged响应事件：%@",date);
    
    //NSDate格式转换为NSString格式
    NSDate *pickerDate = [self.datePicker date];// 获取用户通过UIDatePicker设置的日期和时间
    NSDateFormatter *pickerFormatter = [[NSDateFormatter alloc] init];// 创建一个日期格式器
    [pickerFormatter setDateFormat:@"yyyy年MM月dd日(EEEE)   HH:mm:ss"];
    NSString *dateString = [pickerFormatter stringFromDate:pickerDate];
    
    //打印显示日期时间
    NSLog(@"格式化显示时间：%@",dateString);
    
}


@end
