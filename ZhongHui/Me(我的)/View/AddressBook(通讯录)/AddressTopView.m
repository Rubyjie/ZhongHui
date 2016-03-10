//
//  AddressTopView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "AddressTopView.h"

@interface AddressTopView ()
@property (nonatomic, strong) CALayer *lineLayer;


@end

@implementation AddressTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor grayColor];
        
        NSArray *AddressArray = @[@"同事",@"部门区域",@"高级搜索"];
        
        CGFloat buttonW = PHONE_UISCREEN_WIDTH / 3;
        
        for (int i = 0; i < AddressArray.count; i++) {
            
//            [UIButton appearance].titleLabel.font = [UIFont systemFontOfSize:14];
            
            UIButton *addressButton = [UIButton buttonWithType:UIButtonTypeCustom];
            
            addressButton.frame = CGRectMake(buttonW * i , 0, buttonW, 40);
            
            [addressButton addTarget:self action:@selector(ClcikAddressButton:) forControlEvents:UIControlEventTouchUpInside];
            
            addressButton.titleLabel.font = [UIFont systemFontOfSize:14];
            
            addressButton.tag = 700 + i;
            
            [addressButton setTitle:[AddressArray objectAtIndex:i] forState:UIControlStateNormal];
            
            [self addSubview:addressButton];
        }
        
        CALayer *linelayer = [[CALayer alloc] init];
        linelayer.frame = CGRectMake(0, 39, buttonW, 1);
        linelayer.backgroundColor = RGB(27, 195, 237).CGColor;
        [self.layer addSublayer:linelayer];
        self.lineLayer = linelayer;
        
    }
    return self;
}

-(void)ClcikAddressButton:(UIButton *)button
{
    
    float _btnwidth = PHONE_UISCREEN_WIDTH/3;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.lineLayer.frame = CGRectMake(_btnwidth*(button.tag-700), 39, _btnwidth, 1);
    }];

    [self.delegate swithButtonQueryContractWithTag:button.tag];
}


@end
