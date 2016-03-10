//
//  UserDefault.h
//
//  Created by Apple on 15/9/14.
//  Copyright (c) 2015年 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefault : NSObject

/*
 *  NSUserDefaults 设置值
 */
+ (void)setDataObject:(id)object forKey:(NSString *)key;

/*
 *  NSUserDefaults 取值
 */
+ (id)getDataObjectForKey:(NSString *)key;

/*
 *  NSUserDefaults 移除值
 */
+ (void)removeDataObjectForKey:(NSString *)key;

/*
 *  归档
 */
+ (NSData*)archiveDataWithObject:(id)object;

/*
 *  解档
 */
+ (id)unarchiveObjectWithData:(NSData*)data;

@end
