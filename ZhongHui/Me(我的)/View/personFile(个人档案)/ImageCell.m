//
//  ImageCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/23.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ImageCell.h"

@implementation ImageCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        // 初始化头像cell
        [self initProsonImageCell];
    }
    return self;
}

-(void)initProsonImageCell
{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 60, 40)];
    titleLabel.textAlignment = NSTextAlignmentRight;
    titleLabel.font = [UIFont systemFontOfSize:14];
    self.touXiang = titleLabel;
    [self addSubview:titleLabel];
    
    self.photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH-70, 10, 40, 40)];
    [self addSubview:self.photoImage];

    
}

@end
