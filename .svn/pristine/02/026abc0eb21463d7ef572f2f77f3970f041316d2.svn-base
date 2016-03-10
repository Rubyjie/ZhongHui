//
//  UserDefault.m
//
//  Created by Apple on 15/9/14.
//  Copyright (c) 2015年 All rights reserved.
//

#import "UserDefault.h"
#import "CommonUtils.h"

@implementation UserDefault

+ (void)setDataObject:(id)object forKey:(NSString *)key {
    if (object && [CommonUtils objectIsValid:key]) {
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:object forKey:key];
        [ud synchronize];
    }
}

+ (id)getDataObjectForKey:(NSString *)key {
    id obj = nil;
    if ([CommonUtils objectIsValid:key]) {
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        obj = [ud objectForKey:key];
    }
    return obj;
}

+ (void)removeDataObjectForKey:(NSString *)key {
    if ([CommonUtils objectIsValid:key]) {
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud removeObjectForKey:key];
        [ud synchronize];
    }
}

+ (NSData*)archiveDataWithObject:(id)object{
    return [NSKeyedArchiver archivedDataWithRootObject:object];
}

+ (id)unarchiveObjectWithData:(NSData*)data{
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}


@end
