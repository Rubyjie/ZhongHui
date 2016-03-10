//
//  XSPlanBaseClass.m
//
//  Created by   on 15/12/29
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "XSPlanBaseClass.h"
#import "XSPlanData.h"


NSString *const kXSPlanBaseClassSuccess = @"success";
NSString *const kXSPlanBaseClassData = @"data";


@interface XSPlanBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation XSPlanBaseClass

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
            self.success = [[self objectOrNilForKey:kXSPlanBaseClassSuccess fromDictionary:dict] boolValue];
            self.data = [XSPlanData modelObjectWithDictionary:[dict objectForKey:kXSPlanBaseClassData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kXSPlanBaseClassSuccess];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kXSPlanBaseClassData];

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

    self.success = [aDecoder decodeBoolForKey:kXSPlanBaseClassSuccess];
    self.data = [aDecoder decodeObjectForKey:kXSPlanBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_success forKey:kXSPlanBaseClassSuccess];
    [aCoder encodeObject:_data forKey:kXSPlanBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    XSPlanBaseClass *copy = [[XSPlanBaseClass alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
