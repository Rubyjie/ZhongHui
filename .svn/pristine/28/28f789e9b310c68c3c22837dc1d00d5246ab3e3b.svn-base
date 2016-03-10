//
//  AddressBookCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "AddressBookCell.h"

@implementation AddressBookCell

static float AddressBookCellMargin = 10;


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self initAddressBookCell];
        
    }
    return self;
}

-(void)initAddressBookCell
{
    // 头像
    UIImageView *IconImage = [[UIImageView alloc]initWithFrame:CGRectMake(AddressBookCellMargin, AddressBookCellMargin, 40, 40)];
    IconImage.image = [UIImage imageNamed:@"图层-6"];
    [self addSubview:IconImage];
    
    
    // 2.姓名
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(IconImage.frame) + 10, AddressBookCellMargin+5, 50, 15)];
    nameLabel.text = @"张三";
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.textColor = [UIColor blackColor];
    [self addSubview:nameLabel];
    
    // 3.职位
    UILabel *zhiWeiLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(IconImage.frame)+AddressBookCellMargin, CGRectGetMaxY(nameLabel.frame)+5, 60, 15)];
    zhiWeiLabel.text = @"技术总监";
    zhiWeiLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:zhiWeiLabel];

    
    // 4.部门
    UILabel *bumenLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(zhiWeiLabel.frame), CGRectGetMaxY(nameLabel.frame)+5, 100, 15)];
    bumenLabel.text = @"研发部";
    bumenLabel.textAlignment = NSTextAlignmentLeft;
    bumenLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:bumenLabel];
    
    // 5 电话
    UIImageView *phoneImage = [[UIImageView alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - AddressBookCellMargin - 40, 20, 18, 18)];
    phoneImage.image = [UIImage imageNamed:@"telephone"];
    [self addSubview:phoneImage];
}


@end
