//
//  empBaseClass.h
//
//  Created by   on 16/1/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class empData;

@interface empBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL success;
@property (nonatomic, strong) empData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
