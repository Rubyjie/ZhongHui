//
//  HttpTool.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/3/4.
//  Copyright © 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"

@implementation HttpTool


+(void)postWithUrl:(NSString *)url
            params:(NSDictionary *)params
           success:(void(^)(id json))success
           failure:(void(^)(NSError *error))failure
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // 2.发送请求
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
#pragma mark - block 回调的写法
        if (success) {
            
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            
            failure(error);
        }
    }];
}


#pragma mark - 封装的post请求(上传文件数据的post) fromData（文件参数）
+(void)postWithUrl:(NSString *)url
            params:(NSDictionary *)params
          fromDataArray:(NSArray *)fromDataArray
           success:(void(^)(id json))success
           failure:(void(^)(NSError *error))failure
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    // 2.发送请求
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> totlaformData) {
        
        for (FromData *fromData in fromDataArray) {
            
            [totlaformData appendPartWithFileData:fromData.data name:fromData.name fileName:fromData.filename mimeType:fromData.mimeType];
        }
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (success) {
            
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            
            failure(error);
        }
        
    }];
}



+(void)getWithUrl:(NSString *)url
           params:(NSDictionary *)params
          success:(void(^)(id json))success
          failure:(void(^)(NSError *error))failure
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // 2.发送请求
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
#pragma mark - block 回调的写法
        if (success) {
            
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            
            failure(error);
        }
    }];

}


+(void)deleteWithUrl:(NSString *)url
              params:(NSDictionary *)params
             success:(void(^)(id json))success
             failure:(void(^)(NSError *error))failure
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // 2.发送请求
    [manager DELETE:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
#pragma mark - block 回调的写法
        if (success) {
            
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            
            failure(error);
        }
    }];
}


+(void)putWithUrl:(NSString *)url
           params:(NSDictionary *)params
          success:(void(^)(id json))success
          failure:(void(^)(NSError *error))failure
{
    // 1.创建请求管理对象
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // 2.发送请求
    [manager PUT:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
#pragma mark - block 回调的写法
        if (success) {
            
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failure) {
            
            failure(error);
        }
    }];


}

@end

@implementation FromData

@end

