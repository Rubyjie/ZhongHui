//
//  ApplyView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ApplyView.h"

@implementation ApplyView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 初始化申请发票view
        [self initApplyView];
    }
    return self;
}

-(void)initApplyView
{
    CGFloat ApplyViewMargin = 10;
    NSArray *titleArray = @[@"合同",@"合同编号",@"发票类型",@"抬头",@"开票内容",@"开票金额",@"说明"];
    for (int i = 0; i < titleArray.count; i++) {
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(ApplyViewMargin, (60*i), 100, 20)];
        titleLabel.text = [titleArray objectAtIndex:i];
        titleLabel.textColor = RGB(0, 195, 236);
        [self addSubview:titleLabel];
        
    
        CALayer *henglayer = [[CALayer alloc] init];
        henglayer.backgroundColor = RGB(0, 195, 236).CGColor;
        henglayer.frame = CGRectMake(0, 59.5*(i+1), PHONE_UISCREEN_WIDTH, 0.5);
        [self.layer addSublayer:henglayer];
        
        if (i == 0 || i == 1 || i == 2 || i == 4) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(ApplyViewMargin, 20+(60*i), PHONE_UISCREEN_WIDTH, 40);
            [button setTitle:@"请选择" forState:UIControlStateNormal];
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [self addSubview:button];
            
        }else if (i == 3 || i == 5 || i == 6){
        
            UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(ApplyViewMargin,  20+(60*i), PHONE_UISCREEN_WIDTH, 40)];
            textField.placeholder = @"请输入内容";
            [self addSubview:textField];

        }
        
    }
    
    NSArray *buttonArray = @[@"变更",@"取消"];
    
    CGFloat buttonWidth = (PHONE_UISCREEN_WIDTH-20-20-20)/2;
    
    for (int i = 0; i< buttonArray.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:[buttonArray objectAtIndex:i] forState:UIControlStateNormal];
        button.frame = CGRectMake(20+(buttonWidth+20)*i, 450, buttonWidth, 30);
        button.backgroundColor = RGB(0, 195, 236);
        [self addSubview:button];
        
    }
    
}
@end
