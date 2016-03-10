//
//  EmployeesCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/6.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "EmployeesCell.h"

@interface EmployeesCell ()


@end

@implementation EmployeesCell

static float EmployeesCellHieght = 90;
static float EmployeesCellMairgin = 10;


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, EmployeesCellMairgin, PHONE_UISCREEN_WIDTH, EmployeesCellHieght-10);
        [self.layer addSublayer:layer];
        
        [self initEmployeesCell];
    }
    return self;
}


-(void)initEmployeesCell
{
    UILabel *empLabel = [[UILabel alloc]initWithFrame:CGRectMake(EmployeesCellMairgin, EmployeesCellMairgin*2, 40, 20)];
    empLabel.textColor = [UIColor blackColor];
    empLabel.text = @"员工:";
    empLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:empLabel];
    
    
    UILabel *empNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(empLabel.frame), EmployeesCellMairgin*2, PHONE_UISCREEN_WIDTH-50, 20)];
    empNameLabel.textColor = [UIColor blackColor];
    self.empLabel = empNameLabel;
    empNameLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:empNameLabel];


    UILabel *numLabel = [[UILabel alloc]initWithFrame:CGRectMake(EmployeesCellMairgin, CGRectGetMaxY(empLabel.frame), 40, 20)];
    numLabel.textColor = [UIColor grayColor];
    numLabel.text = @"工号:";
    numLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:numLabel];

    UILabel *numLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(numLabel.frame), CGRectGetMaxY(empLabel.frame), PHONE_UISCREEN_WIDTH-50, 20)];
    numLabel2.textColor = [UIColor grayColor];
    self.numLabel = numLabel2;
    numLabel2.font = [UIFont systemFontOfSize:14];
    [self addSubview:numLabel2];
    
    
    UILabel *zhiWeiLabel = [[UILabel alloc]initWithFrame:CGRectMake(EmployeesCellMairgin, CGRectGetMaxY(numLabel.frame), 40, 20)];
    zhiWeiLabel.textColor = [UIColor grayColor];
    zhiWeiLabel.font = [UIFont systemFontOfSize:14];
    zhiWeiLabel.text = @"职位:";
    [self addSubview:zhiWeiLabel];

    
    UILabel *zhiWeiLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(zhiWeiLabel.frame), CGRectGetMaxY(numLabel.frame), PHONE_UISCREEN_WIDTH-50, 20)];
    zhiWeiLabel2.textColor = [UIColor grayColor];
    self.zhiWeiLabel = zhiWeiLabel2;
    zhiWeiLabel2.font = [UIFont systemFontOfSize:14];
    [self addSubview:zhiWeiLabel2];
    
    
}

@end
