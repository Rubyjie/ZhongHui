//
//  XQData.m
//
//  Created by   on 15/12/25
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "XQData.h"


NSString *const kcluesDataOwnerId = @"ownerId";
NSString *const kcluesDataModifierName = @"modifierName";
NSString *const kcluesDataModifierId = @"modifierId";
NSString *const kcluesDataUserNatureName = @"userNatureName";
NSString *const kcluesDataUserNature = @"userNature";
NSString *const kcluesDataCustomerLevelName = @"customerLevelName";
NSString *const kcluesDataTenementId = @"tenementId";
NSString *const kcluesDataStatus = @"status";
NSString *const kcluesDataBusiDepartName = @"busiDepartName";
NSString *const kcluesDataCreatorId = @"creatorId";
NSString *const kcluesDataDescription = @"description";
NSString *const kcluesDataCusFullname = @"cusFullname";
NSString *const kcluesDataOrgId = @"orgId";
NSString *const kcluesDataBusiNature = @"busiNature";
NSString *const kcluesDataBusiDepart = @"busiDepart";
NSString *const kcluesDataFollowupResult = @"followupResult";
NSString *const kcluesDataCreatedDatetime = @"createdDatetime";
NSString *const kcluesDataStartLevelName = @"startLevelName";
NSString *const kcluesDataRegionAddr = @"regionAddr";
NSString *const kcluesDataModifiedDatetime = @"modifiedDatetime";
NSString *const kcluesDataCusTypeName = @"cusTypeName";
NSString *const kcluesDataId = @"id";
NSString *const kcluesDataCusType = @"cusType";
NSString *const kcluesDataOwnerGroupId = @"ownerGroupId";
NSString *const kcluesDataCreatorName = @"creatorName";
NSString *const kcluesDataOrgName = @"orgName";
NSString *const kcluesDataStatusName = @"statusName";
NSString *const kcluesDataCusId = @"cusId";
NSString *const kcluesDataFollowupResultName = @"followupResultName";
NSString *const kcluesDataStartLevel = @"startLevel";
NSString *const kcluesDataBusiNatureName = @"busiNatureName";
NSString *const kcluesDataOwnerName = @"ownerName";


@interface XQData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation XQData

