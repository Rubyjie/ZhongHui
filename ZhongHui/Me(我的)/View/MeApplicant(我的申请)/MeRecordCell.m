//
//  MeRecordCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/23.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "MeRecordCell.h"

@implementation MeRecordCell

static float MeRecordCellHeight = 110;
static float MeRecordCellMargin = 10;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, PHONE_UISCREEN_WIDTH, MeRecordCellHeight-10);
        [self.layer addSublayer:layer];
        
        // 初始化处理记录cell
        [self initMeRecordCell];
    }
    return self;
}


-(void)initMeRecordCell
{
    UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(MeRecordCellMargin, MeRecordCellMargin, 40, 40)];
    photoImage.image = [UIImage imageNamed:@"Man"];
    [self addSubview:photoImage];
    
    // 处理人
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+MeRecordCellMargin, MeRecordCellMargin, 100, 20)];
    nameLabel.text = @"姓名";
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:nameLabel];
    
    // 阶段
    UILabel *phaseLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 50 - MeRecordCellMargin-100, MeRecordCellMargin, 50, 20)];
    phaseLabel.textAlignment = NSTextAlignmentRight;
    phaseLabel.text = @"阶段";
    phaseLabel.textAlignment = NSTextAlignmentRight;
    phaseLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:phaseLabel];
    
    // 处理结果
    UILabel *resultLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH-MeRecordCellMargin-100, MeRecordCellMargin, 100, 20)];
    resultLabel.font = [UIFont systemFontOfSize:14];
    resultLabel.textAlignment = NSTextAlignmentRight;
    resultLabel.text = @"处理结果";
    [self addSubview:resultLabel];

    
    
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+MeRecordCellMargin, CGRectGetMaxY(nameLabel.frame)+5, PHONE_UISCREEN_WIDTH - MeRecordCellMargin - 40, 20)];
    timeLabel.text = @"2015-12-11 09:38:30";
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:timeLabel];
    
    // 说明
    CGFloat contentX = MeRecordCellMargin;
    CGFloat contentY = CGRectGetMaxY(photoImage.frame)+MeRecordCellMargin;
    CGFloat contentLabelW = PHONE_UISCREEN_WIDTH - MeRecordCellMargin*2;
    UILabel *contentLabel = [[UILabel alloc]init];
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.text = @"与管理层开会讨论众荟CRM系统人员投入问题你健康色副科级安守本分女娲嗯啊可你几点宁可为妓你大可今年的";
    contentLabel.numberOfLines = 0;
    CGSize contentSize = [contentLabel.text boundingRectWithSize:CGSizeMake(contentLabelW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    contentLabel.adjustsFontSizeToFitWidth = YES;
    contentLabel.frame = CGRectMake(contentX, contentY, contentSize.width, contentSize.height);
    [self addSubview:contentLabel];
    
    
    
}

@end
