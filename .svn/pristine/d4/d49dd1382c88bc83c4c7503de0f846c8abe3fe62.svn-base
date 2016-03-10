//
//  ResultData.h
//
//  Created by   on 16/1/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ResultData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double total;
@property (nonatomic, strong) NSArray *datalist;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
