//
//  ContractResultCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/23.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ContractResultCell.h"

@interface ContractResultCell ()

@property (nonatomic, strong) CALayer *backLayer;


@end

@implementation ContractResultCell

 float ContractResultCellHeight = 0;
 float ContractResultCellMargin = 10;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self initContractResultCell];
        
    }
    return self;
}

-(void)initContractResultCell
{
    self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:layer];
    self.backLayer = layer;
    
    
    
    // 头像
    UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(ContractResultCellMargin, ContractResultCellMargin, 40, 40)];
    photoImage.image = [UIImage imageNamed:@"Man"];
    [self addSubview:photoImage];
    
    // 联络人
    UILabel *nameLabel = [[UILabel alloc]init];/*WithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+ContractResultCellMargin, ContractResultCellMargin, 100, 20)];*/
    nameLabel.tag = 10;
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:nameLabel];
    
    
    // 提醒图标
    UIImageView *calendarImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame), CGRectGetMaxY(photoImage.frame)-20, 18, 18)];
    calendarImage.image = [UIImage imageNamed:@"日程通知"];
    [self addSubview:calendarImage];
    
    // 时间
    UILabel *timeLabel = [[UILabel alloc]init];
    timeLabel.font = [UIFont systemFontOfSize:14];
    timeLabel.tag = 11;
    [self addSubview:timeLabel];
    
    
    // 联络结果
    UILabel *resultLabel = [[UILabel alloc]init];
    resultLabel.font = [UIFont systemFontOfSize:14];
    resultLabel.adjustsFontSizeToFitWidth = YES;
    resultLabel.tag = 12;
    [self addSubview:resultLabel];

 
    
    // 原因
    UILabel *yuanYinLabel = [[UILabel alloc]init];
    yuanYinLabel.font = [UIFont systemFontOfSize:14];
    yuanYinLabel.tag = 13;
    [self addSubview:yuanYinLabel];

    // 说明
    UILabel *shuoMing = [[UILabel alloc]init];
    shuoMing.font = [UIFont systemFontOfSize:14];
    shuoMing.tag = 14;
    shuoMing.numberOfLines = 0;
    [self addSubview:shuoMing];

    
}

- (void)setConName:(NSString *)conName contractTime:(NSString *)contractTime contractResult:(NSString *)contractResult yuanYin:(NSString *)yuanYin shuoMing:(NSString *)shuoMing
{
    
    //姓名
    CGSize conNameSize = [CommonUtils sizeWithContentString:conName size:CGSizeMake(150, 100) lineSpace:0 font:[UIFont systemFontOfSize:14]];
    self.contractName = (UILabel *)[self viewWithTag:10];
    self.contractName.frame = CGRectMake(55, ContractResultCellMargin, conNameSize.width, conNameSize.height);
    self.contractName.text = conName;
    
    //时间
    CGSize timeSize = [CommonUtils sizeWithContentString:contractTime size:CGSizeMake(300, 100) lineSpace:0 font:[UIFont systemFontOfSize:14]];
    self.contractTime = (UILabel *)[self viewWithTag:11];
    self.contractTime.frame = CGRectMake(70, CGRectGetMaxY(self.contractName.frame)+5, timeSize.width, timeSize.height);
    self.contractTime.adjustsFontSizeToFitWidth = YES;
    self.contractTime.text = contractTime;


    //结果
    CGSize resultSize = [CommonUtils sizeWithContentString:contractResult size:CGSizeMake(200, 200) lineSpace:0 font:[UIFont systemFontOfSize:14]];
    self.contractResult = (UILabel *)[self viewWithTag:12];
    self.contractResult.frame = CGRectMake(ContractResultCellMargin, CGRectGetMaxY(self.contractTime.frame)+ContractResultCellMargin, resultSize.width, resultSize.height);
    self.contractResult.text = contractResult;
    
    // 原因
    CGSize yuanYinSize = [CommonUtils sizeWithContentString:yuanYin size:CGSizeMake(200, 200) lineSpace:0 font:[UIFont systemFontOfSize:14]];
    self.yuanYinLabel = (UILabel *)[self viewWithTag:13];
    self.yuanYinLabel.frame = CGRectMake(CGRectGetMaxX(self.contractResult.frame)+ContractResultCellMargin, CGRectGetMaxY(self.contractTime.frame)+ContractResultCellMargin, yuanYinSize.width, yuanYinSize.height);
    self.yuanYinLabel.text = yuanYin;
    
    // 说明
    CGSize shuoMIngSize = [CommonUtils sizeWithContentString:shuoMing size:CGSizeMake(PHONE_UISCREEN_WIDTH-20, 200) lineSpace:0 font:[UIFont systemFontOfSize:14]];
    self.shuoMingLabel = (UILabel *)[self viewWithTag:14];
    self.shuoMingLabel.frame = CGRectMake(ContractResultCellMargin, CGRectGetMaxY(self.contractResult.frame)+ContractResultCellMargin, shuoMIngSize.width, shuoMIngSize.height);
    self.shuoMingLabel.text = shuoMing;
    
    self.backLayer.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, CGRectGetMaxY(self.shuoMingLabel.frame));
    
}



+ (CGFloat)getCellheightWithConName:(NSString *)conName conTime:(NSString *)conTime conRsult:(NSString *)conResult yuanYin:(NSString*)yuanYin shuoMing:(NSString *)shuoMing
{
    
    ContractResultCellHeight = 0;
    
#pragma mark - size计算的时候也要考虑间距
    CGSize conSize = [CommonUtils sizeWithContentString:conName size:CGSizeMake(150, 100) lineSpace:0 font:[UIFont systemFontOfSize:14]];
    
    CGSize timeSize = [CommonUtils sizeWithContentString:conTime size:CGSizeMake(300, 100) lineSpace:0 font:[UIFont systemFontOfSize:14]];
    
    CGSize resultSize = [CommonUtils sizeWithContentString:conResult size:CGSizeMake(200, CGFLOAT_MAX) lineSpace:0 font:[UIFont systemFontOfSize:14]];

    
//    CGSize yuanYinsize = [CommonUtils sizeWithContentString:yuanYin size:CGSizeMake(200, CGFLOAT_MAX) lineSpace:0 font:[UIFont systemFontOfSize:14]];
    
    CGSize shuoMingSize = [CommonUtils sizeWithContentString:shuoMing size:CGSizeMake(PHONE_UISCREEN_WIDTH-20, 100) lineSpace:0 font:[UIFont systemFontOfSize:14]];
    
    ContractResultCellHeight = conSize.height + timeSize.height  + resultSize.height + shuoMingSize.height;
    
    return ContractResultCellHeight + 40;
}




@end
