//
//  ContractCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ContractCell.h"

@implementation ContractCell

static float ContractCellHeight = 120;

static float ContractCellMargin = 10;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, PHONE_UISCREEN_WIDTH, ContractCellHeight-10);
        [self.layer addSublayer:layer];
        
        [self initContractCell];
    }
    return self;
}



-(void)initContractCell
{
    // 姓名
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"姓名:";
    nameLabel.textColor = [UIColor blackColor];
//    UIFont *fnt = [UIFont fontWithName:@"HelveticaNeue" size:16.0f];
    nameLabel.font = [UIFont systemFontOfSize:16];
    // 根据字体得到NSString的尺寸
//    CGSize size = [nameLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt,NSFontAttributeName, nil]];
    nameLabel.frame = CGRectMake(ContractCellMargin, ContractCellMargin, 150, 20);
    self.nameLabel = nameLabel;
    [self addSubview:nameLabel];
    
    // 部门
    UILabel *departmentLabel = [[UILabel alloc]init];
    departmentLabel.text = @"部门";
    departmentLabel.textAlignment = NSTextAlignmentLeft;
    departmentLabel.textColor = [UIColor blackColor];
    departmentLabel.frame = CGRectMake(CGRectGetMaxX(nameLabel.frame), ContractCellMargin, 80, 20);
    departmentLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:departmentLabel];
    self.buMenLabel = departmentLabel;


    
    // 职位
    UILabel *positionLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(departmentLabel.frame), ContractCellMargin, 100, 20)];
    positionLabel.textColor = [UIColor blackColor];
    positionLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:positionLabel];
    self.zhiWeiLabel = positionLabel;
    
   // 角色关系
    UILabel *roleLabel = [[UILabel alloc]initWithFrame:CGRectMake(ContractCellMargin, CGRectGetMaxY(positionLabel.frame), 50, 20)];
    roleLabel.text = @"暂无/";
    roleLabel.textColor = [UIColor blackColor];

    roleLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:roleLabel];
    self.roleLabel = roleLabel;

    
    
    // 紧密程度
    UILabel *closelyLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(roleLabel.frame), CGRectGetMaxY(positionLabel.frame), 65, 20)];
    closelyLabel.text = @"暂无";
    closelyLabel.textColor = [UIColor blackColor];
    closelyLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:closelyLabel];
    self.closelyLabel = closelyLabel;


    // 客户名称
    UILabel *customerLabel = [[UILabel alloc]initWithFrame:CGRectMake(ContractCellMargin, CGRectGetMaxY(closelyLabel.frame), PHONE_UISCREEN_WIDTH-ContractCellMargin*2, 20)];
    customerLabel.text = @"客户名称:";
    customerLabel.textColor = [UIColor blackColor];

    customerLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:customerLabel];
    self.customerLabel = customerLabel;


    // 电话按钮
    UIButton *phoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    phoneButton.frame = CGRectMake(PHONE_UISCREEN_WIDTH-ContractCellMargin-40, ContractCellMargin, 40, 60);
    [phoneButton setImage:[UIImage imageNamed:@"Shape-76"] forState:UIControlStateNormal];
    phoneButton.tag = 55;
    [phoneButton addTarget:self action:@selector(swithContractButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:phoneButton];

    NSArray *marktitleArr = @[@"拜访计划",@"联络结果",@"修改"];
    
    float _linewidth = PHONE_UISCREEN_WIDTH / marktitleArr.count;
    
    for (int i = 0; i < marktitleArr.count; i ++) {
        
        CALayer *shulayer = [[CALayer alloc] init];
        shulayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
        shulayer.frame = CGRectMake(_linewidth*i, ContractCellHeight- 33, 0.5, 30);
        [self.layer addSublayer:shulayer];
        
        UIButton *markbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        [markbutton setTag:20+i];
        [markbutton addTarget:self action:@selector(swithContractButton:) forControlEvents:UIControlEventTouchUpInside];
        markbutton.frame = CGRectMake(_linewidth*i, ContractCellHeight - 40, _linewidth, 40);
        
        markbutton.backgroundColor = [UIColor clearColor];
        markbutton.titleLabel.font = [UIFont systemFontOfSize:15];
        [markbutton setTitleColor:RGB(0, 195, 236) forState:UIControlStateNormal];
        [markbutton setTitle:[marktitleArr objectAtIndex:i] forState:UIControlStateNormal];
        [self addSubview:markbutton];
        
        if (i < 1) {
            CALayer *henglayer = [[CALayer alloc] init];
            henglayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
            henglayer.frame = CGRectMake(0, ContractCellHeight - 30 - 5, PHONE_UISCREEN_WIDTH, 0.5);
            [self.layer addSublayer:henglayer];
        }
    }
}


-(void)swithContractButton:(UIButton *)button
{
    [self.delegate ContractButtonAddVisitAndResultsWithTag:button.tag contractId:self.contractId row:self.selectRow];
}




@end
