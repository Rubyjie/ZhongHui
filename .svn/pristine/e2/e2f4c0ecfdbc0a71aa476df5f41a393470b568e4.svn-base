//
//  AssetsCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/19.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "AssetsCell.h"

static float AssetsCellHeight = 180;

@implementation AssetsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, AssetsCellHeight-10);
        [self.layer addSublayer:layer];
        
        [self initAssetsCell];
    }
    return self;
}

-(void)initAssetsCell
{
    CGFloat leftMangin = 5;
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftMangin, 0, PHONE_UISCREEN_WIDTH, 20)];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.textColor = [UIColor blackColor];
    [self addSubview:self.titleLabel];
    
    NSArray *titleArray = @[@"类型:",@"负责人:",@"维护厂家:",@"评价:",@"备注:"];
    
    for (int i = 0; i < titleArray.count; i++) {
        
        UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftMangin, 20+(15*i), 60, 15)];
        textLabel.textColor = [UIColor grayColor];
        textLabel.textAlignment = NSTextAlignmentLeft;
        textLabel.adjustsFontSizeToFitWidth = YES;
        textLabel.text = [titleArray objectAtIndex:i];
        textLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:textLabel];
        
        switch (i) {
            case 0:
                self.typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(textLabel.frame), 20+15*i, 100, 15)];
                self.typeLabel.font = [UIFont systemFontOfSize:14];
                self.typeLabel.textColor = [UIColor grayColor];
                [self addSubview:self.typeLabel];
                break;
                
            case 1:
                self.headLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(textLabel.frame), 20+15*i, 100, 15)];
                self.headLabel.font = [UIFont systemFontOfSize:14];
                self.headLabel.textColor = [UIColor grayColor];
                [self addSubview:self.headLabel];
                break;
                
            case 2:
                self.factoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(textLabel.frame), 20+15*i, 100, 15)];
                self.factoryLabel.font = [UIFont systemFontOfSize:14];
                self.factoryLabel.textColor = [UIColor grayColor];
                [self addSubview:self.factoryLabel];
                break;
            
            case 3:
                self.evaluationLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(textLabel.frame), 20+15*i, 100, 15)];
                self.evaluationLabel.font = [UIFont systemFontOfSize:14];
                self.evaluationLabel.textColor = [UIColor grayColor];
                [self addSubview:self.evaluationLabel];
                break;
            
            case 4:
                self.beiZhuLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(textLabel.frame), 20+15*i, PHONE_UISCREEN_WIDTH-70, 15)];
                self.beiZhuLabel.font = [UIFont systemFontOfSize:14];
                self.beiZhuLabel.textColor = [UIColor grayColor];
                [self addSubview:self.beiZhuLabel];
                break;

            default:
                break;
        }
        
    }

    // 状态
    self.statusLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 45, 20, 35, 15)];
    self.statusLabel.font = [UIFont systemFontOfSize:14];
    self.statusLabel.textColor = [UIColor whiteColor];
    self.statusLabel.adjustsFontSizeToFitWidth = YES;
    self.statusLabel.layer.cornerRadius = 5;
    self.statusLabel.textAlignment = NSTextAlignmentCenter;
    self.statusLabel.layer.masksToBounds = YES;
    self.statusLabel.backgroundColor = [UIColor redColor];
    [self addSubview:self.statusLabel];

    
    
    // 提醒图标
    UIImageView *calendarImage = [[UIImageView alloc]initWithFrame:CGRectMake(leftMangin, CGRectGetMaxY(self.beiZhuLabel.frame)+leftMangin, 18, 18)];
    calendarImage.image = [UIImage imageNamed:@"日程通知"];
    [self addSubview:calendarImage];
    
    self.startTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(calendarImage.frame), CGRectGetMaxY(self.beiZhuLabel.frame)+leftMangin, 80, 15)];
    self.startTimeLabel.font = [UIFont systemFontOfSize:14];
    self.startTimeLabel.textColor = [UIColor grayColor];
    [self addSubview:self.startTimeLabel];
    
    self.endTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.startTimeLabel.frame), CGRectGetMaxY(self.beiZhuLabel.frame)+leftMangin, 80, 15)];
    self.endTimeLabel.font = [UIFont systemFontOfSize:14];
    self.endTimeLabel.textColor = [UIColor grayColor];
    [self addSubview:self.endTimeLabel];

    UILabel *attLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftMangin, CGRectGetMaxY(self.endTimeLabel.frame)+leftMangin, 100, 15)];
    attLabel.text = @"规格属性:";
    attLabel.textColor = [UIColor grayColor];
    attLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:attLabel];
    
    self.attributeLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftMangin, CGRectGetMaxY(attLabel.frame), PHONE_UISCREEN_WIDTH, 30)];
    self.attributeLabel.font = [UIFont systemFontOfSize:14];
    self.attributeLabel.textColor = [UIColor grayColor];
    self.attributeLabel.numberOfLines = 0;
    self.attributeLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:self.attributeLabel];


}


@end
