//
//  VisitCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "VisitCell.h"

@implementation VisitCell

static float visitCellMagin = 10;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        // 初始化拜访cell
        [self initVisitCells];
    }
    return self;
}

-(void)initVisitCells
{

    UILabel *visitlabel = [[UILabel alloc]initWithFrame:CGRectMake(visitCellMagin, 0, 100, 50)];
    
    visitlabel.textColor = [UIColor grayColor];
    
    visitlabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:visitlabel];
    self.visitLabel = visitlabel;
    
    
    UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(visitlabel.frame) + 20, 0, PHONE_UISCREEN_WIDTH-visitCellMagin*2-60, 50)];
    textfield.placeholder = @"请填写";
    textfield.font = [UIFont systemFontOfSize:14];
    [self addSubview:textfield];
    
}

@end
