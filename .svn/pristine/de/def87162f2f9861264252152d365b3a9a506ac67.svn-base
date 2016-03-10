//
//  XSPlanData.m
//
//  Created by   on 15/12/29
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "XSPlanData.h"
#import "XSPlanDatalist.h"


NSString *const kXSPlanDataTotal = @"total";
NSString *const kXSPlanDataDatalist = @"data";


@interface XSPlanData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation XSPlanData

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
            self.total = [[self objectOrNilForKey:kXSPlanDataTotal fromDictionary:dict] doubleValue];
    NSObject *receivedXSPlanDatalist = [dict objectForKey:kXSPlanDataDatalist];
    NSMutableArray *parsedXSPlanDatalist = [NSMutableArray array];
    if ([receivedXSPlanDatalist isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedXSPlanDatalist) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedXSPlanDatalist addObject:[XSPlanDatalist modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedXSPlanDatalist isKindOfClass:[NSDictionary class]]) {
       [parsedXSPlanDatalist addObject:[XSPlanDatalist modelObjectWithDictionary:(NSDictionary *)receivedXSPlanDatalist]];
    }

    self.datalist = [NSArray arrayWithArray:parsedXSPlanDatalist];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kXSPlanDataTotal];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDatalist] forKey:kXSPlanDataDatalist];

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

    self.total = [aDecoder decodeDoubleForKey:kXSPlanDataTotal];
    self.datalist = [aDecoder decodeObjectForKey:kXSPlanDataDatalist];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_total forKey:kXSPlanDataTotal];
    [aCoder encodeObject:_datalist forKey:kXSPlanDataDatalist];
}

- (id)copyWithZone:(NSZone *)zone
{
    XSPlanData *copy = [[XSPlanData alloc] init];
    
    if (copy) {

        copy.total = self.total;
        copy.datalist = [self.datalist copyWithZone:zone];
    }
    
    return copy;
}


@end
