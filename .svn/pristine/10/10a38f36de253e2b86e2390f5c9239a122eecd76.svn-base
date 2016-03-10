//
//  DES.h
//  Sociax_iPhone
//
//  Created by huang jiang on 12-7-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@interface DES : NSObject

//+ (NSString *) udid;
+ (NSString *) md5:(NSString *)str;
+ (NSString *) doCipher:(NSString *)sTextIn key:(NSString *)sKey context:(CCOperation)encryptOrDecrypt;
+ (NSString *) encryptStr:(NSString *) str;
+ (NSString *) decryptStr:(NSString	*) str;

#pragma mark Based64
+ (NSString *) encodeBase64WithString:(NSString *)strData;
+ (NSString *) encodeBase64WithData:(NSData *)objData;
+ (NSData *) decodeBase64WithString:(NSString *)strBase64;
@end
