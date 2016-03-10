//
//  ReminderCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ReminderCell.h"

@implementation ReminderCell

static float  ReminderCellHeight = 120;
static float  ReminderCellMargin = 10;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, ReminderCellHeight-10);
        [self.layer addSublayer:layer];
        
        [self initReminderCell];
    }
    return self;
}

-(void)initReminderCell
{
    // 1.头像
    UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(ReminderCellMargin, ReminderCellMargin, 40, 40)];
    photoImage.image = [UIImage imageNamed:@"Man"];
    [self addSubview:photoImage];
    
    // 2.催单人
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+ReminderCellMargin, ReminderCellMargin, 100, 20)];
    nameLabel.text = @"催单人";
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:nameLabel];

    
    // 3.时间
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+ReminderCellMargin, CGRectGetMaxY(nameLabel.frame)+5, PHONE_UISCREEN_WIDTH - ReminderCellMargin - 40, 20)];
    timeLabel.text = @"2015-12-11 09:38:30";
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:timeLabel];
    
    
    // 4.要求
    CGFloat contentLabelW = PHONE_UISCREEN_WIDTH - ReminderCellMargin*2;
    UILabel *yaoQiuLabel = [[UILabel alloc]initWithFrame:CGRectMake(ReminderCellMargin, CGRectGetMaxY(photoImage.frame), contentLabelW, 40)];
    yaoQiuLabel.font = [UIFont systemFontOfSize:12];
    yaoQiuLabel.numberOfLines = 0;
    yaoQiuLabel.text = @"要求：与管理层开会讨论众荟CRM系统人员投入问题";
    yaoQiuLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:yaoQiuLabel];
    
    // 5.来源
    CGFloat labelY = CGRectGetMaxY(yaoQiuLabel.frame);
    UILabel *soucreLabel = [[UILabel alloc]initWithFrame:CGRectMake(ReminderCellMargin, labelY, 30, 20)];
    soucreLabel.text = @"来源:";
    soucreLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:soucreLabel];
    
    UILabel *soucreName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(soucreLabel.frame), labelY, 60, 20)];
    soucreName.text = @"北京智慧班";
    soucreName.adjustsFontSizeToFitWidth = YES;
    soucreName.font = [UIFont systemFontOfSize:12];
    [self addSubview:soucreName];

    // 6.关联客户
    UILabel *customerLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(soucreName.frame)+5, labelY, 50, 20)];
    customerLabel.text = @"关联客户:";
    customerLabel.font = [UIFont systemFontOfSize:12];
    customerLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:customerLabel];
    
    UILabel *customerName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(customerLabel.frame), labelY, 60, 20)];
    customerName.text = @"客户名称";
    customerName.font = [UIFont systemFontOfSize:12];
    [self addSubview:customerName];

    // 7.关联联系人
    UILabel *contractLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(customerName.frame), labelY, 40, 20)];
    contractLabel.text = @"联系人:";
    contractLabel.adjustsFontSizeToFitWidth = YES;
    contractLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:contractLabel];
    
    UILabel *contractName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(contractLabel.frame), labelY, 60, 20)];
    contractName.text = @"联系人名称";
    contractName.adjustsFontSizeToFitWidth = YES;
    contractName.font = [UIFont systemFontOfSize:12];
    [self addSubview:contractName];
    
}

@end
