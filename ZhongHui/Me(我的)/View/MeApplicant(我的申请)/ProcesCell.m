//
//  ProcesCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//  处理中

#import "ProcesCell.h"

@implementation ProcesCell
static float  ProcesCellHeight = 120;
static float  ProcesCellMargin = 15;


#pragma mark -- 处理中
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, PHONE_UISCREEN_WIDTH, ProcesCellHeight - 10);
        [self.layer addSublayer:layer];
        
        // 初始化处理中cell
        [self initProcesCell];
    }
    return self;
}

-(void)initProcesCell
{
    // 1.标题
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(ProcesCellMargin, ProcesCellMargin, PHONE_UISCREEN_WIDTH-ProcesCellMargin*2-120, 20)];
    titleLabel.text = @"标题";
    titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:titleLabel];
    
    
    // 阶段
    UILabel *phaseLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH-ProcesCellMargin-40-40, ProcesCellMargin, 40, 20)];
    phaseLabel.text = @"阶段";
    phaseLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:phaseLabel];
    
    // 状态
    UILabel *stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH-ProcesCellMargin-40, ProcesCellMargin, 40, 20)];
    stateLabel.text = @"状态";
    stateLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:stateLabel];
    
    
    // 2.类型
    UILabel *typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(ProcesCellMargin, CGRectGetMaxY(titleLabel.frame), 40, 20)];
    typeLabel.text = @"类型";
    typeLabel.adjustsFontSizeToFitWidth = YES;
    typeLabel.textAlignment = NSTextAlignmentLeft;
    typeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:typeLabel];
    
    // 3.创建时间
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(typeLabel.frame)+5, CGRectGetMaxY(titleLabel.frame), 100, 20)];
    timeLabel.text = @"创建时间";
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:timeLabel];
    
    // 4.内容
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(ProcesCellMargin, CGRectGetMaxY(timeLabel.frame), PHONE_UISCREEN_WIDTH-ProcesCellMargin*2, 30)];
    contentLabel.numberOfLines = 0;
    contentLabel.adjustsFontSizeToFitWidth = YES;
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.text = @"这是内容测试可以放多少多么撒旦说色号的饭卡危机发生啊大哭武汉大雾客户";
    [self addSubview:contentLabel];
    
    
    NSArray *marktitleArr = @[@"催单",@"记录",@"结案",@"撤销"];
    
    float _linewidth = [UIScreen mainScreen].bounds.size.width / 4;
    
    for (int i = 0; i < marktitleArr.count; i ++) {
        
        CALayer *shulayer = [[CALayer alloc] init];
        shulayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
        shulayer.frame = CGRectMake(_linewidth*i, ProcesCellHeight- 30, 0.5, 30);
        [self.layer addSublayer:shulayer];
        
        UIButton *markbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        [markbutton setTag:1200+i];
        [markbutton addTarget:self action:@selector(swithProcesButton:) forControlEvents:UIControlEventTouchUpInside];
        markbutton.frame = CGRectMake(_linewidth*i, ProcesCellHeight -35, _linewidth, 40);
        markbutton.backgroundColor = [UIColor clearColor];
        markbutton.titleLabel.font = [UIFont systemFontOfSize:15];
        [markbutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [markbutton setTitle:[marktitleArr objectAtIndex:i] forState:UIControlStateNormal];
        [self addSubview:markbutton];
        
        if (i < 1) {
            CALayer *henglayer = [[CALayer alloc] init];
            henglayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
            henglayer.frame = CGRectMake(0, ProcesCellHeight- 30, PHONE_UISCREEN_WIDTH, 0.5);
            [self.layer addSublayer:henglayer];
        }
    }
    
    
}

-(void)swithProcesButton:(UIButton *)button
{
    NSLog(@"处理中");
    [self.delegate swithProcesCellButtonWithTag:button.tag];
}

@end
