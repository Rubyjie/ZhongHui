//
//  ChannelCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/19.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "ChannelCell.h"

static float ChannelCellHeight = 110;


@implementation ChannelCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, ChannelCellHeight-10);
        [self.layer addSublayer:layer];

        
        [self initChannelCell];
    }
    return self;
}

-(void)initChannelCell
{
    CGFloat labelMangin = 5;
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelMangin, 0, PHONE_UISCREEN_WIDTH, 20)];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.titleLabel];
    
    self.startTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelMangin, CGRectGetMaxY(self.titleLabel.frame), 100, 15)];
    self.startTimeLabel.textColor = [UIColor grayColor];
    self.startTimeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.startTimeLabel];

    self.endTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.startTimeLabel.frame), CGRectGetMaxY(self.titleLabel.frame), 100, 15)];
    self.endTimeLabel.textColor = [UIColor grayColor];
    self.endTimeLabel.font = [UIFont systemFontOfSize:14];

    [self addSubview:self.endTimeLabel];

    self.shuoMingLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelMangin, CGRectGetMaxY(self.startTimeLabel.frame), PHONE_UISCREEN_WIDTH-labelMangin*2, 20)];
    self.shuoMingLabel.numberOfLines = 0;
    self.shuoMingLabel.textColor = [UIColor grayColor];
    self.shuoMingLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.shuoMingLabel];

    self.webAddressLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelMangin, CGRectGetMaxY(self.shuoMingLabel.frame), PHONE_UISCREEN_WIDTH-labelMangin*2, 15)];
    self.webAddressLabel.textColor = [UIColor grayColor];
    self.webAddressLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.webAddressLabel];
    
    
    
    self.beiZhuLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelMangin, CGRectGetMaxY(self.webAddressLabel.frame), PHONE_UISCREEN_WIDTH-labelMangin*2, 28)];
    self.beiZhuLabel.textColor = [UIColor grayColor];
    self.beiZhuLabel.numberOfLines = 0;
    self.beiZhuLabel.adjustsFontSizeToFitWidth = YES;
    self.beiZhuLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.beiZhuLabel];

}

@end
