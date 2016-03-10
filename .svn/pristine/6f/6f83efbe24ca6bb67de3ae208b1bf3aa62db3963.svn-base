//
//  WorkCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/19.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "WorkCell.h"

@implementation WorkCell

static float WorkCellHeight = 150;
static float WorkCellMagin = 10;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        
        layer.frame = CGRectMake(0, 10, PHONE_UISCREEN_WIDTH, WorkCellHeight-10);
        [self.layer addSublayer:layer];
        
        [self initYIDuMessageCell];
        
    }
    return self;
}

-(void)initYIDuMessageCell
{
    // 提醒内容
    CGFloat contentX = WorkCellMagin;
    CGFloat contentY = WorkCellMagin;
    CGFloat contentW = PHONE_UISCREEN_WIDTH - WorkCellMagin *2;
    UILabel *contentLabel = [[UILabel alloc]init];
    contentLabel.text = @"与管理层开会讨论众荟CRM系统人员投入问题，研究项目";
    contentLabel.font = [UIFont systemFontOfSize:14];
//    CGSize contentLabelSize = [contentLabel.text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(contentW, MAXFLOAT)];
    CGSize contentSixe = [contentLabel.text boundingRectWithSize:CGSizeMake(contentW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    contentLabel.numberOfLines = 0;
    contentLabel.adjustsFontSizeToFitWidth = YES;
    contentLabel.frame = (CGRect){{contentX, contentY}, contentSixe};
    [self addSubview:contentLabel];
    
    // 负责人
    UILabel *headName = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH-WorkCellMagin-70-60, CGRectGetMaxY(contentLabel.frame)+5, 60, 20)];
    headName.text = @"负责人";
    headName.font = [UIFont systemFontOfSize:14];
    [self addSubview:headName];

    
    // 提醒时间
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH-WorkCellMagin-70, CGRectGetMaxY(contentLabel.frame)+5, 70, 20)];
    timeLabel.text = @"2015-2-3";
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:timeLabel];
    
    
    // 相关客户
    UILabel *customerLabel = [[UILabel alloc]initWithFrame:CGRectMake(WorkCellMagin, CGRectGetMaxY(headName.frame)+5, 60, 20)];
    customerLabel.text = @"相关客户:";
    customerLabel.adjustsFontSizeToFitWidth = YES;
    customerLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:customerLabel];
    
    // 客户名称
    UILabel *customerName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(customerLabel.frame)+5, CGRectGetMaxY(headName.frame)+5, 100, 20)];
    customerName.text = @"上海优创";
    customerName.font = [UIFont systemFontOfSize:14];
    [self addSubview:customerName];
    
    
    
    // 相关联系人
    UILabel *contractLabel = [[UILabel alloc]initWithFrame:CGRectMake(WorkCellMagin, CGRectGetMaxY(customerName.frame), 60, 20)];
    contractLabel.text = @"相关联系人:";
    contractLabel.adjustsFontSizeToFitWidth = YES;
    contractLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:contractLabel];
    
    // 联系人名称
    UILabel *contractName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(contractLabel.frame)+5, CGRectGetMaxY(customerName.frame), 100, 20)];
    contractName.text = @"刘超";
    contractName.font = [UIFont systemFontOfSize:14];
    [self addSubview:contractName];
    
    
    NSArray *marktitleArr = @[@"拜访",@"邀请",@"提醒"];
    
    float _linewidth = PHONE_UISCREEN_WIDTH / 3;
    
    for (int i = 0; i < 3; i ++) {
        
        CALayer *shulayer = [[CALayer alloc] init];
        shulayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
        shulayer.frame = CGRectMake(_linewidth*i, WorkCellHeight - 35, 0.5, 30);
        [self.layer addSublayer:shulayer];
        
        UIButton *markbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        [markbutton setTag:500+i];
        [markbutton addTarget:self action:@selector(swithWorkButton:) forControlEvents:UIControlEventTouchUpInside];
        markbutton.frame = CGRectMake(_linewidth*i, WorkCellHeight - 40, _linewidth, 40);
        markbutton.backgroundColor = [UIColor clearColor];
        markbutton.titleLabel.font = [UIFont systemFontOfSize:15];
        [markbutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [markbutton setTitle:[marktitleArr objectAtIndex:i] forState:UIControlStateNormal];
        [self addSubview:markbutton];
        
        if (i < 1) {
            CALayer *henglayer = [[CALayer alloc] init];
            henglayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
            henglayer.frame = CGRectMake(0, WorkCellHeight - 30 - 5, PHONE_UISCREEN_WIDTH, 0.5);
            [self.layer addSublayer:henglayer];
            
        }
    }
}

#pragma  mark - 500拜访 501邀请 502提醒
-(void)swithWorkButton:(UIButton *)button
{
    [self.delegate swithButtonWithTag:button.tag];
}

@end
