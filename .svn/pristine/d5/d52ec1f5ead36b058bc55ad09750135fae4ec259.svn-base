//
//  ApproverView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/18.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ApproverView.h"


@interface ApproverView ()

@property (nonatomic, strong) UIButton *firstButton;
@property (nonatomic, strong) UIButton *selectedButton;
@property (nonatomic, strong) CALayer *lineLayer;


@end
@implementation ApproverView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor grayColor];
        
        NSArray *approverArray = @[@"待批复",@"已批复"];
        
        CGFloat buttonW = PHONE_UISCREEN_WIDTH / 2;
        
        for (int i = 0; i < approverArray.count; i++) {
            
            UIButton *approverButton = [UIButton buttonWithType:UIButtonTypeCustom];
            
            approverButton.frame = CGRectMake(buttonW * i , 0, buttonW, 40);
            approverButton.titleLabel.font = [UIFont systemFontOfSize:14];
            [approverButton setTitleColor:RGB(0, 195, 236) forState:UIControlStateSelected];
            
            [approverButton addTarget:self action:@selector(ClcikApproverButton:) forControlEvents:UIControlEventTouchUpInside];
            
            approverButton.tag = 200 + i;
            
            if (approverButton.tag == 200) {
                
                approverButton.selected = YES;
                self.firstButton = approverButton;
            }
            
            [approverButton setTitle:[approverArray objectAtIndex:i] forState:UIControlStateNormal];
            
            [self addSubview:approverButton];
        }
        
        CALayer *linelayer = [[CALayer alloc] init];
        linelayer.frame = CGRectMake(0, 39, buttonW, 1);
        linelayer.backgroundColor = RGB(27, 195, 237).CGColor;
        [self.layer addSublayer:linelayer];
        self.lineLayer = linelayer;

    }
    return self;
}

-(void)ClcikApproverButton:(UIButton*)button
{
    
    if (button.tag != 200) {
        
        self.firstButton.selected = NO;
    }
    
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
    float _btnwidth = PHONE_UISCREEN_WIDTH/2;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.lineLayer.frame = CGRectMake(_btnwidth*(button.tag-200), 39, _btnwidth, 1);
    }];
    
    [self.delegate swithButtonLookApproverStatusWithTag:button.tag];
}

@end
