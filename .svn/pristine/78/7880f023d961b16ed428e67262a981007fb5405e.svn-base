//
//  CluesXQCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/25.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CluesXQCell.h"

@implementation CluesXQCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        
        [self initCluesDeailsCell];
    }
    return self;
}

-(void)initCluesDeailsCell
{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 60, 40)];
    titleLabel.textColor = [UIColor grayColor];
    titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel = titleLabel;
    [self addSubview:titleLabel];
    
    UILabel *contLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame)+10, 10, PHONE_UISCREEN_WIDTH - 80, 40)];
    contLabel.font = [UIFont systemFontOfSize:14];
    contLabel.numberOfLines = 0;
    contLabel.adjustsFontSizeToFitWidth = YES;
    self.contenLabel = contLabel;
    [self addSubview:contLabel];
}
@end
