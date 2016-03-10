//
//  ResultBaseClass.m
//
//  Created by   on 16/1/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ResultBaseClass.h"
#import "ResultData.h"


NSString *const kResultBaseClassSuccess = @"success";
NSString *const kResultBaseClassData = @"data";


@interface ResultBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ResultBaseClass

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
            self.success = [[self objectOrNilForKey:kResultBaseClassSuccess fromDictionary:dict] boolValue];
            self.data = [ResultData modelObjectWithDictionary:[dict objectForKey:kResultBaseClassData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kResultBaseClassSuccess];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kResultBaseClassData];

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

    self.success = [aDecoder decodeBoolForKey:kResultBaseClassSuccess];
    self.data = [aDecoder decodeObjectForKey:kResultBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_success forKey:kResultBaseClassSuccess];
    [aCoder encodeObject:_data forKey:kResultBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    ResultBaseClass *copy = [[ResultBaseClass alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
