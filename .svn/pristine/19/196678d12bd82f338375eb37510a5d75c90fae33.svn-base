//
//  CluesXqBaseClass.m
//
//  Created by   on 16/1/20
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CluesXqBaseClass.h"
#import "CluesXqData.h"


NSString *const kCluesXqBaseClassSuccess = @"success";
NSString *const kCluesXqBaseClassData = @"data";


@interface CluesXqBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CluesXqBaseClass

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
            self.success = [[self objectOrNilForKey:kCluesXqBaseClassSuccess fromDictionary:dict] boolValue];
            self.data = [CluesXqData modelObjectWithDictionary:[dict objectForKey:kCluesXqBaseClassData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.success] forKey:kCluesXqBaseClassSuccess];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kCluesXqBaseClassData];

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

    self.success = [aDecoder decodeBoolForKey:kCluesXqBaseClassSuccess];
    self.data = [aDecoder decodeObjectForKey:kCluesXqBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_success forKey:kCluesXqBaseClassSuccess];
    [aCoder encodeObject:_data forKey:kCluesXqBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    CluesXqBaseClass *copy = [[CluesXqBaseClass alloc] init];
    
    if (copy) {

        copy.success = self.success;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
