//
//  contractData.m
//
//  Created by   on 15/12/25
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "contractData.h"
#import "contractDatalist.h"


NSString *const kcontractDataTotal = @"total";
NSString *const kcontractDataDatalist = @"data";


@interface contractData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation contractData

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
            self.total = [[self objectOrNilForKey:kcontractDataTotal fromDictionary:dict] doubleValue];
    NSObject *receivedcontractDatalist = [dict objectForKey:kcontractDataDatalist];
    NSMutableArray *parsedcontractDatalist = [NSMutableArray array];
    if ([receivedcontractDatalist isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedcontractDatalist) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedcontractDatalist addObject:[contractDatalist modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedcontractDatalist isKindOfClass:[NSDictionary class]]) {
       [parsedcontractDatalist addObject:[contractDatalist modelObjectWithDictionary:(NSDictionary *)receivedcontractDatalist]];
    }

    self.datalist = [NSArray arrayWithArray:parsedcontractDatalist];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kcontractDataTotal];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDatalist] forKey:kcontractDataDatalist];

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

    self.total = [aDecoder decodeDoubleForKey:kcontractDataTotal];
    self.datalist = [aDecoder decodeObjectForKey:kcontractDataDatalist];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_total forKey:kcontractDataTotal];
    [aCoder encodeObject:_datalist forKey:kcontractDataDatalist];
}

- (id)copyWithZone:(NSZone *)zone
{
    contractData *copy = [[contractData alloc] init];
    
    if (copy) {

        copy.total = self.total;
        copy.datalist = [self.datalist copyWithZone:zone];
    }
    
    return copy;
}


@end
