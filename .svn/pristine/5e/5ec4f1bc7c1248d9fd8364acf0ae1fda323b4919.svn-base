//
//  PersonBaseClass.h
//
//  Created by   on 15/12/30
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PersonData;

@interface PersonBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL success;
@property (nonatomic, strong) PersonData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
