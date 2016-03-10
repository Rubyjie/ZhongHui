//
//  CollectionCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CollectionCell.h"

@implementation CollectionCell

static float  CollectionCellHeight = 120;
static float  CollectionCellMargin = 15;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, PHONE_UISCREEN_WIDTH, CollectionCellHeight - 10);
        [self.layer addSublayer:layer];
        
        // 初始化待收款cell
        [self initCollectionCell];
    }
    return self;
}


-(void)initCollectionCell
{
    // 1.合同名称
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CollectionCellMargin, CollectionCellMargin, 100, 20)];
    nameLabel.text = @"合同名称";
    nameLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:nameLabel];
    
    // 2.合同编号
    UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame), CollectionCellMargin, 40, 20)];
    numberLabel.text = @"合同编号";
    numberLabel.adjustsFontSizeToFitWidth = YES;
    numberLabel.textAlignment = NSTextAlignmentLeft;
    numberLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:numberLabel];
    
    
    // 3.收款类型
    UILabel *typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CollectionCellMargin, CGRectGetMaxY(nameLabel.frame), 60, 20)];
    typeLabel.text = @"收款类型";
    typeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:typeLabel];
    
    // 4.收款金额
    UILabel *moneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(typeLabel.frame), CGRectGetMaxY(nameLabel.frame), 60, 20)];
    moneyLabel.text = @"收款金额";
    moneyLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:moneyLabel];

    // 5.计划收款时间
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(moneyLabel.frame), CGRectGetMaxY(nameLabel.frame), 100, 20)];
    timeLabel.text = @"计划收款时间";
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:timeLabel];
    
    // 6.相关客户
    UILabel *customerLabel = [[UILabel alloc]initWithFrame:CGRectMake(CollectionCellMargin, CGRectGetMaxY(typeLabel.frame), 65, 20)];
    customerLabel.text = @"相关客户:";
    customerLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:customerLabel];
    
    UILabel *customerName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(customerLabel.frame), CGRectGetMaxY(typeLabel.frame),100, 20)];
    customerName.text = @"客户名称";
    customerName.font = [UIFont systemFontOfSize:14];
    [self addSubview:customerName];


    NSArray *marktitleArr = @[@"申请发票",@"变更"];
    
    float _linewidth = PHONE_UISCREEN_WIDTH / 2;
    
    for (int i = 0; i < 2; i ++) {
        
        CALayer *shulayer = [[CALayer alloc] init];
        shulayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
        shulayer.frame = CGRectMake(_linewidth*i, CollectionCellHeight - 35, 0.5, 30);
        [self.layer addSublayer:shulayer];
        
        UIButton *markbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        [markbutton setTag:80+i];
        [markbutton addTarget:self action:@selector(swithCollectionButton:) forControlEvents:UIControlEventTouchUpInside];
        markbutton.frame = CGRectMake(_linewidth*i, CollectionCellHeight - 40, _linewidth, 40);
        markbutton.backgroundColor = [UIColor clearColor];
        markbutton.titleLabel.font = [UIFont systemFontOfSize:15];
        [markbutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [markbutton setTitle:[marktitleArr objectAtIndex:i] forState:UIControlStateNormal];
        [self addSubview:markbutton];
        
        if (i < 1) {
            CALayer *henglayer = [[CALayer alloc] init];
            henglayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
            henglayer.frame = CGRectMake(0, CollectionCellHeight - 35, PHONE_UISCREEN_WIDTH, 0.5);
            [self.layer addSublayer:henglayer];
        }
    }

}


-(void)swithCollectionButton:(UIButton*)button
{
    [self.delegate selectedButtonWithTag:button.tag];
}

@end
