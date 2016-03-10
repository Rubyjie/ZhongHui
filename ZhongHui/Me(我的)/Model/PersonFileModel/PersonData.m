//
//  PersonData.m
//
//  Created by   on 15/12/30
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "PersonData.h"


NSString *const kPersonDataModifierName = @"modifierName";
NSString *const kPersonDataModifierId = @"modifierId";
NSString *const kPersonDataPosition = @"position";
NSString *const kPersonDataBirthday = @"birthday";
NSString *const kPersonDataStatus = @"status";
NSString *const kPersonDataSchool = @"school";
NSString *const kPersonDataOrganizationName = @"organizationName";
NSString *const kPersonDataDuty = @"duty";
NSString *const kPersonDataYeTai = @"yeTai";
NSString *const kPersonDataCreatedDatetime = @"createdDatetime";
NSString *const kPersonDataModifiedDatetime = @"modifiedDatetime";
NSString *const kPersonDataEmployeeCode = @"employeeCode";
NSString *const kPersonDataId = @"id";
NSString *const kPersonDataGender = @"gender";
NSString *const kPersonDataEmail = @"email";
NSString *const kPersonDataBeginWorkDate = @"beginWorkDate";
NSString *const kPersonDataMobile = @"mobile";
NSString *const kPersonDataOrganizationId = @"organizationId";
NSString *const kPersonDataStatusName = @"statusName";
NSString *const kPersonDataYeTaiName = @"yeTaiName";
NSString *const kPersonDataOrgId = @"orgId";
NSString *const kPersonDataEmployeeName = @"employeeName";
NSString *const kPersonDataExtensionNumber = @"extensionNumber";
NSString *const kPersonDataDescription = @"description";


@interface PersonData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PersonData

