//
//  CRMView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/15.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CRMView.h"
#import "ZHButton.h"

@interface CRMView ()
#define YCBarButtonImageRatio 0.6


@end

@implementation CRMView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        UIImageView *headView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, PHONE_UISCREEN_WIDTH - 20, 130)];
        headView.image = [UIImage imageNamed:@"bg"];
        [self addSubview:headView];
        
        UIImageView *yuanImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 30, 70, 70)];
        yuanImage.image = [UIImage imageNamed:@"椭圆-1"];
        [headView addSubview:yuanImage];
        
        UILabel *firstLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 50, 20)];
        firstLabel.text = @"本月完成";
        firstLabel.font = [UIFont systemFontOfSize:10];
        firstLabel.textColor = [UIColor grayColor];
        [yuanImage addSubview:firstLabel];
        
        UILabel *secodeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(firstLabel.frame), 50, 20)];
        secodeLabel.text = @"100%";
        secodeLabel.font = [UIFont boldSystemFontOfSize:18];
        secodeLabel.textColor = [UIColor whiteColor];
        [yuanImage addSubview:secodeLabel];

        NSArray *colorArray = @[RGB(55, 129, 188),[UIColor orangeColor],[UIColor redColor]];
        NSArray *textArray = @[@"本月成交",@"本月目标",@"本月回款"];
        for (int i = 0; i < textArray.count; i++) {
            
            UILabel *wanCheng = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH-120, 10+(40*i), 40, 15)];
            wanCheng.text = [textArray objectAtIndex:i];
            wanCheng.textColor =[UIColor whiteColor];
            wanCheng.font = [UIFont systemFontOfSize:9];
            [headView addSubview:wanCheng];
            
            
            UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH-120, 15+(40*i), 120, 40)];
            numberLabel.textAlignment = NSTextAlignmentLeft;
            numberLabel.text = @"35000";
            numberLabel.textColor = [colorArray objectAtIndex:i];
            numberLabel.font = [UIFont boldSystemFontOfSize:16];
            [headView addSubview:numberLabel];
        }
       
        
        
        [self setupCRMViews];
    }
    return self;
}

-(void)setupCRMViews
{
    
    NSArray *titleArray = @[@"拜访计划",@"客户",@"联系人",@"线索",@"机会",@"合同",@"产品",@"竞争对手",@"销售报告"];
    
    NSArray *ImageArray =  @[@"拜访计划",@"客户",@"联系人",@"线索",@"机会",@"合同",@"产品",@"竞争对手",@"销售报告"];

    for (int i = 0; i < titleArray.count; i++) {
        
        CGFloat buttHeight = (PHONE_UISCREEN_HEIGHT - 64 - 49 - 150 - 20) / 3;
        CGFloat buttWidth  = (PHONE_UISCREEN_WIDTH - 20) / 3;
        
        ZHButton *button = [ZHButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10+buttWidth * ( i % 3),  150 + buttHeight * (i / 3), buttWidth, buttHeight);
        [button setImage:[UIImage imageNamed:[ImageArray objectAtIndex:i]] forState:UIControlStateNormal];
        
        [button setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(ClcikButtonJumpCRMViewController:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 200 + i;
        button.backgroundColor = [UIColor whiteColor];

        //点击按钮会发光
        button.showsTouchWhenHighlighted = YES;
        [self addSubview:button];
        
        UIImageView *lineImage = [[UIImageView alloc]initWithFrame:CGRectMake(10,   149.5+(buttHeight*(i%5)), PHONE_UISCREEN_WIDTH - 20, 0.5)];
        lineImage.backgroundColor = [UIColor grayColor];
        [self addSubview:lineImage];
        
        UIImageView *shuLine = [[UIImageView alloc]initWithFrame:CGRectMake(10+buttWidth*(i%5) - 0.5, 150, 0.5, buttHeight*3)];
        shuLine.backgroundColor = [UIColor grayColor];
        [self addSubview:shuLine];
        
    }
}

-(void)ClcikButtonJumpCRMViewController:(UIButton *)button
{
    [self.delegate clcikCrmButtonWithTag:button.tag];
}


#pragma mark - 设置button内部的图片的frame 需要继承UIButton
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * YCBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
    
}

#pragma mark - 设置button内部的文字的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    // 高度从图片的高度开始
    CGFloat titleY = contentRect.size.height *YCBarButtonImageRatio;
    // 文字的宽度就是button的宽度
    CGFloat titleW = contentRect.size.width;
    // 文字的高度就是button的高度减掉文字的Y
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}


@end
