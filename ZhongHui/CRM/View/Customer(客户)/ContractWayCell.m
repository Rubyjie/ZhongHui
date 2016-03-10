//
//  ContractWayCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/24.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ContractWayCell.h"

@implementation ContractWayCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        // 初始化联系方式cell
        [self initContractWayCell];
    }
    return self;
}


-(void)initContractWayCell
{
    UIImageView *ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 15, 15)];
    self.iconImage = ImageView;
    [self addSubview:ImageView];
    
    // 内容
    UILabel *deailsLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(ImageView.frame)+10, 10, PHONE_UISCREEN_WIDTH-15-20-40, 20)];
    deailsLabel.font = [UIFont systemFontOfSize:14];
    self.contentLabel = deailsLabel;
    [self addSubview:deailsLabel];
    
    // 状态
    UILabel *statusLabel = [[UILabel alloc]initWithFrame:CGRectMake( PHONE_UISCREEN_WIDTH-40-10, 10, 30, 20)];
    statusLabel.font = [UIFont systemFontOfSize:14];
    statusLabel.textAlignment = NSTextAlignmentCenter;
    statusLabel.layer.cornerRadius = 5;
    statusLabel.layer.masksToBounds = YES;
    statusLabel.textColor = [UIColor whiteColor];
    statusLabel.backgroundColor = [UIColor redColor];
    self.statusLabel = statusLabel;
    [self addSubview:statusLabel];

    
    
    // 备注
    UILabel *beiZhuLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(deailsLabel.frame)+10, PHONE_UISCREEN_WIDTH - 20, 30)];
    beiZhuLabel.font = [UIFont systemFontOfSize:14];
    beiZhuLabel.numberOfLines = 0;
    beiZhuLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:beiZhuLabel];
    self.beiZhuLabel = beiZhuLabel;
    
    CALayer *henglayer = [[CALayer alloc] init];
    henglayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
    henglayer.frame = CGRectMake(0, CGRectGetMaxY(beiZhuLabel.frame)-0.5, PHONE_UISCREEN_WIDTH, 0.5);
    [self.layer addSublayer:henglayer];
    
    
}


@end
