//
//  ActionView.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/11.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "ActionView.h"

@interface ActionView ()
{
    UIView *_photoView;
    NSInteger stringcount;
}
@end

@implementation ActionView


- (id)initWithFrame:(CGRect)frame titleArr:(NSArray *)titlearray colorArr:(NSArray *)colorArray
{
    self = [super initWithFrame:frame];
    
    self.backgroundColor = [UIColor clearColor];
    
    if (self) {
        
        stringcount = titlearray.count;
        
        UIControl *_mycontro = [[UIControl alloc]initWithFrame:self.bounds];
        _mycontro.backgroundColor = COLOR_VAULE(0.0);
        _mycontro.alpha = 0.5;
        [_mycontro addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_mycontro];
        
        
        NSArray *_tarray = titlearray;//@[@"拍照",@"从手机相册选择",@"取消"];
        
        _photoView = [[UIView alloc]initWithFrame:CGRectMake(0, PHONE_UISCREEN_HEIGHT, PHONE_UISCREEN_WIDTH, titlearray.count*50+5)];
        [self addSubview:_photoView];
        
        for (int i = 0; i < titlearray.count; i ++) {
            UIButton *touchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [touchBtn setTag:(1000+i)];
            touchBtn.backgroundColor = COLOR_VAULE(255.0);
            [touchBtn setTitle:[_tarray objectAtIndex:i] forState:UIControlStateNormal];
            touchBtn.titleLabel.font = [UIFont systemFontOfSize:14];
            if (colorArray.count) {
                [touchBtn setTitleColor:[colorArray objectAtIndex:i] forState:UIControlStateNormal];
                
            }else{
                [touchBtn setTitleColor:COLOR_VAULE(0.0) forState:UIControlStateNormal];
                
            }
            [touchBtn addTarget:self action:@selector(selectBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
            
            if (i < titlearray.count-1) {
                touchBtn.frame = CGRectMake(0, 50*i, PHONE_UISCREEN_WIDTH, 50);
            }else{
                touchBtn.frame = CGRectMake(0, 50*i+5, PHONE_UISCREEN_WIDTH, 50);
                UIImageView *_lineview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 50, PHONE_UISCREEN_WIDTH, 0.5)];
                _lineview.backgroundColor = LINE_COLOR;
                [_photoView addSubview:_lineview];
            }
            
            [_photoView addSubview:touchBtn];
        }
    }
    
    return self;
}


- (void)showAlert{
    
    [UIView animateWithDuration:0.25 animations:^{
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        _photoView.frame = CGRectMake(0, PHONE_UISCREEN_HEIGHT-stringcount*50-5, PHONE_UISCREEN_WIDTH, stringcount*50+5);
        
    }];
    
}

- (void)Hidden
{
    [UIView animateWithDuration:0.25 animations:^{
        
        _photoView.frame = CGRectMake(0, PHONE_UISCREEN_HEIGHT , PHONE_UISCREEN_WIDTH, 0);
    }];
    [self performSelector:@selector(shouldHiden) withObject:nil afterDelay:0.25];
}


- (void)shouldHiden
{
    [self removeFromSuperview];
}

- (void)selectBtnPressed:(UIButton *)sender
{
    [self Hidden];
    
    [self.delegate selectWhichToPush:sender.tag];
    
    
}

- (void)backPressed
{
    [self Hidden];
}

@end
