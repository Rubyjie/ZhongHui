//
//  ContractDeailsCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/25.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ContractDeailsCell.h"

@implementation ContractDeailsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self initContractDeailsCell];
    }
    return self;
}

-(void)initContractDeailsCell
{
    UILabel *firstLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 40)];
    firstLabel.textColor = [UIColor grayColor];
    firstLabel.font = [UIFont systemFontOfSize:14];
    self.firstLabel = firstLabel;
    [self addSubview:firstLabel];
    
    UILabel *secondLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(firstLabel.frame)+20, 10, PHONE_UISCREEN_WIDTH-130, 40)];
    secondLabel.textColor = [UIColor grayColor];
    self.secondLabel = secondLabel;
    secondLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:secondLabel];
    
    // 电话按钮
    UIButton *phoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    phoneButton.frame = CGRectMake(PHONE_UISCREEN_WIDTH-40, 0, 40, 60);
    [phoneButton setImage:[UIImage imageNamed:@"Shape-76"] forState:UIControlStateNormal];
    //        [phoneButton addTarget:self action:@selector(swithContractButton:) forControlEvents:UIControlEventTouchUpInside];
    phoneButton.hidden = YES;
    self.phoneButton = phoneButton;
    [self addSubview:phoneButton];

}

@end
