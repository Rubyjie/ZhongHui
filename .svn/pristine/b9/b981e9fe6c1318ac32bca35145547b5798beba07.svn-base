//
//  YiDuMessageCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/19.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "YiDuMessageCell.h"

@implementation YiDuMessageCell

static float YiDuMessageCellHeight = 140;

static float YiDuMessageCellMargin = 10;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, YiDuMessageCellHeight-10);
        [self.layer addSublayer:layer];
        [self initYIDuMessageCell];
        
    }
    return self;
}

-(void)initYIDuMessageCell
{
    // 头像
    UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(YiDuMessageCellMargin, YiDuMessageCellMargin, 40, 40)];
    photoImage.image = [UIImage imageNamed:@"Man"];
    [self addSubview:photoImage];
    
    // 发送人
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+YiDuMessageCellMargin, YiDuMessageCellMargin, 100, 20)];
    nameLabel.text = @"姓名";
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:nameLabel];
    
//    // 回复
//    UILabel *stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 100 - YiDuMessageCellMargin, YiDuMessageCellMargin, 100, 20)];
//    stateLabel.text = @"发送人";
//    stateLabel.textAlignment = NSTextAlignmentRight;
//    stateLabel.font = [UIFont systemFontOfSize:14];
//    [self addSubview:stateLabel];
    
    // 时间
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+YiDuMessageCellMargin, CGRectGetMaxY(nameLabel.frame)+5, PHONE_UISCREEN_WIDTH - YiDuMessageCellMargin - 40, 20)];
    timeLabel.text = @"2015-12-11 09:38:30";
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:timeLabel];
    
    // 会议通知
    UILabel *notificationLabel = [[UILabel alloc]initWithFrame:CGRectMake(YiDuMessageCellMargin, CGRectGetMaxY(timeLabel.frame), PHONE_UISCREEN_WIDTH-YiDuMessageCellMargin*2, 20)];
    notificationLabel.text = @"会议通知";
    notificationLabel.textAlignment = NSTextAlignmentLeft;
    notificationLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:notificationLabel];
    
    CGFloat contentLabelW = PHONE_UISCREEN_WIDTH - YiDuMessageCellMargin*2;
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(YiDuMessageCellMargin, CGRectGetMinY(notificationLabel.frame)+YiDuMessageCellMargin, contentLabelW, 40)];
    contentLabel.font = [UIFont systemFontOfSize:16];
    contentLabel.text = @"与管理层开会讨论众荟CRM系统人员投入问题";
    contentLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:contentLabel];
    
    
    CALayer *henglayer = [[CALayer alloc] init];
    henglayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
    henglayer.frame = CGRectMake(0, YiDuMessageCellHeight - 30 - 10, PHONE_UISCREEN_WIDTH, 0.5);
    [self.layer addSublayer:henglayer];
    
    UILabel *respondLabel = [[UILabel alloc]initWithFrame:CGRectMake(YiDuMessageCellMargin, CGRectGetMaxY(henglayer.frame)+5, 100, 20)];
    respondLabel.text = @"回复人:";
    respondLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:respondLabel];
    
    UILabel *respondNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(respondLabel.frame)-45, CGRectGetMaxY(henglayer.frame)+5, 100, 20)];
    respondNameLabel.text = @"姚旭";
    
    respondNameLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:respondNameLabel];

    UILabel *respondTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - YiDuMessageCellMargin - 200,  CGRectGetMaxY(henglayer.frame)+5, 200, 20)];
    respondTimeLabel.text = @"2015-12-18";
    respondTimeLabel.textAlignment = NSTextAlignmentRight;
    respondTimeLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:respondTimeLabel];
}


@end
