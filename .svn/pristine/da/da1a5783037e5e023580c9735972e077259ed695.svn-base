//
//  RecordCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//  记录明细

#import "RecordCell.h"

@implementation RecordCell

static float  RecordCellHeight = 100;
static float  RecordCellMargin = 10;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, RecordCellHeight-10);
        [self.layer addSublayer:layer];
        
        [self initRecordCell];
    }
    return self;
}

-(void)initRecordCell
{
    // 1.头像
    UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(RecordCellMargin, RecordCellMargin, 40, 40)];
    photoImage.image = [UIImage imageNamed:@"Man"];
    [self addSubview:photoImage];
    
    // 2.处理人
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+RecordCellMargin, RecordCellMargin, 100, 20)];
    nameLabel.text = @"姓名";
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:nameLabel];
    
    // 3.状态
    UILabel *stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 100 - RecordCellMargin, RecordCellMargin, 100, 20)];
    stateLabel.text = @"状态";
    stateLabel.textAlignment = NSTextAlignmentRight;
    stateLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:stateLabel];
    
    // 4.时间
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+RecordCellMargin, CGRectGetMaxY(nameLabel.frame)+5, PHONE_UISCREEN_WIDTH - RecordCellMargin - 40, 20)];
    timeLabel.text = @"2015-12-11 09:38:30";
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:timeLabel];
    
    
    // 5.说明
    CGFloat contentX = RecordCellMargin;
    CGFloat contentY = CGRectGetMaxY(photoImage.frame);
    CGFloat contentLabelW = PHONE_UISCREEN_WIDTH - RecordCellMargin*2;
    UILabel *shuoMingLabel = [[UILabel alloc]init];
    shuoMingLabel.font = [UIFont systemFontOfSize:14];
    shuoMingLabel.numberOfLines = 0;
    shuoMingLabel.text = @"说明：与管理层开会讨论众荟CRM系统人员投入问题";
    shuoMingLabel.adjustsFontSizeToFitWidth = YES;
    CGSize contentSize = [shuoMingLabel.text boundingRectWithSize:CGSizeMake(contentLabelW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    shuoMingLabel.frame = CGRectMake(contentX, contentY, contentSize.width, contentSize.height);
    [self addSubview:shuoMingLabel];
    
}


@end
