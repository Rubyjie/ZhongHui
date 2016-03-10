//
//  MeCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/16.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "MeCell.h"

@implementation MeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.IconImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 16, 18, 18)];
        [self.contentView addSubview:self.IconImage];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.IconImage.frame)+10, 5, 80, 40)];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
    }
    return self;
}

@end
