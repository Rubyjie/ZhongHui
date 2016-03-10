//
//  WeiPerformCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/12.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "WeiPerformCell.h"

@implementation WeiPerformCell

static float WeiPerformCellHieght = 160;
static float WeiPerformCellMargin = 10;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
    
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, WeiPerformCellHieght-10);
        [self.layer addSublayer:layer];
        
        // 初始化我分配的任务里未执行的cell
        [self initWeiPerformCell];

        
    }
    return self;
}

-(void)initWeiPerformCell
{

    UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(WeiPerformCellMargin, WeiPerformCellMargin, 40, 40)];
    photoImage.image = [UIImage imageNamed:@"Man"];
    [self addSubview:photoImage];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+WeiPerformCellMargin, WeiPerformCellMargin, 100, 20)];
    nameLabel.text = @"姓名";
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:nameLabel];
    
    
    UILabel *stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 100 - WeiPerformCellMargin, WeiPerformCellMargin, 100, 20)];
    stateLabel.text = @"状态";
    stateLabel.textAlignment = NSTextAlignmentRight;
    stateLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:stateLabel];
    
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+WeiPerformCellMargin, CGRectGetMaxY(nameLabel.frame)+5, PHONE_UISCREEN_WIDTH - WeiPerformCellMargin - 40, 20)];
    timeLabel.text = @"2015-12-11 09:38:30";
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:timeLabel];
    
    CGFloat contentLabelW = PHONE_UISCREEN_WIDTH - WeiPerformCellMargin*2;
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(WeiPerformCellMargin, CGRectGetMaxY(photoImage.frame), contentLabelW, 40)];
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.numberOfLines = 0;
    contentLabel.text = @"与管理层开会讨论众荟CRM系统人员投入问题";
    contentLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:contentLabel];
    
    
    UILabel *TimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(WeiPerformCellMargin, CGRectGetMaxY(contentLabel.frame), contentLabelW, 20)];
    TimeLabel.font = [UIFont systemFontOfSize:14];
    TimeLabel.text = @"要求完成时间";
    [self addSubview:TimeLabel];
    
    
    NSArray *marktitleArr = @[@"取消",@"日志",@"转派",@"催办"];
    
    float _linewidth = [UIScreen mainScreen].bounds.size.width / 4;
    
    for (int i = 0; i < marktitleArr.count; i ++) {
        
        CALayer *shulayer = [[CALayer alloc] init];
        shulayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
        shulayer.frame = CGRectMake(_linewidth*i, WeiPerformCellHieght - 35, 0.5, 30);
        [self.layer addSublayer:shulayer];
        
        UIButton *markbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        [markbutton setTag:80+i];
//        [markbutton addTarget:self action:@selector(swithFenPeiTaskButton:) forControlEvents:UIControlEventTouchUpInside];
        markbutton.frame = CGRectMake(_linewidth*i, WeiPerformCellHieght-40, _linewidth, 40);
        markbutton.backgroundColor = [UIColor clearColor];
        markbutton.titleLabel.font = [UIFont systemFontOfSize:15];
        [markbutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [markbutton setTitle:[marktitleArr objectAtIndex:i] forState:UIControlStateNormal];
        [self addSubview:markbutton];
        
        if (i < 1) {
            CALayer *henglayer = [[CALayer alloc] init];
            henglayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
            henglayer.frame = CGRectMake(0, WeiPerformCellHieght- 35, PHONE_UISCREEN_WIDTH, 0.5);
            [self.layer addSublayer:henglayer];
        }
    }
}



@end
