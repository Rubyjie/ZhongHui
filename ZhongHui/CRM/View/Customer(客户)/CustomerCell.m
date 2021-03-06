//
//  CustomerCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CustomerCell.h"

@implementation CustomerCell

static float CustomerCellHeight = 130;

static float CustomerCellMargin = 10;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, PHONE_UISCREEN_WIDTH, CustomerCellHeight-10);
        [self.layer addSublayer:layer];
        
        [self initCustomerCell];
    }
    return self;
}

-(void)initCustomerCell
{
    // 1.名称
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CustomerCellMargin, CustomerCellMargin, PHONE_UISCREEN_WIDTH-CustomerCellMargin*2, 20)];
    nameLabel.text = @"客户名称:";
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont systemFontOfSize:14];
    self.nameLabel = nameLabel;
    [self addSubview:nameLabel];
    
    // 2.编号
    UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(CustomerCellMargin, CGRectGetMaxY(nameLabel.frame), 70, 20)];
    numberLabel.text = @"客户编号:";
    numberLabel.adjustsFontSizeToFitWidth = YES;
    numberLabel.textColor = [UIColor blackColor];
    numberLabel.textAlignment = NSTextAlignmentLeft;
    numberLabel.font = [UIFont systemFontOfSize:14];
    self.numberLabel = numberLabel;
    [self addSubview:numberLabel];

    
    // 3.客户状态
    UILabel *statusLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH-50, CGRectGetMaxY(nameLabel.frame), 30, 20)];
    statusLabel.backgroundColor = [UIColor redColor];
    statusLabel.textColor = [UIColor whiteColor];

    statusLabel.layer.cornerRadius = 5;
    statusLabel.layer.masksToBounds = YES;
    statusLabel.adjustsFontSizeToFitWidth = YES;
    statusLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:14];;
    self.stateLabel = statusLabel;
    [self addSubview:statusLabel];

    


     // 5.星级
    UILabel *starLevelLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(numberLabel.frame), CGRectGetMaxY(nameLabel.frame), 30, 20)];
    starLevelLabel.textColor = [UIColor blackColor];
    starLevelLabel.font = [UIFont systemFontOfSize:14];
    self.levelLabel = starLevelLabel;
    [self addSubview:starLevelLabel];

    // 6.类型
    UILabel *typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(starLevelLabel.frame), CGRectGetMaxY(nameLabel.frame), 70, 20)];
    typeLabel.font = [UIFont systemFontOfSize:14];
    typeLabel.text = @"客户类型:";
    typeLabel.textColor = [UIColor blackColor];
    self.typeLabel = typeLabel;
    [self addSubview:typeLabel];
    
    
    // 7.备注
    UILabel *beiZhuLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(typeLabel.frame), PHONE_UISCREEN_WIDTH-20, 30)];
    beiZhuLabel.textColor = [UIColor blackColor];
//    beiZhuLabel.adjustsFontSizeToFitWidth = YES;
    beiZhuLabel.numberOfLines = 0;
    beiZhuLabel.font = [UIFont systemFontOfSize:14];
    self.beiZhuLabel = beiZhuLabel;
    [self addSubview:beiZhuLabel];
    

    NSArray *marktitleArr = @[@"联系人",@"联络方式",@"新增线索"];
    
    float _linewidth = PHONE_UISCREEN_WIDTH / 3;
    
    for (int i = 0; i < marktitleArr.count; i ++) {
        
        CALayer *shulayer = [[CALayer alloc] init];
        shulayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
        shulayer.frame = CGRectMake(_linewidth*i, CustomerCellHeight - 35, 0.5, 30);
        [self.layer addSublayer:shulayer];
        UIButton *markbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        [markbutton setTag:700+i];
        [markbutton addTarget:self action:@selector(swithCustomerContrctButton:) forControlEvents:UIControlEventTouchUpInside];
        markbutton.frame = CGRectMake(_linewidth*i, CustomerCellHeight - 40, _linewidth, 40);
        markbutton.backgroundColor = [UIColor clearColor];
        markbutton.titleLabel.font = [UIFont systemFontOfSize:15];
        [markbutton setTitleColor:RGB(0, 195, 236) forState:UIControlStateNormal];
        [markbutton setTitle:[marktitleArr objectAtIndex:i] forState:UIControlStateNormal];
        [self addSubview:markbutton];
        
        if (i < 1) {
            CALayer *henglayer = [[CALayer alloc] init];
            henglayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
            henglayer.frame = CGRectMake(0, CustomerCellHeight - 30 - 10, PHONE_UISCREEN_WIDTH, 0.5);
            [self.layer addSublayer:henglayer];
            
        }
    }
}

-(void)swithCustomerContrctButton:(UIButton *)button
{
    
    [self.delegate swithButtonQueryContractAndContractWayAddCluesButtonWithTag:button.tag customerId:self.customerId row:self.seleRow];
}

@end
