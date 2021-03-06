//
//  CustomerDeailsCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/24.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CustomerDeailsCell.h"

@implementation CustomerDeailsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
    
        [self initCustomerDeailsCell];
    }
    return self;
}

-(void)initCustomerDeailsCell
{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 80, 50)];
    titleLabel.textColor = [UIColor grayColor];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.adjustsFontSizeToFitWidth = YES;
    self.titleLabel = titleLabel;
    [self addSubview:titleLabel];
    
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame)+20, 0, PHONE_UISCREEN_WIDTH - 110, 50)];
    contentLabel.textColor = [UIColor grayColor];
//    contentLabel.adjustsFontSizeToFitWidth = YES;
    contentLabel.numberOfLines = 0;
    contentLabel.font = [UIFont systemFontOfSize:14];
    self.ctentLabel = contentLabel;
    [self addSubview:contentLabel];

}

@end
