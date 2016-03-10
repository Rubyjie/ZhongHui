//
//  CustomerData.m
//
//  Created by   on 15/12/23
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "CustomerData.h"
#import "CustomerDatalist.h"


NSString *const kCustomerDataTotal = @"total";
NSString *const kCustomerDataDatalist = @"data";


@interface CustomerData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CustomerData

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
            self.total = [[self objectOrNilForKey:kCustomerDataTotal fromDictionary:dict] doubleValue];
    NSObject *receivedCustomerDatalist = [dict objectForKey:kCustomerDataDatalist];
    NSMutableArray *parsedCustomerDatalist = [NSMutableArray array];
    if ([receivedCustomerDatalist isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCustomerDatalist) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCustomerDatalist addObject:[CustomerDatalist modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCustomerDatalist isKindOfClass:[NSDictionary class]]) {
       [parsedCustomerDatalist addObject:[CustomerDatalist modelObjectWithDictionary:(NSDictionary *)receivedCustomerDatalist]];
    }

    self.datalist = [NSArray arrayWithArray:parsedCustomerDatalist];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kCustomerDataTotal];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDatalist] forKey:kCustomerDataDatalist];

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

    self.total = [aDecoder decodeDoubleForKey:kCustomerDataTotal];
    self.datalist = [aDecoder decodeObjectForKey:kCustomerDataDatalist];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_total forKey:kCustomerDataTotal];
    [aCoder encodeObject:_datalist forKey:kCustomerDataDatalist];
}

- (id)copyWithZone:(NSZone *)zone
{
    CustomerData *copy = [[CustomerData alloc] init];
    
    if (copy) {

        copy.total = self.total;
        copy.datalist = [self.datalist copyWithZone:zone];
    }
    
    return copy;
}


@end
