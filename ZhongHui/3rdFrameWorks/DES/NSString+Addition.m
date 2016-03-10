//
//  NSString+Addition.m
//  CIP_iOS
//
//  Created by apple on 13-12-17.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "NSString+Addition.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation NSString (Addition)
#pragma mark － encode
- (NSString *)urlEncodeString
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                           (CFStringRef)self,
                                                                           NULL,
                                                                           (CFStringRef)@";/?:@&=$+{}<>,*!()'",
                                                                           kCFStringEncodingUTF8));
    return result;
}




#pragma mark - MD5加密
- (NSString *)md5String
{
    if(self == nil || [self length] == 0)
        return nil;
    const char *value = [self UTF8String];
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (unsigned int)strlen(value), outputBuffer);
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    return outputString;
}

@end
