//
//  PlanDeailsBaseClass.m
//
//  Created by   on 15/12/22
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "PlanDeailsBaseClass.h"
#import "PlanDeailsData.h"


NSString *const kPlanDeailsBaseClassSuccess = @"success";
NSString *const kPlanDeailsBaseClassData = @"data";


@interface PlanDeailsBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PlanDeailsBaseClass

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
            self.success = [[self objectOrNilForKey:kPlanDeailsBaseClassSuccess fromDictionary:dict] boolValue];
            self.data = [PlanDeailsData modelObjectWithDictionary:[dict objectForKey:kPlanDeailsBaseClassData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kPlanDeailsBaseClassSuccess];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kPlanDeailsBaseClassData];

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

    self.success = [aDecoder decodeBoolForKey:kPlanDeailsBaseClassSuccess];
    self.data = [aDecoder decodeObjectForKey:kPlanDeailsBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_success forKey:kPlanDeailsBaseClassSuccess];
    [aCoder encodeObject:_data forKey:kPlanDeailsBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    PlanDeailsBaseClass *copy = [[PlanDeailsBaseClass alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
