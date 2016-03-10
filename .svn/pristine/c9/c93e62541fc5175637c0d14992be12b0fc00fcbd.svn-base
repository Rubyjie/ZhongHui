//
//  PlanData.m
//
//  Created by   on 15/12/22
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "PlanData.h"
#import "PlanDatalist.h"


NSString *const kPlanDataTotal = @"total";
NSString *const kPlanDataDatalist = @"data";


@interface PlanData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PlanData

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
            self.total = [[self objectOrNilForKey:kPlanDataTotal fromDictionary:dict] doubleValue];
    NSObject *receivedPlanDatalist = [dict objectForKey:kPlanDataDatalist];
    NSMutableArray *parsedPlanDatalist = [NSMutableArray array];
    if ([receivedPlanDatalist isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPlanDatalist) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPlanDatalist addObject:[PlanDatalist modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPlanDatalist isKindOfClass:[NSDictionary class]]) {
       [parsedPlanDatalist addObject:[PlanDatalist modelObjectWithDictionary:(NSDictionary *)receivedPlanDatalist]];
    }

    self.datalist = [NSArray arrayWithArray:parsedPlanDatalist];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kPlanDataTotal];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDatalist] forKey:kPlanDataDatalist];

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

    self.total = [aDecoder decodeDoubleForKey:kPlanDataTotal];
    self.datalist = [aDecoder decodeObjectForKey:kPlanDataDatalist];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_total forKey:kPlanDataTotal];
    [aCoder encodeObject:_datalist forKey:kPlanDataDatalist];
}

- (id)copyWithZone:(NSZone *)zone
{
    PlanData *copy = [[PlanData alloc] init];
    
    if (copy) {

        copy.total = self.total;
        copy.datalist = [self.datalist copyWithZone:zone];
    }
    
    return copy;
}


@end
