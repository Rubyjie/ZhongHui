//
//  PlanDeailsCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/22.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "PlanDeailsCell.h"

@implementation PlanDeailsCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self initPlanDeailsCell];
    }
    return self;
}

-(void)initPlanDeailsCell
{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 60, 50)];
    titleLabel.textColor = [UIColor grayColor];
    titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel = titleLabel;
    [self addSubview:titleLabel];
    

    
    
    // 内容
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame)+10, 0, PHONE_UISCREEN_WIDTH-80, 50)];
    contentLabel.font = [UIFont systemFontOfSize:15];
    contentLabel.textColor = [UIColor blackColor];
    contentLabel.numberOfLines = 0;
    contentLabel.adjustsFontSizeToFitWidth = YES;
    self.contentLabel = contentLabel;
    [self addSubview:contentLabel];
    
    CALayer *henglayer = [[CALayer alloc] init];
    henglayer.backgroundColor = RGB(0, 195, 236).CGColor;
    henglayer.frame = CGRectMake(0, 49.5, PHONE_UISCREEN_WIDTH, 0.5);
    [self.layer addSublayer:henglayer];
}
@end
