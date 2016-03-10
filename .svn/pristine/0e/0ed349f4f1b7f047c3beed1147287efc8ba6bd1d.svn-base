//
//  NotificationsCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/15.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "NotificationsCell.h"

#define NotificationsCellSpacing  5

@implementation NotificationsCell

static float cellheight = 160;
static float yspace = 15;


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
                
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, cellheight-20);
        [self.layer addSublayer:layer];
        
        
        UIImageView *avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, yspace, 50, 50)];
//        avatarView.backgroundColor = [UIColor blackColor];
        avatarView.image = [UIImage imageNamed:@"图层-6"];
        avatarView.layer.cornerRadius = 25;
        avatarView.layer.masksToBounds = YES;
        [self addSubview:avatarView];
        
        // 提醒图标
        UIImageView *calendarImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(avatarView.frame)+5, yspace, 18, 18)];
        calendarImage.image = [UIImage imageNamed:@"日程通知"];
        [self addSubview:calendarImage];
        
        // 2.提醒
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(calendarImage.frame) + 5, yspace, PHONE_UISCREEN_WIDTH - avatarView.frame.size.width - yspace*2 - 50, 20)];
        nameLabel.textColor = RGB(246, 183, 72);
        nameLabel.font = [UIFont systemFontOfSize:14];
        nameLabel.text = @"2015-12-25 提醒";
        [self addSubview:nameLabel];

        // 3.位置
        UILabel *locationLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 30 - 50 - 5, yspace, 50, 20)];
        locationLabel.text = @"北京";
        locationLabel.textAlignment = NSTextAlignmentRight;
        locationLabel.textColor = RGB(0, 187, 222);
        locationLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:locationLabel];

//        // new标志
//        UIImageView *markImage = [[UIImageView alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 30, 10, 30, 30)];
//        markImage.backgroundColor = [UIColor greenColor];
//        [self addSubview:markImage];
        
        // 4.标题
        CGFloat titleLabelX = CGRectGetMaxX(avatarView.frame)+5;
        CGFloat titleLabelY = CGRectGetMaxY(locationLabel.frame) + 1;
        CGFloat titleLabelW = PHONE_UISCREEN_WIDTH - yspace*3 - 40;
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = @"与管理层开会讨论众荟CRM系统人员投入问题研究项目问题你咖啡那份不睡觉卡建设";
        titleLabel.adjustsFontSizeToFitWidth = YES;
        titleLabel.numberOfLines = 0;
        titleLabel.font = [UIFont systemFontOfSize:14];
        
        
        CGSize titleSize = [titleLabel.text boundingRectWithSize:CGSizeMake(titleLabelW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
        titleLabel.frame = (CGRect){{titleLabelX, titleLabelY}, titleSize};
        [self addSubview:titleLabel];

        
        // 5.时间
        UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - yspace*2 - 80, CGRectGetMaxY(titleLabel.frame) + 1, 80, 20)];
        timeLabel.text = @"2015-12-25";
        timeLabel.textColor = [UIColor grayColor];
        timeLabel.textAlignment = NSTextAlignmentRight;
        timeLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:timeLabel];
        
    
        for (int i = 0; i < 2; i ++) {
            CALayer *linelayer = [[CALayer alloc] init];
            linelayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
            linelayer.frame =  CGRectMake(0, cellheight - 10-40+39.5*i, [UIScreen mainScreen].bounds.size.width, 0.5);
            [self.layer addSublayer:linelayer];
        }
        
        
        NSArray *marktitleArr = @[@"回复",@"跟进",@"提醒",@"归档"];
        float _linewidth = [UIScreen mainScreen].bounds.size.width/4;
        for (int i = 0; i < 4; i ++) {
            
            CALayer *shulayer = [[CALayer alloc] init];
            shulayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
            shulayer.frame = CGRectMake(_linewidth*i, cellheight-35 - 10, 0.5, 30);
            [self.layer addSublayer:shulayer];
            
            UIButton *markbutton = [UIButton buttonWithType:UIButtonTypeCustom];
            [markbutton setTag:100+i];
            [markbutton addTarget:self action:@selector(markButtonPressedWithtag:) forControlEvents:UIControlEventTouchUpInside];
            markbutton.frame = CGRectMake(_linewidth*i, cellheight-40 - 10, _linewidth, 40);
            markbutton.backgroundColor = [UIColor clearColor];
            markbutton.titleLabel.font = [UIFont systemFontOfSize:15];
            [markbutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [markbutton setTitle:[marktitleArr objectAtIndex:i] forState:UIControlStateNormal];
            [self addSubview:markbutton];
        }
        

    }
    return self;
}


-(void)markButtonPressedWithtag:(UIButton *)button
{
    [self.delegate swithButtonPushViewWithTag:button.tag];
}

@end
