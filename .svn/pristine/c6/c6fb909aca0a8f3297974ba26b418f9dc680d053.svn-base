//
//  LevelCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/19.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "LevelCell.h"


static float LevelCellHeight = 70;

@implementation LevelCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, LevelCellHeight-10);
        [self.layer addSublayer:layer];

        
        [self initLevelCell];
    }
    return self;
}

-(void)initLevelCell
{
    
    CGFloat labelMangin = 5;
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelMangin, 0, PHONE_UISCREEN_WIDTH, 20)];
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.nameLabel];
    
    self.cluesLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelMangin, CGRectGetMaxY(self.nameLabel.frame), PHONE_UISCREEN_WIDTH, 15)];
    self.cluesLabel.textColor = [UIColor grayColor];
    self.cluesLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.cluesLabel];
    
    self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelMangin, CGRectGetMaxY(self.cluesLabel.frame), PHONE_UISCREEN_WIDTH, 15)];
    self.timeLabel.textColor = [UIColor grayColor];
    self.timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.timeLabel];

}

@end
