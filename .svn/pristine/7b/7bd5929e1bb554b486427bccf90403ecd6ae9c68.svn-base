//
//  CustomerBaseClass.m
//
//  Created by   on 15/12/23
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "CustomerBaseClass.h"
#import "CustomerData.h"


NSString *const kCustomerBaseClassSuccess = @"success";
NSString *const kCustomerBaseClassData = @"data";


@interface CustomerBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CustomerBaseClass

@synthesize success = _success;
@synthesize data = _data;


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
            self.success = [[self objectOrNilForKey:kCustomerBaseClassSuccess fromDictionary:dict] boolValue];
            self.data = [CustomerData modelObjectWithDictionary:[dict objectForKey:kCustomerBaseClassData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kCustomerBaseClassSuccess];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kCustomerBaseClassData];

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

    self.success = [aDecoder decodeBoolForKey:kCustomerBaseClassSuccess];
    self.data = [aDecoder decodeObjectForKey:kCustomerBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_success forKey:kCustomerBaseClassSuccess];
    [aCoder encodeObject:_data forKey:kCustomerBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    CustomerBaseClass *copy = [[CustomerBaseClass alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
