//
//  ProrsonFileCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/23.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ProrsonFileCell.h"

@implementation ProrsonFileCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        // 初始化个人档案cell
        [self initProsonFileCell];
    }
    return self;
}

-(void)initProsonFileCell
{
//    [UILabel appearance].font = [UIFont systemFontOfSize:14];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 60, 40)];
    titleLabel.textAlignment = NSTextAlignmentRight;
    titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel = titleLabel;
    [self addSubview:titleLabel];
    
    
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH-200-40, 10, 200, 40)];
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.textAlignment = NSTextAlignmentRight;
    contentLabel.numberOfLines = 0;
    contentLabel.adjustsFontSizeToFitWidth = YES;
    self.contentLabel = contentLabel;
    [self addSubview:contentLabel];
}

@end
