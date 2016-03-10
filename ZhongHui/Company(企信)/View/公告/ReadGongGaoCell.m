//
//  ReadGongGaoCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/19.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//  已读公告

#import "ReadGongGaoCell.h"

@implementation ReadGongGaoCell

static float ReadGongGaoCellHeight = 140;
static float ReadGonggaoCellMargin = 10;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, PHONE_UISCREEN_WIDTH, ReadGongGaoCellHeight-10);
        [self.layer addSublayer:layer];
        // 内部已读公告
        [self initReadGongGaoCells];
    }
    return self;
}

-(void)initReadGongGaoCells
{
    // 公告内容
    CGFloat contentX = ReadGonggaoCellMargin;
    CGFloat contentY = ReadGonggaoCellMargin;
    CGFloat contentW = PHONE_UISCREEN_WIDTH - ReadGonggaoCellMargin *2;
    
    UILabel *contentLabel = [[UILabel alloc]init];
    contentLabel.text = @"与管理层开会讨论众荟CRM系统人员投入问题，研究项目进展情况";
    contentLabel.font = [UIFont systemFontOfSize:14];
    
    CGSize contentSize = [contentLabel.text boundingRectWithSize:CGSizeMake(contentW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    
    contentLabel.numberOfLines = 0;
    contentLabel.adjustsFontSizeToFitWidth = YES;
    contentLabel.frame = (CGRect){{contentX, contentY}, contentSize};
    [self addSubview:contentLabel];
    
    // 摘要信息
    CGFloat messageLabelX = contentX;
    CGFloat messageLabelY = CGRectGetMaxY(contentLabel.frame)+5;
    CGFloat messageLabelW = PHONE_UISCREEN_WIDTH- ReadGonggaoCellMargin*2;
    UILabel *messageLabel = [[UILabel alloc]init];
    messageLabel.text = @"摘要信息：国家大力发展高铁项目，努力实现快速发经济，是人民的愿望南方大厦内颠三倒四就啊健康的啊";
    messageLabel.font = [UIFont systemFontOfSize:14];
    messageLabel.adjustsFontSizeToFitWidth = YES;
    messageLabel.numberOfLines = 0;
//    CGSize messageLabelSize = [messageLabel.text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(messageLabelW, MAXFLOAT)];
    
    CGSize messageSize = [messageLabel.text boundingRectWithSize:CGSizeMake(messageLabelW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    messageLabel.frame = (CGRect){{messageLabelX,messageLabelY},messageSize};
    [self addSubview:messageLabel];
    
    // 发布时间
    UILabel *relessedLabel = [[UILabel alloc]initWithFrame:CGRectMake(ReadGonggaoCellMargin, CGRectGetMaxY(messageLabel.frame)+5 , 60, 20)];
    relessedLabel.text = @"发布时间:";
    relessedLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:relessedLabel];
    
    UILabel *relessedTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(relessedLabel.frame), CGRectGetMaxY(messageLabel.frame)+5, 70, 20)];
    relessedTimeLabel.text = @"2016-1-12";
    relessedTimeLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:relessedTimeLabel];
    
    // 阅读时间
    UILabel *readLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH-ReadGonggaoCellMargin-60-70, CGRectGetMaxY(messageLabel.frame)+5, 60, 20)];
    readLabel.text = @"阅读时间:";
    readLabel.textAlignment = NSTextAlignmentRight;
    readLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:readLabel];
    
    // 时间
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH-ReadGonggaoCellMargin-70, CGRectGetMaxY(messageLabel.frame)+5, 70, 20)];
    timeLabel.text = @"2015-12-23";
    timeLabel.textAlignment = NSTextAlignmentRight;
    timeLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:timeLabel];


}

@end
