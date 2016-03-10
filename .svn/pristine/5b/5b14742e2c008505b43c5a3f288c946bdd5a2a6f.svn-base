//
//  MattersCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/19.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "MattersCell.h"

static float MattersCellHeight = 70;

@implementation MattersCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, MattersCellHeight-10);
        [self.layer addSublayer:layer];
        
        [self initMattersCell];
    }
    return self;
}

-(void)initMattersCell
{
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, PHONE_UISCREEN_WIDTH, 30)];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.textColor = [UIColor blackColor];
    [self addSubview:self.titleLabel];
    
    self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.titleLabel.frame), PHONE_UISCREEN_WIDTH, 30)];
    self.contentLabel.font = [UIFont systemFontOfSize:14];
    self.contentLabel.textColor = [UIColor grayColor];
    [self addSubview:self.contentLabel];

}

@end
