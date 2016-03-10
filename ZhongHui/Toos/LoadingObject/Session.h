//
//  Session.h
//
//  Created by Apple on 15/9/14.
//  Copyright (c) 2015年 . All rights reserved.
//

//LoadingView用例
/*
 [[Session sharedSession] setLoadRect:CGRectMake(0, 64, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-128)];
 [[Session sharedSession].loadView StartLoading];
 */

#import <Foundation/Foundation.h>
#import "LoadingView.h"
#import "TipView.h"
#import "CommonUtils.h"


@interface Session : NSObject

{
    //负责人的id
    NSMutableArray *_headIdArray;
    //负责人
    NSMutableArray *_headNameArray;
    
    // 省
    NSMutableArray *_provinceNameArray;
    NSMutableArray *_provinceIdArray;
    
    // 市
    NSMutableArray *_cityNameArray;
    NSMutableArray *_cityIdArray;
    
    // 区
    NSMutableArray *_areaNameArray;
    NSMutableArray *_areaIdArray;
    
}

@property (nonatomic, assign) CGRect loadRect;
@property (nonatomic, strong) LoadingView *loadView;
@property (nonatomic, strong) TipView *tpView;


//负责人的id
@property(nonatomic,strong)NSMutableArray *headIdArray;

//负责人
@property(nonatomic,strong)NSMutableArray *headNameArray;


@property(nonatomic,strong)NSMutableArray *provinceNameArray;
@property(nonatomic,strong)NSMutableArray *provinceIdArray;

@property(nonatomic,strong)NSMutableArray *cityNameArray;
@property(nonatomic,strong)NSMutableArray *cityIdArray;


@property(nonatomic,strong)NSMutableArray *areaNameArray;
@property(nonatomic,strong)NSMutableArray *areaIdArray;

+ (instancetype)sharedSession;


//检查用户是否已经登陆
- (BOOL)checkUserLoginStatus;
- (void)saveLoginKey;
- (void)cleanForLogout;


#pragma mark - 图片如果是歪的调这个方法
- (UIImage *)fixOrientation:(UIImage *)aImage;


@end
