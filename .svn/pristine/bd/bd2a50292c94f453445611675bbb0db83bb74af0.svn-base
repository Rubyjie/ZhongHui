//
//  CollectionView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CollectionView.h"

@interface CollectionView ()
@property (nonatomic, strong) CALayer *lineLayer;


@end

@implementation CollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor grayColor];
        
        NSArray *applicantArray = @[@"待收款",@"已收款"];
        
        CGFloat buttonW = PHONE_UISCREEN_WIDTH / 2;
        
        for (int i = 0; i < applicantArray.count; i++) {
            
            UIButton *applicantButton = [UIButton buttonWithType:UIButtonTypeCustom];
            applicantButton.frame = CGRectMake(buttonW * i , 0, buttonW, 40);
            [applicantButton addTarget:self action:@selector(ClcikCollectionTypeButton:) forControlEvents:UIControlEventTouchUpInside];
            applicantButton.tag = 90 + i;
            [applicantButton setTitle:[applicantArray objectAtIndex:i] forState:UIControlStateNormal];
            applicantButton.titleLabel.font = [UIFont systemFontOfSize:14];
            [self addSubview:applicantButton];
        }
        
        CALayer *linelayer = [[CALayer alloc] init];
        linelayer.frame = CGRectMake(0, 39, buttonW, 1);
        linelayer.backgroundColor = RGB(27, 195, 237).CGColor;
        [self.layer addSublayer:linelayer];
        self.lineLayer = linelayer;
    }
    return self;
}

#pragma mark - 90待收款  91已收款
-(void)ClcikCollectionTypeButton:(UIButton *)button
{
    CGFloat buttonW = PHONE_UISCREEN_WIDTH / 3;
    [UIView animateWithDuration:0.25 animations:^{
        
        self.lineLayer.frame = CGRectMake(buttonW *(button.tag - 90), 39.5, buttonW, 0.5);
    }];

    [self.delegate swithButtonQueryCollectionTypeWithTag:button.tag];
}


@end
