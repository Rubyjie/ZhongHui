//
//  empBaseClass.m
//
//  Created by   on 16/1/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "empBaseClass.h"
#import "empData.h"


NSString *const kempBaseClassSuccess = @"success";
NSString *const kempBaseClassData = @"data";


@interface empBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation empBaseClass

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
            self.success = [[self objectOrNilForKey:kempBaseClassSuccess fromDictionary:dict] boolValue];
            self.data = [empData modelObjectWithDictionary:[dict objectForKey:kempBaseClassData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kempBaseClassSuccess];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kempBaseClassData];

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

    self.success = [aDecoder decodeBoolForKey:kempBaseClassSuccess];
    self.data = [aDecoder decodeObjectForKey:kempBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_success forKey:kempBaseClassSuccess];
    [aCoder encodeObject:_data forKey:kempBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    empBaseClass *copy = [[empBaseClass alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
