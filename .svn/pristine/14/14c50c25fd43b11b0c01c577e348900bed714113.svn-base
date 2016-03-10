//
//  SearchView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView

static float leftMargin = 10;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initSearchView];
    }
    return self;
}

-(void)initSearchView
{

    
    NSArray *textArray = @[@"部门",@"工号",@"职位"];
    
    for (int i = 0; i < textArray.count; i++) {
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftMargin, 50*i, 30, 50)];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.text = [textArray objectAtIndex:i];
        [self addSubview:titleLabel];
        
        
        UITextField *contentText = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame)+leftMargin, 50*i, PHONE_UISCREEN_WIDTH - 50, 50)];
        contentText.placeholder = @"请输入内容";
        contentText.font = [UIFont systemFontOfSize:14];
        contentText.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self addSubview:contentText];
        
        CALayer *linelayer = [[CALayer alloc] init];
        linelayer.frame = CGRectMake(0, 49.5*(i+1), PHONE_UISCREEN_WIDTH, 0.5);
        linelayer.backgroundColor = [UIColor grayColor].CGColor;
        [self.layer addSublayer:linelayer];
        
    }

    UIButton *queryButton = [UIButton buttonWithType:UIButtonTypeCustom];
    queryButton.frame = CGRectMake(leftMargin, 150+20, PHONE_UISCREEN_WIDTH - leftMargin * 2, 30);
    queryButton.backgroundColor = RGB(27, 195, 237);
    [queryButton setTitle:@"查询" forState:UIControlStateNormal];
    [self addSubview:queryButton];

}

@end
