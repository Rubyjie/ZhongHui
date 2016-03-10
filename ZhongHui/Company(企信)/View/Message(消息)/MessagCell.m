//
//  MessagCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/19.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//  未读消息

#import "MessagCell.h"


@implementation MessagCell

static float messageCellMargin = 10;

static float messageCellHeight = 100;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, messageCellHeight-10);
        [self.layer addSublayer:layer];
        [self initMessageCell];
        
    }
    return self;
}

-(void)initMessageCell
{
    // 头像
    UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(messageCellMargin, messageCellMargin, 40, 40)];
    photoImage.image = [UIImage imageNamed:@"Man"];
    [self addSubview:photoImage];
    
    // 发送人
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+messageCellMargin, messageCellMargin, 100, 20)];
    nameLabel.text = @"姓名";
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:nameLabel];
    
    // 回复
    UIButton *replyButton = [[UIButton alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 50 - messageCellMargin, messageCellMargin, 50, 20)];
    [replyButton setTitle:@"回复" forState:UIControlStateNormal];
    [replyButton setTitleColor:RGB(0, 195, 236) forState:UIControlStateNormal];
    replyButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [replyButton addTarget:self action:@selector(clcikButtonReply:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:replyButton];
    
    // 时间
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+messageCellMargin, CGRectGetMaxY(nameLabel.frame)+5, PHONE_UISCREEN_WIDTH - messageCellMargin - 40, 20)];
    timeLabel.text = @"2015-12-11 09:38:30";
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:timeLabel];
    
    // 会议通知
    UILabel *notificationLabel = [[UILabel alloc]initWithFrame:CGRectMake(messageCellMargin, CGRectGetMaxY(timeLabel.frame), PHONE_UISCREEN_WIDTH-messageCellMargin*2, 20)];
    notificationLabel.text = @"会议通知";
    notificationLabel.textAlignment = NSTextAlignmentLeft;
    notificationLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:notificationLabel];
    
    CGFloat contentLabelW = PHONE_UISCREEN_WIDTH - messageCellMargin*2;
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(messageCellMargin, CGRectGetMinY(notificationLabel.frame)+messageCellMargin, contentLabelW, 40)];
    contentLabel.font = [UIFont systemFontOfSize:16];
    contentLabel.text = @"与管理层开会讨论众荟CRM系统人员投入问题";
    contentLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:contentLabel];

}

-(void)clcikButtonReply:(UIButton *)button
{
    [self.delegate swithButtonReplyMessage];
}
@end
