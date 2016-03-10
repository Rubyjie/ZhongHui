//
//  cluesBaseClass.h
//
//  Created by   on 15/12/25
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class cluesData;

@interface cluesBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL success;
@property (nonatomic, strong) cluesData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