@synthesize ownerId = _ownerId;
@synthesize modifierName = _modifierName;
@synthesize modifierId = _modifierId;
@synthesize userNatureName = _userNatureName;
@synthesize userNature = _userNature;
@synthesize customerLevelName = _customerLevelName;
@synthesize tenementId = _tenementId;
@synthesize status = _status;
@synthesize busiDepartName = _busiDepartName;
@synthesize creatorId = _creatorId;
@synthesize dataDescription = _dataDescription;
@synthesize cusFullname = _cusFullname;
@synthesize orgId = _orgId;
@synthesize busiNature = _busiNature;
@synthesize busiDepart = _busiDepart;
@synthesize followupResult = _followupResult;
@synthesize createdDatetime = _createdDatetime;
@synthesize startLevelName = _startLevelName;
@synthesize regionAddr = _regionAddr;
@synthesize modifiedDatetime = _modifiedDatetime;
@synthesize cusTypeName = _cusTypeName;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize cusType = _cusType;
@synthesize ownerGroupId = _ownerGroupId;
@synthesize creatorName = _creatorName;
@synthesize orgName = _orgName;
@synthesize statusName = _statusName;
@synthesize cusId = _cusId;
@synthesize followupResultName = _followupResultName;
@synthesize startLevel = _startLevel;
@synthesize busiNatureName = _busiNatureName;
@synthesize ownerName = _ownerName;


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
        self.ownerId = [self objectOrNilForKey:kcluesDataOwnerId fromDictionary:dict];
        self.modifierName = [self objectOrNilForKey:kcluesDataModifierName fromDictionary:dict];
        self.modifierId = [self objectOrNilForKey:kcluesDataModifierId fromDictionary:dict];
        self.userNatureName = [self objectOrNilForKey:kcluesDataUserNatureName fromDictionary:dict];
        self.userNature = [self objectOrNilForKey:kcluesDataUserNature fromDictionary:dict];
        self.customerLevelName = [self objectOrNilForKey:kcluesDataCustomerLevelName fromDictionary:dict];
        self.tenementId = [self objectOrNilForKey:kcluesDataTenementId fromDictionary:dict];
        self.status = [self objectOrNilForKey:kcluesDataStatus fromDictionary:dict];
        self.busiDepartName = [self objectOrNilForKey:kcluesDataBusiDepartName fromDictionary:dict];
        self.creatorId = [self objectOrNilForKey:kcluesDataCreatorId fromDictionary:dict];
        self.dataDescription = [self objectOrNilForKey:kcluesDataDescription fromDictionary:dict];
        self.cusFullname = [self objectOrNilForKey:kcluesDataCusFullname fromDictionary:dict];
        self.orgId = [self objectOrNilForKey:kcluesDataOrgId fromDictionary:dict];
        self.busiNature = [self objectOrNilForKey:kcluesDataBusiNature fromDictionary:dict];
        self.busiDepart = [self objectOrNilForKey:kcluesDataBusiDepart fromDictionary:dict];
        self.followupResult = [self objectOrNilForKey:kcluesDataFollowupResult fromDictionary:dict];
        self.createdDatetime = [[self objectOrNilForKey:kcluesDataCreatedDatetime fromDictionary:dict] doubleValue];
        self.startLevelName = [self objectOrNilForKey:kcluesDataStartLevelName fromDictionary:dict];
        self.regionAddr = [self objectOrNilForKey:kcluesDataRegionAddr fromDictionary:dict];
        self.modifiedDatetime = [[self objectOrNilForKey:kcluesDataModifiedDatetime fromDictionary:dict] doubleValue];
        self.cusTypeName = [self objectOrNilForKey:kcluesDataCusTypeName fromDictionary:dict];
        self.dataIdentifier = [self objectOrNilForKey:kcluesDataId fromDictionary:dict];
        self.cusType = [self objectOrNilForKey:kcluesDataCusType fromDictionary:dict];
        self.ownerGroupId = [self objectOrNilForKey:kcluesDataOwnerGroupId fromDictionary:dict];
        self.creatorName = [self objectOrNilForKey:kcluesDataCreatorName fromDictionary:dict];
        self.orgName = [self objectOrNilForKey:kcluesDataOrgName fromDictionary:dict];
        self.statusName = [self objectOrNilForKey:kcluesDataStatusName fromDictionary:dict];
        self.cusId = [self objectOrNilForKey:kcluesDataCusId fromDictionary:dict];
        self.followupResultName = [self objectOrNilForKey:kcluesDataFollowupResultName fromDictionary:dict];
        self.startLevel = [self objectOrNilForKey:kcluesDataStartLevel fromDictionary:dict];
        self.busiNatureName = [self objectOrNilForKey:kcluesDataBusiNatureName fromDictionary:dict];
        self.ownerName = [self objectOrNilForKey:kcluesDataOwnerName fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.ownerId forKey:kcluesDataOwnerId];
    [mutableDict setValue:self.modifierName forKey:kcluesDataModifierName];
    [mutableDict setValue:self.modifierId forKey:kcluesDataModifierId];
    [mutableDict setValue:self.userNatureName forKey:kcluesDataUserNatureName];
    [mutableDict setValue:self.userNature forKey:kcluesDataUserNature];
    [mutableDict setValue:self.customerLevelName forKey:kcluesDataCustomerLevelName];
    [mutableDict setValue:self.tenementId forKey:kcluesDataTenementId];
    [mutableDict setValue:self.status forKey:kcluesDataStatus];
    [mutableDict setValue:self.busiDepartName forKey:kcluesDataBusiDepartName];
    [mutableDict setValue:self.creatorId forKey:kcluesDataCreatorId];
    [mutableDict setValue:self.dataDescription forKey:kcluesDataDescription];
    [mutableDict setValue:self.cusFullname forKey:kcluesDataCusFullname];
    [mutableDict setValue:self.orgId forKey:kcluesDataOrgId];
    [mutableDict setValue:self.busiNature forKey:kcluesDataBusiNature];
    [mutableDict setValue:self.busiDepart forKey:kcluesDataBusiDepart];
    [mutableDict setValue:self.followupResult forKey:kcluesDataFollowupResult];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdDatetime] forKey:kcluesDataCreatedDatetime];
    [mutableDict setValue:self.startLevelName forKey:kcluesDataStartLevelName];
    [mutableDict setValue:self.regionAddr forKey:kcluesDataRegionAddr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifiedDatetime] forKey:kcluesDataModifiedDatetime];
    [mutableDict setValue:self.cusTypeName forKey:kcluesDataCusTypeName];
    [mutableDict setValue:self.dataIdentifier forKey:kcluesDataId];
    [mutableDict setValue:self.cusType forKey:kcluesDataCusType];
    [mutableDict setValue:self.ownerGroupId forKey:kcluesDataOwnerGroupId];
    [mutableDict setValue:self.creatorName forKey:kcluesDataCreatorName];
    [mutableDict setValue:self.orgName forKey:kcluesDataOrgName];
    [mutableDict setValue:self.statusName forKey:kcluesDataStatusName];
    [mutableDict setValue:self.cusId forKey:kcluesDataCusId];
    [mutableDict setValue:self.followupResultName forKey:kcluesDataFollowupResultName];
    [mutableDict setValue:self.startLevel forKey:kcluesDataStartLevel];
    [mutableDict setValue:self.busiNatureName forKey:kcluesDataBusiNatureName];
    [mutableDict setValue:self.ownerName forKey:kcluesDataOwnerName];
    
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
    
    self.ownerId = [aDecoder decodeObjectForKey:kcluesDataOwnerId];
    self.modifierName = [aDecoder decodeObjectForKey:kcluesDataModifierName];
    self.modifierId = [aDecoder decodeObjectForKey:kcluesDataModifierId];
    self.userNatureName = [aDecoder decodeObjectForKey:kcluesDataUserNatureName];
    self.userNature = [aDecoder decodeObjectForKey:kcluesDataUserNature];
    self.customerLevelName = [aDecoder decodeObjectForKey:kcluesDataCustomerLevelName];
    self.tenementId = [aDecoder decodeObjectForKey:kcluesDataTenementId];
    self.status = [aDecoder decodeObjectForKey:kcluesDataStatus];
    self.busiDepartName = [aDecoder decodeObjectForKey:kcluesDataBusiDepartName];
    self.creatorId = [aDecoder decodeObjectForKey:kcluesDataCreatorId];
    self.dataDescription = [aDecoder decodeObjectForKey:kcluesDataDescription];
    self.cusFullname = [aDecoder decodeObjectForKey:kcluesDataCusFullname];
    self.orgId = [aDecoder decodeObjectForKey:kcluesDataOrgId];
    self.busiNature = [aDecoder decodeObjectForKey:kcluesDataBusiNature];
    self.busiDepart = [aDecoder decodeObjectForKey:kcluesDataBusiDepart];
    self.followupResult = [aDecoder decodeObjectForKey:kcluesDataFollowupResult];
    self.createdDatetime = [aDecoder decodeDoubleForKey:kcluesDataCreatedDatetime];
    self.startLevelName = [aDecoder decodeObjectForKey:kcluesDataStartLevelName];
    self.regionAddr = [aDecoder decodeObjectForKey:kcluesDataRegionAddr];
    self.modifiedDatetime = [aDecoder decodeDoubleForKey:kcluesDataModifiedDatetime];
    self.cusTypeName = [aDecoder decodeObjectForKey:kcluesDataCusTypeName];
    self.dataIdentifier = [aDecoder decodeObjectForKey:kcluesDataId];
    self.cusType = [aDecoder decodeObjectForKey:kcluesDataCusType];
    self.ownerGroupId = [aDecoder decodeObjectForKey:kcluesDataOwnerGroupId];
    self.creatorName = [aDecoder decodeObjectForKey:kcluesDataCreatorName];
    self.orgName = [aDecoder decodeObjectForKey:kcluesDataOrgName];
    self.statusName = [aDecoder decodeObjectForKey:kcluesDataStatusName];
    self.cusId = [aDecoder decodeObjectForKey:kcluesDataCusId];
    self.followupResultName = [aDecoder decodeObjectForKey:kcluesDataFollowupResultName];
    self.startLevel = [aDecoder decodeObjectForKey:kcluesDataStartLevel];
    self.busiNatureName = [aDecoder decodeObjectForKey:kcluesDataBusiNatureName];
    self.ownerName = [aDecoder decodeObjectForKey:kcluesDataOwnerName];
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:_ownerId forKey:kcluesDataOwnerId];
    [aCoder encodeObject:_modifierName forKey:kcluesDataModifierName];
    [aCoder encodeObject:_modifierId forKey:kcluesDataModifierId];
    [aCoder encodeObject:_userNatureName forKey:kcluesDataUserNatureName];
    [aCoder encodeObject:_userNature forKey:kcluesDataUserNature];
    [aCoder encodeObject:_customerLevelName forKey:kcluesDataCustomerLevelName];
    [aCoder encodeObject:_tenementId forKey:kcluesDataTenementId];
    [aCoder encodeObject:_status forKey:kcluesDataStatus];
    [aCoder encodeObject:_busiDepartName forKey:kcluesDataBusiDepartName];
    [aCoder encodeObject:_creatorId forKey:kcluesDataCreatorId];
    [aCoder encodeObject:_dataDescription forKey:kcluesDataDescription];
    [aCoder encodeObject:_cusFullname forKey:kcluesDataCusFullname];
    [aCoder encodeObject:_orgId forKey:kcluesDataOrgId];
    [aCoder encodeObject:_busiNature forKey:kcluesDataBusiNature];
    [aCoder encodeObject:_busiDepart forKey:kcluesDataBusiDepart];
    [aCoder encodeObject:_followupResult forKey:kcluesDataFollowupResult];
    [aCoder encodeDouble:_createdDatetime forKey:kcluesDataCreatedDatetime];
    [aCoder encodeObject:_startLevelName forKey:kcluesDataStartLevelName];
    [aCoder encodeObject:_regionAddr forKey:kcluesDataRegionAddr];
    [aCoder encodeDouble:_modifiedDatetime forKey:kcluesDataModifiedDatetime];
    [aCoder encodeObject:_cusTypeName forKey:kcluesDataCusTypeName];
    [aCoder encodeObject:_dataIdentifier forKey:kcluesDataId];
    [aCoder encodeObject:_cusType forKey:kcluesDataCusType];
    [aCoder encodeObject:_ownerGroupId forKey:kcluesDataOwnerGroupId];
    [aCoder encodeObject:_creatorName forKey:kcluesDataCreatorName];
    [aCoder encodeObject:_orgName forKey:kcluesDataOrgName];
    [aCoder encodeObject:_statusName forKey:kcluesDataStatusName];
    [aCoder encodeObject:_cusId forKey:kcluesDataCusId];
    [aCoder encodeObject:_followupResultName forKey:kcluesDataFollowupResultName];
    [aCoder encodeObject:_startLevel forKey:kcluesDataStartLevel];
    [aCoder encodeObject:_busiNatureName forKey:kcluesDataBusiNatureName];
    [aCoder encodeObject:_ownerName forKey:kcluesDataOwnerName];
}

