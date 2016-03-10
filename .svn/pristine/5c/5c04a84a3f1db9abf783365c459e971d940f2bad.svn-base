//
//  CustomerData.h
//
//  Created by   on 15/12/23
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CustomerData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double total;
@property (nonatomic, strong) NSArray *datalist;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
