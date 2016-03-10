//
//  LoadingView.m
//  西医综合真题
//
//  Created by Apple on 15/9/18.
//  Copyright (c) 2015年 医教园. All rights reserved.
//

#import "LoadingView.h"

@implementation LoadingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.5;
        
        [self addSubview:self.hupProgressView];
    }
    
    return self;
}

- (HUProgressView *)hupProgressView
{
    if (!_hupProgressView) {
        _hupProgressView = [[HUProgressView alloc] initWithProgressIndicatorStyle:HUProgressIndicatorStyleLarge];
        _hupProgressView.center = CGPointMake(80/2, 80/2);
    }
    return _hupProgressView;
    
}

#pragma mark 开始loading
- (void)StartLoading
{
    [self.hupProgressView startProgressAnimating];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

#pragma mark 停止loading
- (void)StopLoading
{
    [self.hupProgressView stopProgressAnimating];
    [self removeFromSuperview];
}


@end