- (id)copyWithZone:(NSZone *)zone
{
    XQData *copy = [[XQData alloc] init];
    
    if (copy) {

        copy.ownerId = [self.ownerId copyWithZone:zone];
        copy.modifierName = [self.modifierName copyWithZone:zone];
        copy.modifierId = [self.modifierId copyWithZone:zone];
        copy.userNatureName = [self.userNatureName copyWithZone:zone];
        copy.userNature = [self.userNature copyWithZone:zone];
        copy.customerLevelName = [self.customerLevelName copyWithZone:zone];
        copy.tenementId = [self.tenementId copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.busiDepartName = [self.busiDepartName copyWithZone:zone];
        copy.creatorId = [self.creatorId copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.cusFullname = [self.cusFullname copyWithZone:zone];
        copy.orgId = [self.orgId copyWithZone:zone];
        copy.busiNature = [self.busiNature copyWithZone:zone];
        copy.busiDepart = [self.busiDepart copyWithZone:zone];
        copy.followupResult = [self.followupResult copyWithZone:zone];
        copy.createdDatetime = self.createdDatetime;
        copy.startLevelName = [self.startLevelName copyWithZone:zone];
        copy.regionAddr = [self.regionAddr copyWithZone:zone];
        copy.modifiedDatetime = self.modifiedDatetime;
        copy.cusTypeName = [self.cusTypeName copyWithZone:zone];
        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.cusType = [self.cusType copyWithZone:zone];
        copy.ownerGroupId = [self.ownerGroupId copyWithZone:zone];
        copy.creatorName = [self.creatorName copyWithZone:zone];
        copy.orgName = [self.orgName copyWithZone:zone];
        copy.statusName = [self.statusName copyWithZone:zone];
        copy.cusId = [self.cusId copyWithZone:zone];
        copy.followupResultName = [self.followupResultName copyWithZone:zone];
        copy.startLevel = [self.startLevel copyWithZone:zone];
        copy.busiNatureName = [self.busiNatureName copyWithZone:zone];
        copy.ownerName = [self.ownerName copyWithZone:zone];

    }
    
    return copy;
}


@end
