//
//  CluesXqBaseClass.h
//
//  Created by   on 16/1/20
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CluesXqData;

@interface CluesXqBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL success;
@property (nonatomic, strong) CluesXqData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
