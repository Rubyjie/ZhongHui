//
//  ScheduleViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/21.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "ScheduleViewController.h"
#import "NotificationsCell.h"


#import "CLWeeklyCalendarView.h"
#import "DailyCalendarView.h"

@interface ScheduleViewController () <UITableViewDataSource,UITableViewDelegate,CLWeeklyCalendarViewDelegate,DailyCalendarViewDelegate>

@property (nonatomic, strong)UITableView *scheduleTabel;

#pragma mark - 日历的view
@property (nonatomic, strong)CLWeeklyCalendarView* calendarView;

@end

@implementation ScheduleViewController

static CGFloat CALENDER_VIEW_HEIGHT = 120.f;


-(UITableView *)scheduleTabel
{
    if (!_scheduleTabel) {
        
        _scheduleTabel = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64)];
        _scheduleTabel.dataSource = self;
        _scheduleTabel.delegate = self;
        _scheduleTabel.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _scheduleTabel;
}


-(void)dailyCalendarViewDidSelect:(NSDate *)date
{
    

}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"我的日程";
    
    self.scheduleTabel.tableHeaderView = self.calendarView;

    self.view.backgroundColor = RGB(227, 227, 227);
    
    self.scheduleTabel.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.scheduleTabel];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellIdtenfirer";
    
    NotificationsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[NotificationsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

//Initialize
-(CLWeeklyCalendarView *)calendarView
{
    if(!_calendarView){
        _calendarView = [[CLWeeklyCalendarView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, CALENDER_VIEW_HEIGHT)];
        _calendarView.delegate = self;
    }
    return _calendarView;
}


#pragma mark - CLWeeklyCalendarViewDelegate
-(NSDictionary *)CLCalendarBehaviorAttributes
{
    return @{
             CLCalendarWeekStartDay : @2,                 //Start Day of the week, from 1-7 Mon-Sun -- default 1
             CLCalendarDayTitleTextColor : [UIColor yellowColor],
             CLCalendarSelectedDatePrintColor : [UIColor greenColor],
             };
}


@end
