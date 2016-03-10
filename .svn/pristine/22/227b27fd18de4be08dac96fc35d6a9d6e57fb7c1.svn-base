//
//  cluesData.m
//
//  Created by   on 15/12/25
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "cluesData.h"
#import "cluesDatalist.h"


NSString *const kcluesDataTotal = @"total";
NSString *const kcluesDataDatalist = @"data";


@interface cluesData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation cluesData

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
            self.total = [[self objectOrNilForKey:kcluesDataTotal fromDictionary:dict] doubleValue];
    NSObject *receivedcluesDatalist = [dict objectForKey:kcluesDataDatalist];
    NSMutableArray *parsedcluesDatalist = [NSMutableArray array];
    if ([receivedcluesDatalist isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedcluesDatalist) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedcluesDatalist addObject:[cluesDatalist modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedcluesDatalist isKindOfClass:[NSDictionary class]]) {
       [parsedcluesDatalist addObject:[cluesDatalist modelObjectWithDictionary:(NSDictionary *)receivedcluesDatalist]];
    }

    self.datalist = [NSArray arrayWithArray:parsedcluesDatalist];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kcluesDataTotal];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDatalist] forKey:kcluesDataDatalist];

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

    self.total = [aDecoder decodeDoubleForKey:kcluesDataTotal];
    self.datalist = [aDecoder decodeObjectForKey:kcluesDataDatalist];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_total forKey:kcluesDataTotal];
    [aCoder encodeObject:_datalist forKey:kcluesDataDatalist];
}

- (id)copyWithZone:(NSZone *)zone
{
    cluesData *copy = [[cluesData alloc] init];
    
    if (copy) {

        copy.total = self.total;
        copy.datalist = [self.datalist copyWithZone:zone];
    }
    
    return copy;
}


@end