@synthesize modifierName = _modifierName;
@synthesize modifierId = _modifierId;
@synthesize position = _position;
@synthesize birthday = _birthday;
@synthesize status = _status;
@synthesize school = _school;
@synthesize organizationName = _organizationName;
@synthesize duty = _duty;
@synthesize yeTai = _yeTai;
@synthesize createdDatetime = _createdDatetime;
@synthesize modifiedDatetime = _modifiedDatetime;
@synthesize employeeCode = _employeeCode;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize gender = _gender;
@synthesize email = _email;
@synthesize beginWorkDate = _beginWorkDate;
@synthesize mobile = _mobile;
@synthesize organizationId = _organizationId;
@synthesize statusName = _statusName;
@synthesize yeTaiName = _yeTaiName;
@synthesize orgId = _orgId;
@synthesize employeeName = _employeeName;
@synthesize extensionNumber = _extensionNumber;
@synthesize dataDescription = _dataDescription;


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
            self.modifierName = [self objectOrNilForKey:kPersonDataModifierName fromDictionary:dict];
            self.modifierId = [self objectOrNilForKey:kPersonDataModifierId fromDictionary:dict];
            self.position = [self objectOrNilForKey:kPersonDataPosition fromDictionary:dict];
            self.birthday = [[self objectOrNilForKey:kPersonDataBirthday fromDictionary:dict] doubleValue];
            self.status = [self objectOrNilForKey:kPersonDataStatus fromDictionary:dict];
            self.school = [self objectOrNilForKey:kPersonDataSchool fromDictionary:dict];
            self.organizationName = [self objectOrNilForKey:kPersonDataOrganizationName fromDictionary:dict];
            self.duty = [self objectOrNilForKey:kPersonDataDuty fromDictionary:dict];
            self.yeTai = [self objectOrNilForKey:kPersonDataYeTai fromDictionary:dict];
            self.createdDatetime = [[self objectOrNilForKey:kPersonDataCreatedDatetime fromDictionary:dict] doubleValue];
            self.modifiedDatetime = [[self objectOrNilForKey:kPersonDataModifiedDatetime fromDictionary:dict] doubleValue];
            self.employeeCode = [self objectOrNilForKey:kPersonDataEmployeeCode fromDictionary:dict];
            self.dataIdentifier = [self objectOrNilForKey:kPersonDataId fromDictionary:dict];
            self.gender = [self objectOrNilForKey:kPersonDataGender fromDictionary:dict];
            self.email = [self objectOrNilForKey:kPersonDataEmail fromDictionary:dict];
            self.beginWorkDate = [[self objectOrNilForKey:kPersonDataBeginWorkDate fromDictionary:dict] doubleValue];
            self.mobile = [self objectOrNilForKey:kPersonDataMobile fromDictionary:dict];
            self.organizationId = [self objectOrNilForKey:kPersonDataOrganizationId fromDictionary:dict];
            self.statusName = [self objectOrNilForKey:kPersonDataStatusName fromDictionary:dict];
            self.yeTaiName = [self objectOrNilForKey:kPersonDataYeTaiName fromDictionary:dict];
            self.orgId = [self objectOrNilForKey:kPersonDataOrgId fromDictionary:dict];
            self.employeeName = [self objectOrNilForKey:kPersonDataEmployeeName fromDictionary:dict];
            self.extensionNumber = [self objectOrNilForKey:kPersonDataExtensionNumber fromDictionary:dict];
            self.dataDescription = [self objectOrNilForKey:kPersonDataDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.modifierName forKey:kPersonDataModifierName];
    [mutableDict setValue:self.modifierId forKey:kPersonDataModifierId];
    [mutableDict setValue:self.position forKey:kPersonDataPosition];
    [mutableDict setValue:[NSNumber numberWithDouble:self.birthday] forKey:kPersonDataBirthday];
    [mutableDict setValue:self.status forKey:kPersonDataStatus];
    [mutableDict setValue:self.school forKey:kPersonDataSchool];
    [mutableDict setValue:self.organizationName forKey:kPersonDataOrganizationName];
    [mutableDict setValue:self.duty forKey:kPersonDataDuty];
    [mutableDict setValue:self.yeTai forKey:kPersonDataYeTai];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdDatetime] forKey:kPersonDataCreatedDatetime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifiedDatetime] forKey:kPersonDataModifiedDatetime];
    [mutableDict setValue:self.employeeCode forKey:kPersonDataEmployeeCode];
    [mutableDict setValue:self.dataIdentifier forKey:kPersonDataId];
    [mutableDict setValue:self.gender forKey:kPersonDataGender];
    [mutableDict setValue:self.email forKey:kPersonDataEmail];
    [mutableDict setValue:[NSNumber numberWithDouble:self.beginWorkDate] forKey:kPersonDataBeginWorkDate];
    [mutableDict setValue:self.mobile forKey:kPersonDataMobile];
    [mutableDict setValue:self.organizationId forKey:kPersonDataOrganizationId];
    [mutableDict setValue:self.statusName forKey:kPersonDataStatusName];
    [mutableDict setValue:self.yeTaiName forKey:kPersonDataYeTaiName];
    [mutableDict setValue:self.orgId forKey:kPersonDataOrgId];
    [mutableDict setValue:self.employeeName forKey:kPersonDataEmployeeName];
    [mutableDict setValue:self.extensionNumber forKey:kPersonDataExtensionNumber];
    [mutableDict setValue:self.dataDescription forKey:kPersonDataDescription];

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

    self.modifierName = [aDecoder decodeObjectForKey:kPersonDataModifierName];
    self.modifierId = [aDecoder decodeObjectForKey:kPersonDataModifierId];
    self.position = [aDecoder decodeObjectForKey:kPersonDataPosition];
    self.birthday = [aDecoder decodeDoubleForKey:kPersonDataBirthday];
    self.status = [aDecoder decodeObjectForKey:kPersonDataStatus];
    self.school = [aDecoder decodeObjectForKey:kPersonDataSchool];
    self.organizationName = [aDecoder decodeObjectForKey:kPersonDataOrganizationName];
    self.duty = [aDecoder decodeObjectForKey:kPersonDataDuty];
    self.yeTai = [aDecoder decodeObjectForKey:kPersonDataYeTai];
    self.createdDatetime = [aDecoder decodeDoubleForKey:kPersonDataCreatedDatetime];
    self.modifiedDatetime = [aDecoder decodeDoubleForKey:kPersonDataModifiedDatetime];
    self.employeeCode = [aDecoder decodeObjectForKey:kPersonDataEmployeeCode];
    self.dataIdentifier = [aDecoder decodeObjectForKey:kPersonDataId];
    self.gender = [aDecoder decodeObjectForKey:kPersonDataGender];
    self.email = [aDecoder decodeObjectForKey:kPersonDataEmail];
    self.beginWorkDate = [aDecoder decodeDoubleForKey:kPersonDataBeginWorkDate];
    self.mobile = [aDecoder decodeObjectForKey:kPersonDataMobile];
    self.organizationId = [aDecoder decodeObjectForKey:kPersonDataOrganizationId];
    self.statusName = [aDecoder decodeObjectForKey:kPersonDataStatusName];
    self.yeTaiName = [aDecoder decodeObjectForKey:kPersonDataYeTaiName];
    self.orgId = [aDecoder decodeObjectForKey:kPersonDataOrgId];
    self.employeeName = [aDecoder decodeObjectForKey:kPersonDataEmployeeName];
    self.extensionNumber = [aDecoder decodeObjectForKey:kPersonDataExtensionNumber];
    self.dataDescription = [aDecoder decodeObjectForKey:kPersonDataDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_modifierName forKey:kPersonDataModifierName];
    [aCoder encodeObject:_modifierId forKey:kPersonDataModifierId];
    [aCoder encodeObject:_position forKey:kPersonDataPosition];
    [aCoder encodeDouble:_birthday forKey:kPersonDataBirthday];
    [aCoder encodeObject:_status forKey:kPersonDataStatus];
    [aCoder encodeObject:_school forKey:kPersonDataSchool];
    [aCoder encodeObject:_organizationName forKey:kPersonDataOrganizationName];
    [aCoder encodeObject:_duty forKey:kPersonDataDuty];
    [aCoder encodeObject:_yeTai forKey:kPersonDataYeTai];
    [aCoder encodeDouble:_createdDatetime forKey:kPersonDataCreatedDatetime];
    [aCoder encodeDouble:_modifiedDatetime forKey:kPersonDataModifiedDatetime];
    [aCoder encodeObject:_employeeCode forKey:kPersonDataEmployeeCode];
    [aCoder encodeObject:_dataIdentifier forKey:kPersonDataId];
    [aCoder encodeObject:_gender forKey:kPersonDataGender];
    [aCoder encodeObject:_email forKey:kPersonDataEmail];
    [aCoder encodeDouble:_beginWorkDate forKey:kPersonDataBeginWorkDate];
    [aCoder encodeObject:_mobile forKey:kPersonDataMobile];
    [aCoder encodeObject:_organizationId forKey:kPersonDataOrganizationId];
    [aCoder encodeObject:_statusName forKey:kPersonDataStatusName];
    [aCoder encodeObject:_yeTaiName forKey:kPersonDataYeTaiName];
    [aCoder encodeObject:_orgId forKey:kPersonDataOrgId];
    [aCoder encodeObject:_employeeName forKey:kPersonDataEmployeeName];
    [aCoder encodeObject:_extensionNumber forKey:kPersonDataExtensionNumber];
    [aCoder encodeObject:_dataDescription forKey:kPersonDataDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    PersonData *copy = [[PersonData alloc] init];
    
    if (copy) {

        copy.modifierName = [self.modifierName copyWithZone:zone];
        copy.modifierId = [self.modifierId copyWithZone:zone];
        copy.position = [self.position copyWithZone:zone];
        copy.birthday = self.birthday;
        copy.status = [self.status copyWithZone:zone];
        copy.school = [self.school copyWithZone:zone];
        copy.organizationName = [self.organizationName copyWithZone:zone];
        copy.duty = [self.duty copyWithZone:zone];
        copy.yeTai = [self.yeTai copyWithZone:zone];
        copy.createdDatetime = self.createdDatetime;
        copy.modifiedDatetime = self.modifiedDatetime;
        copy.employeeCode = [self.employeeCode copyWithZone:zone];
        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.gender = [self.gender copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
        copy.beginWorkDate = self.beginWorkDate;
        copy.mobile = [self.mobile copyWithZone:zone];
        copy.organizationId = [self.organizationId copyWithZone:zone];
        copy.statusName = [self.statusName copyWithZone:zone];
        copy.yeTaiName = [self.yeTaiName copyWithZone:zone];
        copy.orgId = [self.orgId copyWithZone:zone];
        copy.employeeName = [self.employeeName copyWithZone:zone];
        copy.extensionNumber = [self.extensionNumber copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
    }
    
    return copy;
}


@end
