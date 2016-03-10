//
//  CollectQueryView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/23.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CollectQueryView.h"

@interface CollectQueryView ()<UITextFieldDelegate>

@end

@implementation CollectQueryView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        [self initCollectQueryView];
    }
    return self;
}

-(void)initCollectQueryView
{
    NSArray *buttonArray = @[@"合同名",@"客户",@"收款时间",@"合同编号"];
    
    for (int i = 0; i< buttonArray.count; i++) {
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 50*i, 50, 50)];
        titleLabel.textColor = [UIColor grayColor];
        titleLabel.text = [buttonArray objectAtIndex:i];
        titleLabel.adjustsFontSizeToFitWidth = YES;
        titleLabel.textAlignment = NSTextAlignmentRight;
        titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:titleLabel];
        
        CALayer *henglayer = [[CALayer alloc] init];
        henglayer.backgroundColor = RGB(0, 195, 236).CGColor;
        henglayer.frame = CGRectMake(0, 49.5*(i+1), PHONE_UISCREEN_WIDTH, 0.5);
        [self.layer addSublayer:henglayer];

        
        if (i == 0 || i == 1 || i == 2) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame)+20, 50*i, PHONE_UISCREEN_WIDTH-70, 50);
            [button setTitle:[buttonArray objectAtIndex:i] forState:UIControlStateNormal];
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [button setTitleColor:RGB(190,190,194) forState:UIControlStateNormal];
            [button setTitle:@"请选择" forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [self addSubview:button];

        }else {
        
            UITextField *textView = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame)+20, 50*i, PHONE_UISCREEN_WIDTH - 70, 50)];
            textView.font = [UIFont systemFontOfSize:14];
            textView.placeholder = @"请输入合同编号";
            textView.delegate = self;
            [self addSubview:textView];

        }
    }
    


    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(20, 50*4+20, PHONE_UISCREEN_WIDTH-40, 30);
    butt.backgroundColor = RGB(0, 195, 236);
    [butt setTitle:@"确定" forState:UIControlStateNormal];
    [self addSubview:butt];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
