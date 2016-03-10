//
//  AliasCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/19.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "AliasCell.h"

@implementation AliasCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self initAilsaCell];
    }
    return self;
}

-(void)initAilsaCell
{
    
    CGFloat labelW = PHONE_UISCREEN_WIDTH / 4;
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, labelW, 50)];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    self.nameLabel.textColor = [UIColor grayColor];
    [self addSubview:self.nameLabel];
    
    
    self.typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelW, 0, labelW, 50)];
    self.typeLabel.textAlignment = NSTextAlignmentCenter;
    self.typeLabel.font = [UIFont systemFontOfSize:14];
    self.typeLabel.textColor = [UIColor grayColor];
    [self addSubview:self.typeLabel];
    
    
    self.startTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelW*2, 0, labelW, 50)];
    self.startTimeLabel.textAlignment = NSTextAlignmentCenter;
    self.startTimeLabel.font = [UIFont systemFontOfSize:14];
    self.startTimeLabel.textColor = [UIColor grayColor];
    [self addSubview:self.startTimeLabel];
    
    
    self.endTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelW*3, 0, labelW, 50)];
    self.endTimeLabel.textAlignment = NSTextAlignmentCenter;
    self.endTimeLabel.font = [UIFont systemFontOfSize:14];
    self.endTimeLabel.textColor = [UIColor grayColor];
    [self addSubview:self.endTimeLabel];
}

@end
