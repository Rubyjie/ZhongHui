//
//  myContractBaseClass.m
//
//  Created by   on 15/12/25
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "myContractBaseClass.h"
#import "myContractData.h"


NSString *const kmyContractBaseClassSuccess = @"success";
NSString *const kmyContractBaseClassData = @"data";


@interface myContractBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation myContractBaseClass

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
            self.success = [[self objectOrNilForKey:kmyContractBaseClassSuccess fromDictionary:dict] boolValue];
            self.data = [myContractData modelObjectWithDictionary:[dict objectForKey:kmyContractBaseClassData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kmyContractBaseClassSuccess];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kmyContractBaseClassData];

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

    self.success = [aDecoder decodeBoolForKey:kmyContractBaseClassSuccess];
    self.data = [aDecoder decodeObjectForKey:kmyContractBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_success forKey:kmyContractBaseClassSuccess];
    [aCoder encodeObject:_data forKey:kmyContractBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    myContractBaseClass *copy = [[myContractBaseClass alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
