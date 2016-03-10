//
//  XQBaseClass.m
//
//  Created by   on 15/12/25
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "XQBaseClass.h"
#import "XQData.h"


NSString *const kXQBaseClassSuccess = @"success";
NSString *const kXQBaseClassData = @"data";


@interface XQBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation XQBaseClass

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
            self.success = [[self objectOrNilForKey:kXQBaseClassSuccess fromDictionary:dict] boolValue];
            self.data = [XQData modelObjectWithDictionary:[dict objectForKey:kXQBaseClassData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kXQBaseClassSuccess];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kXQBaseClassData];

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

    self.success = [aDecoder decodeBoolForKey:kXQBaseClassSuccess];
    self.data = [aDecoder decodeObjectForKey:kXQBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_success forKey:kXQBaseClassSuccess];
    [aCoder encodeObject:_data forKey:kXQBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    XQBaseClass *copy = [[XQBaseClass alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
