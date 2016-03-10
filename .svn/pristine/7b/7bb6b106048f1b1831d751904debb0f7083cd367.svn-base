//
//  MessageView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/19.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "MessageView.h"

@interface MessageView ()

@property (nonatomic, strong) UIButton *firstButton;
@property (nonatomic, strong) UIButton *selectedButton;
@property (nonatomic, strong) CALayer *lineLayer;

@end

@implementation MessageView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        NSArray *messageArray = @[@"已读消息",@"待读消息"];
        
        CGFloat buttonW = PHONE_UISCREEN_WIDTH / 2;
        
        for (int i = 0; i < messageArray.count; i++) {
            
            UIButton *messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
            
            messageButton.frame = CGRectMake(buttonW * i , 0, buttonW, 40);
            
            [messageButton addTarget:self action:@selector(ClcikMessageButton:) forControlEvents:UIControlEventTouchUpInside];
            messageButton.titleLabel.font = [UIFont systemFontOfSize:14];
            [messageButton setTitleColor:RGB(0, 195, 236) forState:UIControlStateSelected];
            [messageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            messageButton.tag = 300 + i;
            if (messageButton.tag == 300) {
                
                messageButton.selected = YES;
                self.firstButton = messageButton;
            }
            
            [messageButton setTitle:[messageArray objectAtIndex:i] forState:UIControlStateNormal];
            self.backgroundColor = [UIColor grayColor];
            [self addSubview:messageButton];
        }
        
        CALayer *linelayer = [[CALayer alloc] init];
        linelayer.frame = CGRectMake(0, 39, buttonW, 1);
        linelayer.backgroundColor = RGB(27, 195, 237).CGColor;
        [self.layer addSublayer:linelayer];
        self.lineLayer = linelayer;
    }
    return self;
}

-(void)ClcikMessageButton:(UIButton*)button
{
    if (button.tag != 300) {
        
        self.firstButton.selected = NO;
    }
    
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
    float _btnwidth = PHONE_UISCREEN_WIDTH/2;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.lineLayer.frame = CGRectMake(_btnwidth*(button.tag-300), 39, _btnwidth, 1);
    }];
    
    [self.delegate swithButtonLookMessageStatusWithTag:button.tag];
}


@end
