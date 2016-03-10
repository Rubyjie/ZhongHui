//
//  WorkTiXingCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "WorkTiXingCell.h"

@implementation WorkTiXingCell

static float WorkTiXingCellHeight = 120;
static float WorkTiXingCellMagin = 10;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        
        layer.frame = CGRectMake(0, 10, PHONE_UISCREEN_WIDTH, WorkTiXingCellHeight -10);
        [self.layer addSublayer:layer];
        
        [self initWorkTiXingCell];
        
    }
    return self;
}

-(void)initWorkTiXingCell
{
    // 提醒时间
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(WorkTiXingCellMagin, WorkTiXingCellMagin, 120, 20)];
    timeLabel.text = @"2015-2-3";
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:timeLabel];
    
    
    // 相关事项
    UILabel *mattersLabel = [[UILabel alloc]initWithFrame:CGRectMake(WorkTiXingCellMagin, CGRectGetMaxY(timeLabel.frame)+5, 60, 20)];
    mattersLabel.text = @"相关事项:";
    mattersLabel.adjustsFontSizeToFitWidth = YES;
    mattersLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:mattersLabel];
    
    // 事项内容
    UILabel *mattersContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(mattersLabel.frame)+5,  CGRectGetMaxY(timeLabel.frame)+5, PHONE_UISCREEN_WIDTH-WorkTiXingCellMagin*2-60, 20)];
    mattersContent.text = @"24号客户演示抓紧时间";
    mattersContent.font = [UIFont systemFontOfSize:14];
    [self addSubview:mattersContent];
    
    
    
    // 事项对象
    UILabel *EventObject = [[UILabel alloc]initWithFrame:CGRectMake(WorkTiXingCellMagin, CGRectGetMaxY(mattersLabel.frame), 60, 20)];
    EventObject.text = @"事项对象:";
    EventObject.adjustsFontSizeToFitWidth = YES;
    EventObject.font = [UIFont systemFontOfSize:14];
    [self addSubview:EventObject];
    
    // 拜访计划主题
    UILabel *visitTheme = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(EventObject.frame)+5, CGRectGetMaxY(mattersLabel.frame), PHONE_UISCREEN_WIDTH-WorkTiXingCellMagin*2-60, 20)];
    visitTheme.text = @"北京女色看贾夫纳市";
    visitTheme.font = [UIFont systemFontOfSize:14];
    [self addSubview:visitTheme];

    
    NSArray *marktitleArr = @[@"完成",@"延迟",@"取消"];
    
    float _linewidth = PHONE_UISCREEN_WIDTH / 3;
    
    for (int i = 0; i < 3; i ++) {
        
        CALayer *shulayer = [[CALayer alloc] init];
        shulayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
        shulayer.frame = CGRectMake(_linewidth*i, WorkTiXingCellHeight - 35, 0.5, 30);
        [self.layer addSublayer:shulayer];
        
        UIButton *markbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [markbutton setTag:1000+i];
        
//        [markbutton addTarget:self action:@selector(swithWorkTiXingButton:) forControlEvents:UIControlEventTouchUpInside];
        markbutton.frame = CGRectMake(_linewidth*i, WorkTiXingCellHeight - 40, _linewidth, 40);
        markbutton.backgroundColor = [UIColor clearColor];
        markbutton.titleLabel.font = [UIFont systemFontOfSize:15];
        [markbutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [markbutton setTitle:[marktitleArr objectAtIndex:i] forState:UIControlStateNormal];
        [self addSubview:markbutton];
        
        if (i < 1) {
            CALayer *henglayer = [[CALayer alloc] init];
            henglayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
            henglayer.frame = CGRectMake(0, WorkTiXingCellHeight - 30 - 5, PHONE_UISCREEN_WIDTH, 0.5);
            [self.layer addSublayer:henglayer];
            
        }
    }

}

@end
