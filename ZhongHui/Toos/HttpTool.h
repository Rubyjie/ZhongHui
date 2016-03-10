//
//  HttpTool.h
//  ZhongHui
//
//  Created by 刘彦超 on 16/3/4.
//  Copyright © 2016年 com.shanghaiyouchaung. All rights reserved.
//  封装AFN的get\post请求

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject




#pragma mark - 封装的post请求
+(void)postWithUrl:(NSString *)url
            params:(NSDictionary *)params
           success:(void(^)(id json))success
           failure:(void(^)(NSError *error))failure;


#pragma mark - 封装的post请求(上传文件数据的post) fromData（文件参数）
+(void)postWithUrl:(NSString *)url
            params:(NSDictionary *)params
            fromDataArray:(NSArray *)fromDataArray
           success:(void(^)(id json))success
           failure:(void(^)(NSError *error))failure;


#pragma mark - 封装的get请求
+(void)getWithUrl:(NSString *)url
            params:(NSDictionary *)params
           success:(void(^)(id json))success
           failure:(void(^)(NSError *error))failure;


#pragma mark - 封装的delete请求
+(void)deleteWithUrl:(NSString *)url
           params:(NSDictionary *)params
          success:(void(^)(id json))success
          failure:(void(^)(NSError *error))failure;


#pragma mark - 封装的put请求
+(void)putWithUrl:(NSString *)url
              params:(NSDictionary *)params
             success:(void(^)(id json))success
             failure:(void(^)(NSError *error))failure;

@end


#pragma mark - 由于这个数据模型只为HttpTool类服务，所以把他剪刀httpTool里了，少了个文件
@interface FromData : NSObject

#pragma mark - 传文件用到的数据fromData
// 文件数据
@property (nonatomic, strong)NSData *data;

// 参数名
@property (nonatomic, copy)NSString *name;

// 文件名
@property (nonatomic, copy)NSString *filename;

// 文件类型
@property (nonatomic, copy)NSString *mimeType;

@end
