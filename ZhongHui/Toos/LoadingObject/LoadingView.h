//
//  LoadingView.h
//  西医综合真题
//
//  Created by Apple on 15/9/18.
//  Copyright (c) 2015年 医教园. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HUProgressView.h"

@interface LoadingView : UIView
{
    HUProgressView *_hupProgressView;  //loading view
}

@property (nonatomic, strong) HUProgressView *hupProgressView;

- (void)StartLoading;
- (void)StopLoading;

@end
