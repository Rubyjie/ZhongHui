//
//  empDatalist.m
//
//  Created by   on 16/1/6
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "empDatalist.h"


NSString *const kempDatalistLoginTime = @"loginTime";
NSString *const kempDatalistModifierName = @"modifierName";
NSString *const kempDatalistModifierId = @"modifierId";
NSString *const kempDatalistPosition = @"position";
NSString *const kempDatalistBirthday = @"birthday";
NSString *const kempDatalistStatus = @"status";
NSString *const kempDatalistIdType = @"idType";
NSString *const kempDatalistOrganizationName = @"organizationName";
NSString *const kempDatalistCreatorId = @"creatorId";
NSString *const kempDatalistDuty = @"duty";
NSString *const kempDatalistYeTai = @"yeTai";
NSString *const kempDatalistCreatedDatetime = @"createdDatetime";
NSString *const kempDatalistImageId = @"imageId";
NSString *const kempDatalistModifiedDatetime = @"modifiedDatetime";
NSString *const kempDatalistEmployeeCode = @"employeeCode";
NSString *const kempDatalistId = @"id";
NSString *const kempDatalistGender = @"gender";
NSString *const kempDatalistEmail = @"email";
NSString *const kempDatalistBeginWorkDate = @"beginWorkDate";
NSString *const kempDatalistMobile = @"mobile";
NSString *const kempDatalistLastLoginTime = @"lastLoginTime";
NSString *const kempDatalistOrganizationId = @"organizationId";
NSString *const kempDatalistCreatorName = @"creatorName";
NSString *const kempDatalistYeTaiName = @"yeTaiName";
NSString *const kempDatalistOrgId = @"orgId";
NSString *const kempDatalistEmployeeName = @"employeeName";
NSString *const kempDatalistDescription = @"description";


@interface empDatalist ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation empDatalist

