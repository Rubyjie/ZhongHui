//
//  PersonBaseClass.m
//
//  Created by   on 15/12/30
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "PersonBaseClass.h"
#import "PersonData.h"


NSString *const kPersonBaseClassSuccess = @"success";
NSString *const kPersonBaseClassData = @"data";


@interface PersonBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PersonBaseClass

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
            self.success = [[self objectOrNilForKey:kPersonBaseClassSuccess fromDictionary:dict] boolValue];
            self.data = [PersonData modelObjectWithDictionary:[dict objectForKey:kPersonBaseClassData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kPersonBaseClassSuccess];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kPersonBaseClassData];

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

    self.success = [aDecoder decodeBoolForKey:kPersonBaseClassSuccess];
    self.data = [aDecoder decodeObjectForKey:kPersonBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_success forKey:kPersonBaseClassSuccess];
    [aCoder encodeObject:_data forKey:kPersonBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    PersonBaseClass *copy = [[PersonBaseClass alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
