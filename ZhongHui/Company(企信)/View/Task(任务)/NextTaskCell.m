//
//  NextTaskCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/19.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "NextTaskCell.h"

@implementation NextTaskCell

static float FinishCellheight = 200;
static float FinishTaskCellMargin = 15;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, PHONE_UISCREEN_WIDTH, FinishCellheight-10);
        [self.layer addSublayer:layer];
        
        // 初始化任务提醒cell
        [self initFinishTaskCell];
    }
    return self;
}

-(void)initFinishTaskCell
{
    // 头像
    UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(FinishTaskCellMargin, FinishTaskCellMargin, 40, 40)];
    photoImage.image = [UIImage imageNamed:@"Man"];
    [self addSubview:photoImage];
    
    // 姓名
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+FinishTaskCellMargin, FinishTaskCellMargin, 100, 20)];
    nameLabel.text = @"姓名";
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:nameLabel];
    
    // 时间
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+FinishTaskCellMargin, CGRectGetMaxY(nameLabel.frame)+5, PHONE_UISCREEN_WIDTH - FinishTaskCellMargin - 40, 20)];
    timeLabel.text = @"2015-12-11 09:38:30";
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:timeLabel];
    
    // 内容
    CGFloat contentX = FinishTaskCellMargin;
    CGFloat contentY = CGRectGetMaxY(photoImage.frame);
    CGFloat contentLabelW = PHONE_UISCREEN_WIDTH - FinishTaskCellMargin*2;
    UILabel *contentLabel = [[UILabel alloc]init];
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.numberOfLines = 0;
    contentLabel.text = @"与管理层开会讨论众荟CRM系统人员投入问题";
    contentLabel.adjustsFontSizeToFitWidth = YES;
    CGSize titleSize = [contentLabel.text boundingRectWithSize:CGSizeMake(contentLabelW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    contentLabel.frame = (CGRect){{contentX, contentY}, titleSize};
    [self addSubview:contentLabel];
    
    
    // 负责人
    UILabel *headName = [[UILabel alloc]initWithFrame:CGRectMake(FinishTaskCellMargin, CGRectGetMaxY(contentLabel.frame), 100, 20)];
    headName.font = [UIFont systemFontOfSize:16];
    headName.text = @"负责人";
    [self addSubview:headName];
    
    // 提醒时间
    UILabel *remindTime = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(headName.frame)+55,CGRectGetMaxY(contentLabel.frame), 200, 20)];
    remindTime.text = @"提醒 2015－12－12";
    remindTime.textAlignment = NSTextAlignmentLeft;
    remindTime.font = [UIFont systemFontOfSize:12];
    [self addSubview:remindTime];
    
    CALayer *henglayer = [[CALayer alloc] init];
    henglayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
    henglayer.frame = CGRectMake(0, CGRectGetMaxY(remindTime.frame)+5, PHONE_UISCREEN_WIDTH, 0.5);
    [self.layer addSublayer:henglayer];

    // 处理人
    UILabel *DealingName = [[UILabel alloc]initWithFrame:CGRectMake(FinishTaskCellMargin, CGRectGetMaxY(henglayer.frame), 100, 20)];
    DealingName.text = @"处理人";
    DealingName.font = [UIFont systemFontOfSize:12];
    [self addSubview:DealingName];

    // 处理时间
    UILabel *DealingTime = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DealingName.frame)-40, CGRectGetMaxY(henglayer.frame), PHONE_UISCREEN_WIDTH - FinishTaskCellMargin - 100, 20)];
    DealingTime.text = @"2015-12-11 09:38:30";
    DealingTime.textAlignment = NSTextAlignmentLeft;
    DealingTime.font = [UIFont systemFontOfSize:12];
    [self addSubview:DealingTime];

    // 阶段
    UILabel *phaseLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH-FinishTaskCellMargin-100,  CGRectGetMaxY(henglayer.frame), 50, 20)];
    phaseLabel.text = @"阶段";
    phaseLabel.textAlignment = NSTextAlignmentRight;
    phaseLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:phaseLabel];
    
    // 状态
    UILabel *stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH-FinishTaskCellMargin-50, CGRectGetMaxY(henglayer.frame), 50, 20)];
    stateLabel.text = @"状态";
    stateLabel.textAlignment = NSTextAlignmentRight;
    stateLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:stateLabel];

    // 说明
    UILabel *instructionsLabel = [[UILabel alloc]initWithFrame:CGRectMake(FinishTaskCellMargin, CGRectGetMaxY(DealingName.frame), PHONE_UISCREEN_WIDTH-FinishTaskCellMargin*2, 20)];
    instructionsLabel.numberOfLines = 0;
    instructionsLabel.adjustsFontSizeToFitWidth = YES;
    instructionsLabel.text = @"说明:周一开会研究项目进展";
    instructionsLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:instructionsLabel];
    
    CALayer *nextLayer = [[CALayer alloc] init];
    nextLayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
    nextLayer.frame = CGRectMake(0, CGRectGetMaxY(instructionsLabel.frame)+5, PHONE_UISCREEN_WIDTH, 0.5);
    [self.layer addSublayer:nextLayer];
    
    UILabel *riZhiLabel = [[UILabel alloc]initWithFrame:CGRectMake(FinishTaskCellMargin, FinishCellheight - 30, 50, 20)];
    riZhiLabel.text = @"日志";
    riZhiLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:riZhiLabel];
    
    CALayer *shuLayer = [[CALayer alloc] init];
    shuLayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
    shuLayer.frame = CGRectMake(CGRectGetMaxX(riZhiLabel.frame)-5, CGRectGetMaxY(instructionsLabel.frame)+10, 0.5, 25);
    [self.layer addSublayer:shuLayer];

}

//+(CGFloat)tableViewCellHeightWithContent:(NSString *)content
//{
//    float cellHeight = 0;
//    
//    CGSize contentSize = [CommonUtils sizeWithContentString:content font:[UIFont systemFontOfSize:14] size:CGSizeMake(PHONE_UISCREEN_WIDTH-FinishTaskCellMargin*2, CGFLOAT_MAX)];
//    
//    return expression
//}

@end
