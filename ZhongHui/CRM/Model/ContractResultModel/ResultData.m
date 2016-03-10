//
//  ResultData.m
//
//  Created by   on 16/1/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ResultData.h"
#import "ResultDatalist.h"


NSString *const kResultDataTotal = @"total";
NSString *const kResultDataDatalist = @"data";


@interface ResultData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ResultData

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
            self.total = [[self objectOrNilForKey:kResultDataTotal fromDictionary:dict] doubleValue];
    NSObject *receivedResultDatalist = [dict objectForKey:kResultDataDatalist];
    NSMutableArray *parsedResultDatalist = [NSMutableArray array];
    if ([receivedResultDatalist isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedResultDatalist) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedResultDatalist addObject:[ResultDatalist modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedResultDatalist isKindOfClass:[NSDictionary class]]) {
       [parsedResultDatalist addObject:[ResultDatalist modelObjectWithDictionary:(NSDictionary *)receivedResultDatalist]];
    }

    self.datalist = [NSArray arrayWithArray:parsedResultDatalist];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kResultDataTotal];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDatalist] forKey:kResultDataDatalist];

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

    self.total = [aDecoder decodeDoubleForKey:kResultDataTotal];
    self.datalist = [aDecoder decodeObjectForKey:kResultDataDatalist];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_total forKey:kResultDataTotal];
    [aCoder encodeObject:_datalist forKey:kResultDataDatalist];
}

- (id)copyWithZone:(NSZone *)zone
{
    ResultData *copy = [[ResultData alloc] init];
    
    if (copy) {

        copy.total = self.total;
        copy.datalist = [self.datalist copyWithZone:zone];
    }
    
    return copy;
}


@end
