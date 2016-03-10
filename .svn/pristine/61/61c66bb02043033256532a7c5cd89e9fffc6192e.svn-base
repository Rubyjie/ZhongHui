//
//  performCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/23.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "performCell.h"

@implementation performCell

#pragma mark - 已执行

static float   performCellHeight = 180;
static float   performCellMargin = 15;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, performCellHeight-10);
        [self.layer addSublayer:layer];
        
        // 初始化已执行任务提醒cell
        [self initPerformCellTaskCell];
    }
    return self;
}


-(void)initPerformCellTaskCell
{
    UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(performCellMargin, performCellMargin, 40, 40)];
    photoImage.image = [UIImage imageNamed:@"Man"];
    [self addSubview:photoImage];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+performCellMargin, performCellMargin, 100, 20)];
    nameLabel.text = @"姓名";
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:nameLabel];
    
    
    UILabel *stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 100 - performCellMargin, performCellMargin, 100, 20)];
    stateLabel.text = @"状态";
    stateLabel.textAlignment = NSTextAlignmentRight;
    stateLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:stateLabel];
    
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+performCellMargin, CGRectGetMaxY(nameLabel.frame)+5, PHONE_UISCREEN_WIDTH - performCellMargin - 40, 20)];
    timeLabel.text = @"2015-12-11 09:38:30";
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:timeLabel];
    
    CGFloat contentLabelW = PHONE_UISCREEN_WIDTH - performCellMargin*2;
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(performCellMargin, CGRectGetMaxY(photoImage.frame), contentLabelW, 40)];
    contentLabel.font = [UIFont systemFontOfSize:16];
    contentLabel.text = @"与管理层开会讨论众荟CRM系统人员投入问题";
    contentLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:contentLabel];
    
    
    UILabel *headName = [[UILabel alloc]initWithFrame:CGRectMake(performCellMargin, CGRectGetMaxY(contentLabel.frame), 60, 20)];
    headName.font = [UIFont systemFontOfSize:16];
    headName.text = @"负责人";
    [self addSubview:headName];
    
    
    // 完成时间
    UILabel *completionTime = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(headName.frame), CGRectGetMaxY(contentLabel.frame), 240, 20)];
    completionTime.text = @"2015-12-29";
    completionTime.font = [UIFont systemFontOfSize:14];
    [self addSubview:completionTime];
    
    
    CALayer *henglayer = [[CALayer alloc] init];
    henglayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
    henglayer.frame = CGRectMake(0, CGRectGetMaxY(completionTime.frame), PHONE_UISCREEN_WIDTH, 0.5);
    [self.layer addSublayer:henglayer];
    
    // 说明
    UILabel *ShuoMing = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(henglayer.frame), PHONE_UISCREEN_WIDTH, 30)];
    ShuoMing.text = @"说明内容：贺卡的撒谎看世界的和文化百科啊大家贺卡微博的";
    ShuoMing.adjustsFontSizeToFitWidth = YES;
    ShuoMing.font = [UIFont systemFontOfSize:14];
    [self addSubview:ShuoMing];
    
    
    CALayer *nextlayer = [[CALayer alloc] init];
    nextlayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
    nextlayer.frame = CGRectMake(0, CGRectGetMaxY(ShuoMing.frame), PHONE_UISCREEN_WIDTH, 0.5);
    [self.layer addSublayer:nextlayer];
    
    UILabel *RiZhi = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(nextlayer.frame)+5, 60, 20)];
    RiZhi.textAlignment = NSTextAlignmentCenter;
    RiZhi.text = @"日志";
    RiZhi.font = [UIFont systemFontOfSize:14];
    [self addSubview:RiZhi];
    
    UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(RiZhi.frame), CGRectGetMaxY(nextlayer.frame)+5, PHONE_UISCREEN_WIDTH-60, 20)];
    textfield.text = @"内容";
    textfield.font = [UIFont systemFontOfSize:14];
    [self addSubview:textfield];

}
@end
