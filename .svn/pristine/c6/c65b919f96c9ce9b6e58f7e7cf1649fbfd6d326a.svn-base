//
//  CancelTaskCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/23.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CancelTaskCell.h"


#pragma mark - 取消任务
@implementation CancelTaskCell

static float   CancelTaskCellHeight = 180;
static float   CancelTaskCellMargin = 10;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, CancelTaskCellHeight-10);
        [self.layer addSublayer:layer];
        
        // 初始化已取消任务cell
        [self initCancelTaskCellCell];
    }
    return self;
}

-(void)initCancelTaskCellCell
{
    UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(CancelTaskCellMargin, CancelTaskCellMargin, 40, 40)];
    photoImage.image = [UIImage imageNamed:@"Man"];
    [self addSubview:photoImage];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+CancelTaskCellMargin, CancelTaskCellMargin, 100, 20)];
    nameLabel.text = @"姓名";
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:nameLabel];
    
    
    UILabel *stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 100 - CancelTaskCellMargin, CancelTaskCellMargin, 100, 20)];
    stateLabel.text = @"状态";
    stateLabel.textAlignment = NSTextAlignmentRight;
    stateLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:stateLabel];
    
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+CancelTaskCellMargin, CGRectGetMaxY(nameLabel.frame)+5, PHONE_UISCREEN_WIDTH - CancelTaskCellMargin - 40, 20)];
    timeLabel.text = @"2015-12-11 09:38:30";
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:timeLabel];
    
    CGFloat contentLabelW = PHONE_UISCREEN_WIDTH - CancelTaskCellMargin*2;
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(CancelTaskCellMargin, CGRectGetMaxY(photoImage.frame), contentLabelW, 40)];
    contentLabel.font = [UIFont systemFontOfSize:16];
    contentLabel.text = @"与管理层开会讨论众荟CRM系统人员投入问题";
    contentLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:contentLabel];
    
    
    UILabel *headName = [[UILabel alloc]initWithFrame:CGRectMake(CancelTaskCellMargin, CGRectGetMaxY(contentLabel.frame), 60, 20)];
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
    
    UILabel *jilu = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(nextlayer.frame)+5, 60, 20)];
    jilu.textAlignment = NSTextAlignmentCenter;
    jilu.text = @"处理记录";
    jilu.font = [UIFont systemFontOfSize:14];
    [self addSubview:jilu];
    
}


@end
