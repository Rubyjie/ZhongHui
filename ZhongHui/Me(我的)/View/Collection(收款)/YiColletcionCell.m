//
//  YiColletcionCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "YiColletcionCell.h"

@implementation YiColletcionCell

static float  YiCollectionCellHeight = 100;
static float  YiCollectionCellMargin = 15;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, PHONE_UISCREEN_WIDTH, YiCollectionCellHeight - 10);
        [self.layer addSublayer:layer];
        
        // 初始化已收款cell
        [self initYiCollectionCell];
    }
    return self;
}

-(void)initYiCollectionCell
{
    // 1.合同名称
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(YiCollectionCellMargin, YiCollectionCellMargin, 100, 20)];
    nameLabel.text = @"合同名称";
    nameLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:nameLabel];
    
    // 2.合同编号
    UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame), YiCollectionCellMargin, 40, 20)];
    numberLabel.text = @"合同编号";
    numberLabel.adjustsFontSizeToFitWidth = YES;
    numberLabel.textAlignment = NSTextAlignmentLeft;
    numberLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:numberLabel];
    
    
    // 3.收款类型
    UILabel *typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(YiCollectionCellMargin, CGRectGetMaxY(nameLabel.frame), 60, 20)];
    typeLabel.text = @"收款类型";
    typeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:typeLabel];
    
    // 4.开票金额
    UILabel *moneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(typeLabel.frame), CGRectGetMaxY(nameLabel.frame), 60, 20)];
    moneyLabel.text = @"开票金额";
    moneyLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:moneyLabel];
    
    // 5.开票时间
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(moneyLabel.frame), CGRectGetMaxY(nameLabel.frame), 100, 20)];
    timeLabel.text = @"开票时间";
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:timeLabel];
    
    // 收款金额
    UILabel *collectionLabel = [[UILabel alloc]initWithFrame:CGRectMake(YiCollectionCellMargin, CGRectGetMaxY(timeLabel.frame), 65, 20)];
    collectionLabel.text = @"收款金额";
    collectionLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:collectionLabel];
    
    // 收款时间
    UILabel *collectionTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(collectionLabel.frame), CGRectGetMaxY(timeLabel.frame), 100, 20)];
    collectionTimeLabel.text = @"收款时间";
    collectionTimeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:collectionTimeLabel];
    
    
    // 6.相关客户
    UILabel *customerLabel = [[UILabel alloc]initWithFrame:CGRectMake(YiCollectionCellMargin, CGRectGetMaxY(collectionLabel.frame), 65, 20)];
    customerLabel.text = @"相关客户:";
    customerLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:customerLabel];
    
    UILabel *customerName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(customerLabel.frame), CGRectGetMaxY(collectionLabel.frame),100, 20)];
    customerName.text = @"客户名称";
    customerName.font = [UIFont systemFontOfSize:14];
    [self addSubview:customerName];
    
}

@end
