//
//  ConWayCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/19.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "ConWayCell.h"

@implementation ConWayCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self initConWayCell];
    }
    return self;
}

-(void)initConWayCell
{
    
    CGFloat labelW = PHONE_UISCREEN_WIDTH / 3;
    self.typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, labelW, 50)];
    self.typeLabel.textAlignment = NSTextAlignmentCenter;
    self.typeLabel.font = [UIFont systemFontOfSize:14];
    self.typeLabel.textColor = [UIColor grayColor];
    [self addSubview:self.typeLabel];
    
    
    self.categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelW, 0, labelW, 50)];
    self.categoryLabel.textAlignment = NSTextAlignmentCenter;
    self.categoryLabel.font = [UIFont systemFontOfSize:14];
    self.categoryLabel.textColor = [UIColor grayColor];
    [self addSubview:self.categoryLabel];
    
    
    self.phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelW*2, 0, labelW, 50)];
    self.phoneLabel.textAlignment = NSTextAlignmentCenter;
    self.phoneLabel.font = [UIFont systemFontOfSize:14];
    self.phoneLabel.textColor = [UIColor grayColor];
    [self addSubview:self.phoneLabel];
}


@end
