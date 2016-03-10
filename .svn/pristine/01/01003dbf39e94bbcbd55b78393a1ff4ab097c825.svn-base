//
//  MeTaskCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "MeTaskCell.h"


#pragma mark - 未执行
@implementation MeTaskCell
static float cellheight = 160;
static float  TaskCellMargin = 15;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, cellheight-10);
        [self.layer addSublayer:layer];
        
        // 初始化任务提醒cell
        [self initMeTaskCell];
    }
    return self;
}

-(void)initMeTaskCell
{
    UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(TaskCellMargin, TaskCellMargin, 40, 40)];
    photoImage.image = [UIImage imageNamed:@"Man"];
    [self addSubview:photoImage];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+TaskCellMargin, TaskCellMargin, 100, 20)];
    nameLabel.text = @"姓名";
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:nameLabel];
    
    
    UILabel *stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 100 - TaskCellMargin, TaskCellMargin, 100, 20)];
    stateLabel.text = @"状态";
    stateLabel.textAlignment = NSTextAlignmentRight;
    stateLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:stateLabel];
    
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+TaskCellMargin, CGRectGetMaxY(nameLabel.frame)+5, PHONE_UISCREEN_WIDTH - TaskCellMargin - 40, 20)];
    timeLabel.text = @"2015-12-11 09:38:30";
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:timeLabel];
    
    CGFloat contentLabelW = PHONE_UISCREEN_WIDTH - TaskCellMargin*2;
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(TaskCellMargin, CGRectGetMaxY(photoImage.frame), contentLabelW, 40)];
    contentLabel.font = [UIFont systemFontOfSize:16];
    contentLabel.text = @"与管理层开会讨论众荟CRM系统人员投入问题";
    contentLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:contentLabel];
    
    
    UILabel *headName = [[UILabel alloc]initWithFrame:CGRectMake(TaskCellMargin, CGRectGetMaxY(contentLabel.frame), contentLabelW, 20)];
    headName.font = [UIFont systemFontOfSize:16];
    headName.text = @"负责人";
    [self addSubview:headName];
    
    
    NSArray *marktitleArr = @[@"处理",@"委托",@"退回",@"提醒"];
    
    float _linewidth = [UIScreen mainScreen].bounds.size.width / 4;
    
    for (int i = 0; i < marktitleArr.count; i ++) {
        
        CALayer *shulayer = [[CALayer alloc] init];
        shulayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
        shulayer.frame = CGRectMake(_linewidth*i, cellheight- 35, 0.5, 30);
        [self.layer addSublayer:shulayer];
        
        UIButton *markbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        [markbutton setTag:80+i];
        [markbutton addTarget:self action:@selector(swithTaskButton:) forControlEvents:UIControlEventTouchUpInside];
        markbutton.frame = CGRectMake(_linewidth*i, cellheight-40, _linewidth, 40);
        markbutton.backgroundColor = [UIColor clearColor];
        markbutton.titleLabel.font = [UIFont systemFontOfSize:15];
        [markbutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [markbutton setTitle:[marktitleArr objectAtIndex:i] forState:UIControlStateNormal];
        [self addSubview:markbutton];
        
        if (i < 1) {
            CALayer *henglayer = [[CALayer alloc] init];
            henglayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
            henglayer.frame = CGRectMake(0, cellheight- 35, PHONE_UISCREEN_WIDTH, 0.5);
            [self.layer addSublayer:henglayer];
        }
    }
}

-(void)swithTaskButton:(UIButton *)button
{
    [self.delegate swithButtonProcesTaskWithTag:button.tag];
}


@end
