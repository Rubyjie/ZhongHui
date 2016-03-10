//
//  Session.m
//
//  Created by Apple on 15/9/14.
//  Copyright (c) 2015年 . All rights reserved.
//

#import "Session.h"
#import "UserDefault.h"
#import "CommonUtils.h"

@implementation Session
@synthesize loadRect = _loadRect;
@synthesize tpView = _tpView;

#pragma mark init
+ (instancetype)sharedSession {
    static Session *sessionInstance = nil;
    static dispatch_once_t predict;
    dispatch_once(&predict, ^ {
        if (sessionInstance == nil) {
            sessionInstance = [[Session alloc] init];
        }
    });
    return sessionInstance;
}

- (instancetype)init {
    if (self = [super init]) {

    }
    return self;
}


- (LoadingView *)loadView
{
    if (!_loadView) {
        _loadView = [[LoadingView alloc]initWithFrame:CGRectMake((PHONE_UISCREEN_WIDTH-80)/2, (PHONE_UISCREEN_HEIGHT-80)/2, 80, 80)];
        _loadView.layer.cornerRadius = 8.0;
        
        _loadView.layer.masksToBounds = YES;
    }
    
    return _loadView;
}

-(TipView *)tpView
{
    if (!_tpView) {
        _tpView = [[TipView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    }
    return _tpView;
}



#pragma mark setter getter

#pragma mark tools
- (BOOL)checkUserLoginStatus {
    BOOL status = NO;
    NSString *loginToken = [UserDefault getDataObjectForKey:ISLOGIN_KEY];
    if ([CommonUtils objectIsValid:loginToken]) {
        status = YES;
    }
    return status;
}



#pragma mark 登录成功后保存值
- (void)saveLoginKey
{
    [UserDefault setDataObject:@"1" forKey:ISLOGIN_KEY];
}

#pragma makr logout 退出登录的时候调用
- (void)cleanForLogout {
    //clean token
    [UserDefault removeDataObjectForKey:ISLOGIN_KEY];
}

-(void)setHeadIdArray:(NSMutableArray *)headIdArray
{
    
    _headIdArray = headIdArray;
}

-(NSMutableArray*)headIdArray
{
    if (!_headIdArray) {
        _headIdArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _headIdArray;
}


-(void)setHeadNameArray:(NSMutableArray *)headNameArray
{
    
    _headNameArray = headNameArray;
}

-(NSMutableArray*)headNameArray
{
    if (!_headNameArray) {
        _headNameArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _headNameArray;
}

-(void)setProvinceNameArray:(NSMutableArray *)provinceNameArray
{
    _provinceNameArray = provinceNameArray;
}

-(NSMutableArray *)provinceNameArray
{
    if (!_provinceNameArray) {
        
        _provinceNameArray = [NSMutableArray array];
    }
    return _provinceNameArray;
}

-(void)setProvinceIdArray:(NSMutableArray *)provinceIdArray
{
    _provinceIdArray = provinceIdArray;
}

-(NSMutableArray *)provinceIdArray
{
    if (!_provinceIdArray) {
        
        _provinceIdArray = [NSMutableArray array];
    }
    return _provinceIdArray;
}

-(void)setCityNameArray:(NSMutableArray *)cityNameArray
{
    _cityNameArray = cityNameArray;
}

-(NSMutableArray *)cityNameArray
{
    if (!_cityNameArray) {
        
        _cityNameArray = [NSMutableArray array];
    }
    return _cityNameArray;
}


-(void)setCityIdArray:(NSMutableArray *)cityIdArray
{
    _cityIdArray = cityIdArray;
}

-(NSMutableArray *)cityIdArray
{
    if (!_cityIdArray) {
        
        _cityIdArray = [NSMutableArray array];
    }
    return _cityIdArray;
}


-(void)setAreaNameArray:(NSMutableArray *)areaNameArray
{
    _areaNameArray = areaNameArray;
}

-(NSMutableArray *)areaNameArray
{
    if (!_areaNameArray) {
        
        _areaNameArray = [NSMutableArray array];
    }
    return _areaNameArray;
}

-(void)setAreaIdArray:(NSMutableArray *)areaIdArray
{
    _areaIdArray = areaIdArray;
}

-(NSMutableArray *)areaIdArray
{
    if (!_areaIdArray) {
        
        _areaIdArray = [NSMutableArray array];
    }
    return _areaIdArray;
}

- (UIImage *)fixOrientation:(UIImage *)aImage {
    
    // No-op if the orientation is already correct
    if (aImage.imageOrientation == UIImageOrientationUp)
        return aImage;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, aImage.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, aImage.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (aImage.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, aImage.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, aImage.size.width, aImage.size.height,
                                             CGImageGetBitsPerComponent(aImage.CGImage), 0,
                                             CGImageGetColorSpace(aImage.CGImage),
                                             CGImageGetBitmapInfo(aImage.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (aImage.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.height,aImage.size.width), aImage.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,aImage.size.width,aImage.size.height), aImage.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}








@end

