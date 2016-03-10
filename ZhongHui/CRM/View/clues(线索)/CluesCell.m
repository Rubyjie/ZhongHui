//
//  CluesCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CluesCell.h"

@implementation CluesCell

static float CluesCellHeight = 120;

static float CluesCellMargin = 10;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, PHONE_UISCREEN_WIDTH, CluesCellHeight-10);
        [self.layer addSublayer:layer];
        
        [self initCluesCell];
    }
    return self;
}

-(void)initCluesCell
{
    // 1.名称
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CluesCellMargin , CluesCellMargin, 120, 20)];
//    nameLabel.text = @"客户名称:";
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.font = [UIFont systemFontOfSize:14];
    self.customerName = nameLabel;
    [self addSubview:nameLabel];
    

    UILabel *stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 40 - CluesCellMargin, CluesCellMargin+5, 40, 20)];
    stateLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:14];;
//    [stateLabel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage resizeImageWithName:@"main_badge"]]];
    stateLabel.adjustsFontSizeToFitWidth = YES;
    stateLabel.backgroundColor = [UIColor redColor];
    stateLabel.layer.cornerRadius = 5;
    stateLabel.layer.masksToBounds = YES;
    stateLabel.textColor = [UIColor whiteColor];
    stateLabel.textAlignment = NSTextAlignmentCenter;
    self.stateLabel = stateLabel;
    [self addSubview:stateLabel];
    
    // 2.负责人
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(CluesCellMargin, CGRectGetMaxY(nameLabel.frame), 80, 20)];
    headerLabel.textAlignment = NSTextAlignmentLeft;
    headerLabel.adjustsFontSizeToFitWidth = YES;
    self.headName = headerLabel;
    headerLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:headerLabel];
    
    
    
    // 3.拜访次数
    UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(headerLabel.frame), CGRectGetMaxY(nameLabel.frame), 75, 20)];
    numberLabel.textAlignment = NSTextAlignmentLeft;
    self.visitNumber = numberLabel;
    numberLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:numberLabel];
    
    
//    UILabel *numberLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(numberLabel.frame), CGRectGetMaxY(headerLabel.frame), 75, 20)];
//    numberLabel2.font = [UIFont systemFontOfSize:14];
//    [self addSubview:numberLabel2];

    
    // 4.最近跟踪时间
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(numberLabel.frame), CGRectGetMaxY(nameLabel.frame), 100, 20)];
//    timeLabel.text = @"最近跟踪时间:";
    timeLabel.textAlignment = NSTextAlignmentLeft;
    self.genZongTime = timeLabel;
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:timeLabel];
    
//    UILabel *timeLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(timeLabel.frame)-16, CGRectGetMaxY(numberLabel.frame), 100, 20)];
//    timeLabel2.font = [UIFont systemFontOfSize:14];
//    [self addSubview:timeLabel2];
    

    NSArray *marktitleArr = @[@"联系人",@"拜访计划",@"拜访纪录",@"委托",@"关闭"];
    
    float _linewidth = PHONE_UISCREEN_WIDTH / 5;
    
    for (int i = 0; i < marktitleArr.count; i ++) {
        
        CALayer *shulayer = [[CALayer alloc] init];
        shulayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
        shulayer.frame = CGRectMake(_linewidth*i, CluesCellHeight - 35, 0.5, 30);
        [self.layer addSublayer:shulayer];
        
        UIButton *markbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        [markbutton setTag:520+i];
        //        [markbutton addTarget:self action:@selector(swithVisitPlanButton:) forControlEvents:UIControlEventTouchUpInside];
        markbutton.frame = CGRectMake(_linewidth*i, CluesCellHeight - 40, _linewidth, 40);
        [markbutton addTarget:self action:@selector(buttonClcik:) forControlEvents:UIControlEventTouchUpInside];
        markbutton.backgroundColor = [UIColor clearColor];
        markbutton.titleLabel.font = [UIFont systemFontOfSize:15];
        [markbutton setTitleColor:RGB(0, 195, 236) forState:UIControlStateNormal];
        [markbutton setTitle:[marktitleArr objectAtIndex:i] forState:UIControlStateNormal];
        [self addSubview:markbutton];
        
        if (i < 1) {
            CALayer *henglayer = [[CALayer alloc] init];
            henglayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
            henglayer.frame = CGRectMake(0, CluesCellHeight - 30 - 10, PHONE_UISCREEN_WIDTH, 0.5);
            [self.layer addSublayer:henglayer];
            
        }
    }


}

-(void)buttonClcik:(UIButton *)button
{
    [self.delegate swithButtonQueryCluesWithTag:button.tag cluesId:self.cluesId cusId:self.cusId cusName:self.cusName yeWuType:self.yeWuType clues:self.clues row:self.seleRow];
}

@end