@synthesize loginTime = _loginTime;
@synthesize modifierName = _modifierName;
@synthesize modifierId = _modifierId;
@synthesize position = _position;
@synthesize birthday = _birthday;
@synthesize status = _status;
@synthesize idType = _idType;
@synthesize organizationName = _organizationName;
@synthesize creatorId = _creatorId;
@synthesize duty = _duty;
@synthesize yeTai = _yeTai;
@synthesize createdDatetime = _createdDatetime;
@synthesize imageId = _imageId;
@synthesize modifiedDatetime = _modifiedDatetime;
@synthesize employeeCode = _employeeCode;
@synthesize datalistIdentifier = _datalistIdentifier;
@synthesize gender = _gender;
@synthesize email = _email;
@synthesize beginWorkDate = _beginWorkDate;
@synthesize mobile = _mobile;
@synthesize lastLoginTime = _lastLoginTime;
@synthesize organizationId = _organizationId;
@synthesize creatorName = _creatorName;
@synthesize yeTaiName = _yeTaiName;
@synthesize orgId = _orgId;
@synthesize employeeName = _employeeName;
@synthesize datalistDescription = _datalistDescription;


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
            self.loginTime = [[self objectOrNilForKey:kempDatalistLoginTime fromDictionary:dict] doubleValue];
            self.modifierName = [self objectOrNilForKey:kempDatalistModifierName fromDictionary:dict];
            self.modifierId = [self objectOrNilForKey:kempDatalistModifierId fromDictionary:dict];
            self.position = [self objectOrNilForKey:kempDatalistPosition fromDictionary:dict];
            self.birthday = [[self objectOrNilForKey:kempDatalistBirthday fromDictionary:dict] doubleValue];
            self.status = [self objectOrNilForKey:kempDatalistStatus fromDictionary:dict];
            self.idType = [self objectOrNilForKey:kempDatalistIdType fromDictionary:dict];
            self.organizationName = [self objectOrNilForKey:kempDatalistOrganizationName fromDictionary:dict];
            self.creatorId = [self objectOrNilForKey:kempDatalistCreatorId fromDictionary:dict];
            self.duty = [self objectOrNilForKey:kempDatalistDuty fromDictionary:dict];
            self.yeTai = [self objectOrNilForKey:kempDatalistYeTai fromDictionary:dict];
            self.createdDatetime = [[self objectOrNilForKey:kempDatalistCreatedDatetime fromDictionary:dict] doubleValue];
            self.imageId = [self objectOrNilForKey:kempDatalistImageId fromDictionary:dict];
            self.modifiedDatetime = [[self objectOrNilForKey:kempDatalistModifiedDatetime fromDictionary:dict] doubleValue];
            self.employeeCode = [self objectOrNilForKey:kempDatalistEmployeeCode fromDictionary:dict];
            self.datalistIdentifier = [self objectOrNilForKey:kempDatalistId fromDictionary:dict];
            self.gender = [self objectOrNilForKey:kempDatalistGender fromDictionary:dict];
            self.email = [self objectOrNilForKey:kempDatalistEmail fromDictionary:dict];
            self.beginWorkDate = [[self objectOrNilForKey:kempDatalistBeginWorkDate fromDictionary:dict] doubleValue];
            self.mobile = [self objectOrNilForKey:kempDatalistMobile fromDictionary:dict];
            self.lastLoginTime = [[self objectOrNilForKey:kempDatalistLastLoginTime fromDictionary:dict] doubleValue];
            self.organizationId = [self objectOrNilForKey:kempDatalistOrganizationId fromDictionary:dict];
            self.creatorName = [self objectOrNilForKey:kempDatalistCreatorName fromDictionary:dict];
            self.yeTaiName = [self objectOrNilForKey:kempDatalistYeTaiName fromDictionary:dict];
            self.orgId = [self objectOrNilForKey:kempDatalistOrgId fromDictionary:dict];
            self.employeeName = [self objectOrNilForKey:kempDatalistEmployeeName fromDictionary:dict];
            self.datalistDescription = [self objectOrNilForKey:kempDatalistDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.loginTime] forKey:kempDatalistLoginTime];
    [mutableDict setValue:self.modifierName forKey:kempDatalistModifierName];
    [mutableDict setValue:self.modifierId forKey:kempDatalistModifierId];
    [mutableDict setValue:self.position forKey:kempDatalistPosition];
    [mutableDict setValue:[NSNumber numberWithDouble:self.birthday] forKey:kempDatalistBirthday];
    [mutableDict setValue:self.status forKey:kempDatalistStatus];
    [mutableDict setValue:self.idType forKey:kempDatalistIdType];
    [mutableDict setValue:self.organizationName forKey:kempDatalistOrganizationName];
    [mutableDict setValue:self.creatorId forKey:kempDatalistCreatorId];
    [mutableDict setValue:self.duty forKey:kempDatalistDuty];
    [mutableDict setValue:self.yeTai forKey:kempDatalistYeTai];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdDatetime] forKey:kempDatalistCreatedDatetime];
    [mutableDict setValue:self.imageId forKey:kempDatalistImageId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifiedDatetime] forKey:kempDatalistModifiedDatetime];
    [mutableDict setValue:self.employeeCode forKey:kempDatalistEmployeeCode];
    [mutableDict setValue:self.datalistIdentifier forKey:kempDatalistId];
    [mutableDict setValue:self.gender forKey:kempDatalistGender];
    [mutableDict setValue:self.email forKey:kempDatalistEmail];
    [mutableDict setValue:[NSNumber numberWithDouble:self.beginWorkDate] forKey:kempDatalistBeginWorkDate];
    [mutableDict setValue:self.mobile forKey:kempDatalistMobile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastLoginTime] forKey:kempDatalistLastLoginTime];
    [mutableDict setValue:self.organizationId forKey:kempDatalistOrganizationId];
    [mutableDict setValue:self.creatorName forKey:kempDatalistCreatorName];
    [mutableDict setValue:self.yeTaiName forKey:kempDatalistYeTaiName];
    [mutableDict setValue:self.orgId forKey:kempDatalistOrgId];
    [mutableDict setValue:self.employeeName forKey:kempDatalistEmployeeName];
    [mutableDict setValue:self.datalistDescription forKey:kempDatalistDescription];

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

    self.loginTime = [aDecoder decodeDoubleForKey:kempDatalistLoginTime];
    self.modifierName = [aDecoder decodeObjectForKey:kempDatalistModifierName];
    self.modifierId = [aDecoder decodeObjectForKey:kempDatalistModifierId];
    self.position = [aDecoder decodeObjectForKey:kempDatalistPosition];
    self.birthday = [aDecoder decodeDoubleForKey:kempDatalistBirthday];
    self.status = [aDecoder decodeObjectForKey:kempDatalistStatus];
    self.idType = [aDecoder decodeObjectForKey:kempDatalistIdType];
    self.organizationName = [aDecoder decodeObjectForKey:kempDatalistOrganizationName];
    self.creatorId = [aDecoder decodeObjectForKey:kempDatalistCreatorId];
    self.duty = [aDecoder decodeObjectForKey:kempDatalistDuty];
    self.yeTai = [aDecoder decodeObjectForKey:kempDatalistYeTai];
    self.createdDatetime = [aDecoder decodeDoubleForKey:kempDatalistCreatedDatetime];
    self.imageId = [aDecoder decodeObjectForKey:kempDatalistImageId];
    self.modifiedDatetime = [aDecoder decodeDoubleForKey:kempDatalistModifiedDatetime];
    self.employeeCode = [aDecoder decodeObjectForKey:kempDatalistEmployeeCode];
    self.datalistIdentifier = [aDecoder decodeObjectForKey:kempDatalistId];
    self.gender = [aDecoder decodeObjectForKey:kempDatalistGender];
    self.email = [aDecoder decodeObjectForKey:kempDatalistEmail];
    self.beginWorkDate = [aDecoder decodeDoubleForKey:kempDatalistBeginWorkDate];
    self.mobile = [aDecoder decodeObjectForKey:kempDatalistMobile];
    self.lastLoginTime = [aDecoder decodeDoubleForKey:kempDatalistLastLoginTime];
    self.organizationId = [aDecoder decodeObjectForKey:kempDatalistOrganizationId];
    self.creatorName = [aDecoder decodeObjectForKey:kempDatalistCreatorName];
    self.yeTaiName = [aDecoder decodeObjectForKey:kempDatalistYeTaiName];
    self.orgId = [aDecoder decodeObjectForKey:kempDatalistOrgId];
    self.employeeName = [aDecoder decodeObjectForKey:kempDatalistEmployeeName];
    self.datalistDescription = [aDecoder decodeObjectForKey:kempDatalistDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_loginTime forKey:kempDatalistLoginTime];
    [aCoder encodeObject:_modifierName forKey:kempDatalistModifierName];
    [aCoder encodeObject:_modifierId forKey:kempDatalistModifierId];
    [aCoder encodeObject:_position forKey:kempDatalistPosition];
    [aCoder encodeDouble:_birthday forKey:kempDatalistBirthday];
    [aCoder encodeObject:_status forKey:kempDatalistStatus];
    [aCoder encodeObject:_idType forKey:kempDatalistIdType];
    [aCoder encodeObject:_organizationName forKey:kempDatalistOrganizationName];
    [aCoder encodeObject:_creatorId forKey:kempDatalistCreatorId];
    [aCoder encodeObject:_duty forKey:kempDatalistDuty];
    [aCoder encodeObject:_yeTai forKey:kempDatalistYeTai];
    [aCoder encodeDouble:_createdDatetime forKey:kempDatalistCreatedDatetime];
    [aCoder encodeObject:_imageId forKey:kempDatalistImageId];
    [aCoder encodeDouble:_modifiedDatetime forKey:kempDatalistModifiedDatetime];
    [aCoder encodeObject:_employeeCode forKey:kempDatalistEmployeeCode];
    [aCoder encodeObject:_datalistIdentifier forKey:kempDatalistId];
    [aCoder encodeObject:_gender forKey:kempDatalistGender];
    [aCoder encodeObject:_email forKey:kempDatalistEmail];
    [aCoder encodeDouble:_beginWorkDate forKey:kempDatalistBeginWorkDate];
    [aCoder encodeObject:_mobile forKey:kempDatalistMobile];
    [aCoder encodeDouble:_lastLoginTime forKey:kempDatalistLastLoginTime];
    [aCoder encodeObject:_organizationId forKey:kempDatalistOrganizationId];
    [aCoder encodeObject:_creatorName forKey:kempDatalistCreatorName];
    [aCoder encodeObject:_yeTaiName forKey:kempDatalistYeTaiName];
    [aCoder encodeObject:_orgId forKey:kempDatalistOrgId];
    [aCoder encodeObject:_employeeName forKey:kempDatalistEmployeeName];
    [aCoder encodeObject:_datalistDescription forKey:kempDatalistDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    empDatalist *copy = [[empDatalist alloc] init];
    
    if (copy) {

        copy.loginTime = self.loginTime;
        copy.modifierName = [self.modifierName copyWithZone:zone];
        copy.modifierId = [self.modifierId copyWithZone:zone];
        copy.position = [self.position copyWithZone:zone];
        copy.birthday = self.birthday;
        copy.status = [self.status copyWithZone:zone];
        copy.idType = [self.idType copyWithZone:zone];
        copy.organizationName = [self.organizationName copyWithZone:zone];
        copy.creatorId = [self.creatorId copyWithZone:zone];
        copy.duty = [self.duty copyWithZone:zone];
        copy.yeTai = [self.yeTai copyWithZone:zone];
        copy.createdDatetime = self.createdDatetime;
        copy.imageId = [self.imageId copyWithZone:zone];
        copy.modifiedDatetime = self.modifiedDatetime;
        copy.employeeCode = [self.employeeCode copyWithZone:zone];
        copy.datalistIdentifier = [self.datalistIdentifier copyWithZone:zone];
        copy.gender = [self.gender copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
        copy.beginWorkDate = self.beginWorkDate;
        copy.mobile = [self.mobile copyWithZone:zone];
        copy.lastLoginTime = self.lastLoginTime;
        copy.organizationId = [self.organizationId copyWithZone:zone];
        copy.creatorName = [self.creatorName copyWithZone:zone];
        copy.yeTaiName = [self.yeTaiName copyWithZone:zone];
        copy.orgId = [self.orgId copyWithZone:zone];
        copy.employeeName = [self.employeeName copyWithZone:zone];
        copy.datalistDescription = [self.datalistDescription copyWithZone:zone];
    }
    
    return copy;
}


@end
