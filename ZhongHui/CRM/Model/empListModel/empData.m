//
//  empData.m
//
//  Created by   on 16/1/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "empData.h"
#import "empDatalist.h"


NSString *const kempDataTotal = @"total";
NSString *const kempDataDatalist = @"data";


@interface empData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation empData

@synthesize total = _total;
@synthesize datalist = _datalist;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.total = [[self objectOrNilForKey:kempDataTotal fromDictionary:dict] doubleValue];
    NSObject *receivedempDatalist = [dict objectForKey:kempDataDatalist];
    NSMutableArray *parsedempDatalist = [NSMutableArray array];
    if ([receivedempDatalist isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedempDatalist) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedempDatalist addObject:[empDatalist modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedempDatalist isKindOfClass:[NSDictionary class]]) {
       [parsedempDatalist addObject:[empDatalist modelObjectWithDictionary:(NSDictionary *)receivedempDatalist]];
    }

    self.datalist = [NSArray arrayWithArray:parsedempDatalist];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kempDataTotal];
    NSMutableArray *tempArrayForDatalist = [NSMutableArray array];
    for (NSObject *subArrayObject in self.datalist) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDatalist addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDatalist addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDatalist] forKey:kempDataDatalist];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.total = [aDecoder decodeDoubleForKey:kempDataTotal];
    self.datalist = [aDecoder decodeObjectForKey:kempDataDatalist];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_total forKey:kempDataTotal];
    [aCoder encodeObject:_datalist forKey:kempDataDatalist];
}

- (id)copyWithZone:(NSZone *)zone
{
    empData *copy = [[empData alloc] init];
    
    if (copy) {

        copy.total = self.total;
        copy.datalist = [self.datalist copyWithZone:zone];
    }
    
    return copy;
}


@end
