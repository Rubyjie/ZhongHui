//
//  XSPlanBaseClass.h
//
//  Created by   on 15/12/29
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XSPlanData;

@interface XSPlanBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL success;
@property (nonatomic, strong) XSPlanData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
