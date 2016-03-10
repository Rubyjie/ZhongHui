//
//  BusinessCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/19.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "BusinessCell.h"

static float BusinessCellHeight = 80;


@implementation BusinessCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, BusinessCellHeight-10);
        [self.layer addSublayer:layer];
        
        [self initBusinessCell];
    }
    return self;
}

-(void)initBusinessCell
{
    CGFloat labelMangin = 5;
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelMangin, 0, PHONE_UISCREEN_WIDTH, 20)];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.titleLabel];
    
    // 提醒图标
    UIImageView *calendarImage = [[UIImageView alloc]initWithFrame:CGRectMake(labelMangin, CGRectGetMaxY(self.titleLabel.frame), 18, 18)];
    calendarImage.image = [UIImage imageNamed:@"日程通知"];
    [self addSubview:calendarImage];
    
    self.startTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(calendarImage.frame), CGRectGetMaxY(self.titleLabel.frame), 100, 15)];
    self.startTimeLabel.textColor = [UIColor grayColor];
    self.startTimeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.startTimeLabel];

    
    self.endTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.startTimeLabel.frame),  CGRectGetMaxY(self.titleLabel.frame), 100, 15)];
    self.endTimeLabel.textColor = [UIColor grayColor];
    self.endTimeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.endTimeLabel];
    
    self.shuoMingLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelMangin,  CGRectGetMaxY(self.endTimeLabel.frame)+labelMangin, PHONE_UISCREEN_WIDTH-labelMangin*2, 30)];
    self.shuoMingLabel.textColor = [UIColor grayColor];
    self.shuoMingLabel.numberOfLines = 0;
    self.shuoMingLabel.adjustsFontSizeToFitWidth = YES;
    self.shuoMingLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.shuoMingLabel];


}

@end
