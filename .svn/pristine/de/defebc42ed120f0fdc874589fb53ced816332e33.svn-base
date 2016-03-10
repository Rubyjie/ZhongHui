//
//  cluesDatalist.m
//
//  Created by   on 15/12/25
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "cluesDatalist.h"


NSString *const kcluesDatalistOwnerGroupId = @"ownerGroupId";
NSString *const kcluesDatalistStartLevel = @"startLevel";
NSString *const kcluesDatalistCreatedDatetime = @"createdDatetime";
NSString *const kcluesDatalistId = @"id";
NSString *const kcluesDatalistTransferReasonName = @"transferReasonName";
NSString *const kcluesDatalistRegionIdProvince = @"regionIdProvince";
NSString *const kcluesDatalistFollowupResult = @"followupResult";
NSString *const kcluesDatalistCusId = @"cusId";
NSString *const kcluesDatalistUserNature = @"userNature";
NSString *const kcluesDatalistModifierName = @"modifierName";
NSString *const kcluesDatalistUserNatureName = @"userNatureName";
NSString *const kcluesDatalistBusiDepart = @"busiDepart";
NSString *const kcluesDatalistModifiedDatetime = @"modifiedDatetime";
NSString *const kcluesDatalistCPoints = @"CPoints";
NSString *const kcluesDatalistOwnerId = @"ownerId";
NSString *const kcluesDatalistOrgName = @"orgName";
NSString *const kcluesDatalistFindTime = @"findTime";
NSString *const kcluesDatalistRegionAddr = @"regionAddr";
NSString *const kcluesDatalistCContact = @"CContact";
NSString *const kcluesDatalistCusType = @"cusType";
NSString *const kcluesDatalistBusiDepartName = @"busiDepartName";
NSString *const kcluesDatalistFindSourceName = @"findSourceName";
NSString *const kcluesDatalistCloseResult = @"closeResult";
NSString *const kcluesDatalistStatus = @"status";
NSString *const kcluesDatalistCusFullname = @"cusFullname";
NSString *const kcluesDatalistCusTypeName = @"cusTypeName";
NSString *const kcluesDatalistRegionIdCountry = @"regionIdCountry";
NSString *const kcluesDatalistStatusName = @"statusName";
NSString *const kcluesDatalistModifierId = @"modifierId";
NSString *const kcluesDatalistOwnerName = @"ownerName";
NSString *const kcluesDatalistOpenDate = @"openDate";
NSString *const kcluesDatalistStartLevelName = @"startLevelName";
NSString *const kcluesDatalistBusiNatureName = @"busiNatureName";
NSString *const kcluesDatalistContactTimeLast = @"contactTimeLast";
NSString *const kcluesDatalistFollowupResultName = @"followupResultName";
NSString *const kcluesDatalistTransferReason = @"transferReason";
NSString *const kcluesDatalistFindSourceId = @"findSourceId";
NSString *const kcluesDatalistBusiNature = @"busiNature";
NSString *const kcluesDatalistOrgId = @"orgId";
NSString *const kcluesDatalistCustomerLevelName = @"customerLevelName";


@interface cluesDatalist ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation cluesDatalist

@synthesize ownerGroupId = _ownerGroupId;
@synthesize startLevel = _startLevel;
@synthesize createdDatetime = _createdDatetime;
@synthesize datalistIdentifier = _datalistIdentifier;
@synthesize transferReasonName = _transferReasonName;
@synthesize regionIdProvince = _regionIdProvince;
@synthesize followupResult = _followupResult;
@synthesize cusId = _cusId;
@synthesize userNature = _userNature;
@synthesize modifierName = _modifierName;
@synthesize userNatureName = _userNatureName;
@synthesize busiDepart = _busiDepart;
@synthesize modifiedDatetime = _modifiedDatetime;
@synthesize cPoints = _cPoints;
@synthesize ownerId = _ownerId;
@synthesize orgName = _orgName;
@synthesize findTime = _findTime;
@synthesize regionAddr = _regionAddr;
@synthesize cContact = _cContact;
@synthesize cusType = _cusType;
@synthesize busiDepartName = _busiDepartName;
@synthesize findSourceName = _findSourceName;
@synthesize closeResult = _closeResult;
@synthesize status = _status;
@synthesize cusFullname = _cusFullname;
@synthesize cusTypeName = _cusTypeName;
@synthesize regionIdCountry = _regionIdCountry;
@synthesize statusName = _statusName;
@synthesize modifierId = _modifierId;
@synthesize ownerName = _ownerName;
@synthesize openDate = _openDate;
@synthesize startLevelName = _startLevelName;
@synthesize busiNatureName = _busiNatureName;
@synthesize contactTimeLast = _contactTimeLast;
@synthesize followupResultName = _followupResultName;
@synthesize transferReason = _transferReason;
@synthesize findSourceId = _findSourceId;
@synthesize busiNature = _busiNature;
@synthesize orgId = _orgId;
@synthesize customerLevelName = _customerLevelName;

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
            self.ownerGroupId = [self objectOrNilForKey:kcluesDatalistOwnerGroupId fromDictionary:dict];
            self.startLevel = [self objectOrNilForKey:kcluesDatalistStartLevel fromDictionary:dict];
            self.createdDatetime = [[self objectOrNilForKey:kcluesDatalistCreatedDatetime fromDictionary:dict] doubleValue];
            self.datalistIdentifier = [self objectOrNilForKey:kcluesDatalistId fromDictionary:dict];
            self.transferReasonName = [self objectOrNilForKey:kcluesDatalistTransferReasonName fromDictionary:dict];
            self.regionIdProvince = [self objectOrNilForKey:kcluesDatalistRegionIdProvince fromDictionary:dict];
            self.followupResult = [self objectOrNilForKey:kcluesDatalistFollowupResult fromDictionary:dict];
            self.cusId = [self objectOrNilForKey:kcluesDatalistCusId fromDictionary:dict];
            self.userNature = [self objectOrNilForKey:kcluesDatalistUserNature fromDictionary:dict];
            self.modifierName = [self objectOrNilForKey:kcluesDatalistModifierName fromDictionary:dict];
            self.userNatureName = [self objectOrNilForKey:kcluesDatalistUserNatureName fromDictionary:dict];
            self.busiDepart = [self objectOrNilForKey:kcluesDatalistBusiDepart fromDictionary:dict];
            self.modifiedDatetime = [[self objectOrNilForKey:kcluesDatalistModifiedDatetime fromDictionary:dict] doubleValue];
            self.cPoints = [[self objectOrNilForKey:kcluesDatalistCPoints fromDictionary:dict] doubleValue];
            self.ownerId = [self objectOrNilForKey:kcluesDatalistOwnerId fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kcluesDatalistOrgName fromDictionary:dict];
            self.findTime = [[self objectOrNilForKey:kcluesDatalistFindTime fromDictionary:dict] doubleValue];
            self.regionAddr = [self objectOrNilForKey:kcluesDatalistRegionAddr fromDictionary:dict];
            self.cContact = [[self objectOrNilForKey:kcluesDatalistCContact fromDictionary:dict] doubleValue];
            self.cusType = [self objectOrNilForKey:kcluesDatalistCusType fromDictionary:dict];
            self.busiDepartName = [self objectOrNilForKey:kcluesDatalistBusiDepartName fromDictionary:dict];
            self.findSourceName = [self objectOrNilForKey:kcluesDatalistFindSourceName fromDictionary:dict];
            self.closeResult = [self objectOrNilForKey:kcluesDatalistCloseResult fromDictionary:dict];
            self.status = [self objectOrNilForKey:kcluesDatalistStatus fromDictionary:dict];
            self.cusFullname = [self objectOrNilForKey:kcluesDatalistCusFullname fromDictionary:dict];
            self.cusTypeName = [self objectOrNilForKey:kcluesDatalistCusTypeName fromDictionary:dict];
            self.regionIdCountry = [self objectOrNilForKey:kcluesDatalistRegionIdCountry fromDictionary:dict];
            self.statusName = [self objectOrNilForKey:kcluesDatalistStatusName fromDictionary:dict];
            self.modifierId = [self objectOrNilForKey:kcluesDatalistModifierId fromDictionary:dict];
            self.ownerName = [self objectOrNilForKey:kcluesDatalistOwnerName fromDictionary:dict];
            self.openDate = [[self objectOrNilForKey:kcluesDatalistOpenDate fromDictionary:dict] doubleValue];
            self.startLevelName = [self objectOrNilForKey:kcluesDatalistStartLevelName fromDictionary:dict];
            self.busiNatureName = [self objectOrNilForKey:kcluesDatalistBusiNatureName fromDictionary:dict];
            self.contactTimeLast = [[self objectOrNilForKey:kcluesDatalistContactTimeLast fromDictionary:dict] doubleValue];
            self.followupResultName = [self objectOrNilForKey:kcluesDatalistFollowupResultName fromDictionary:dict];
            self.transferReason = [self objectOrNilForKey:kcluesDatalistTransferReason fromDictionary:dict];
            self.findSourceId = [self objectOrNilForKey:kcluesDatalistFindSourceId fromDictionary:dict];
            self.busiNature = [self objectOrNilForKey:kcluesDatalistBusiNature fromDictionary:dict];
            self.orgId = [self objectOrNilForKey:kcluesDatalistOrgId fromDictionary:dict];
            self.customerLevelName = [self objectOrNilForKey:kcluesDatalistCustomerLevelName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.ownerGroupId forKey:kcluesDatalistOwnerGroupId];
    [mutableDict setValue:self.startLevel forKey:kcluesDatalistStartLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdDatetime] forKey:kcluesDatalistCreatedDatetime];
    [mutableDict setValue:self.datalistIdentifier forKey:kcluesDatalistId];
    [mutableDict setValue:self.transferReasonName forKey:kcluesDatalistTransferReasonName];
    [mutableDict setValue:self.regionIdProvince forKey:kcluesDatalistRegionIdProvince];
    [mutableDict setValue:self.followupResult forKey:kcluesDatalistFollowupResult];
    [mutableDict setValue:self.cusId forKey:kcluesDatalistCusId];
    [mutableDict setValue:self.userNature forKey:kcluesDatalistUserNature];
    [mutableDict setValue:self.modifierName forKey:kcluesDatalistModifierName];
    [mutableDict setValue:self.userNatureName forKey:kcluesDatalistUserNatureName];
    [mutableDict setValue:self.busiDepart forKey:kcluesDatalistBusiDepart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifiedDatetime] forKey:kcluesDatalistModifiedDatetime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cPoints] forKey:kcluesDatalistCPoints];
    [mutableDict setValue:self.ownerId forKey:kcluesDatalistOwnerId];
    [mutableDict setValue:self.orgName forKey:kcluesDatalistOrgName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.findTime] forKey:kcluesDatalistFindTime];
    [mutableDict setValue:self.regionAddr forKey:kcluesDatalistRegionAddr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cContact] forKey:kcluesDatalistCContact];
    [mutableDict setValue:self.cusType forKey:kcluesDatalistCusType];
    [mutableDict setValue:self.busiDepartName forKey:kcluesDatalistBusiDepartName];
    [mutableDict setValue:self.findSourceName forKey:kcluesDatalistFindSourceName];
    [mutableDict setValue:self.closeResult forKey:kcluesDatalistCloseResult];
    [mutableDict setValue:self.status forKey:kcluesDatalistStatus];
    [mutableDict setValue:self.cusFullname forKey:kcluesDatalistCusFullname];
    [mutableDict setValue:self.cusTypeName forKey:kcluesDatalistCusTypeName];
    [mutableDict setValue:self.regionIdCountry forKey:kcluesDatalistRegionIdCountry];
    [mutableDict setValue:self.statusName forKey:kcluesDatalistStatusName];
    [mutableDict setValue:self.modifierId forKey:kcluesDatalistModifierId];
    [mutableDict setValue:self.ownerName forKey:kcluesDatalistOwnerName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.openDate] forKey:kcluesDatalistOpenDate];
    [mutableDict setValue:self.startLevelName forKey:kcluesDatalistStartLevelName];
    [mutableDict setValue:self.busiNatureName forKey:kcluesDatalistBusiNatureName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.contactTimeLast] forKey:kcluesDatalistContactTimeLast];
    [mutableDict setValue:self.followupResultName forKey:kcluesDatalistFollowupResultName];
    [mutableDict setValue:self.transferReason forKey:kcluesDatalistTransferReason];
    [mutableDict setValue:self.findSourceId forKey:kcluesDatalistFindSourceId];
    [mutableDict setValue:self.busiNature forKey:kcluesDatalistBusiNature];
    [mutableDict setValue:self.orgId forKey:kcluesDatalistOrgId];
    [mutableDict setValue:self.customerLevelName forKey:kcluesDatalistCustomerLevelName];

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

    self.ownerGroupId = [aDecoder decodeObjectForKey:kcluesDatalistOwnerGroupId];
    self.startLevel = [aDecoder decodeObjectForKey:kcluesDatalistStartLevel];
    self.createdDatetime = [aDecoder decodeDoubleForKey:kcluesDatalistCreatedDatetime];
    self.datalistIdentifier = [aDecoder decodeObjectForKey:kcluesDatalistId];
    self.transferReasonName = [aDecoder decodeObjectForKey:kcluesDatalistTransferReasonName];
    self.regionIdProvince = [aDecoder decodeObjectForKey:kcluesDatalistRegionIdProvince];
    self.followupResult = [aDecoder decodeObjectForKey:kcluesDatalistFollowupResult];
    self.cusId = [aDecoder decodeObjectForKey:kcluesDatalistCusId];
    self.userNature = [aDecoder decodeObjectForKey:kcluesDatalistUserNature];
    self.modifierName = [aDecoder decodeObjectForKey:kcluesDatalistModifierName];
    self.userNatureName = [aDecoder decodeObjectForKey:kcluesDatalistUserNatureName];
    self.busiDepart = [aDecoder decodeObjectForKey:kcluesDatalistBusiDepart];
    self.modifiedDatetime = [aDecoder decodeDoubleForKey:kcluesDatalistModifiedDatetime];
    self.cPoints = [aDecoder decodeDoubleForKey:kcluesDatalistCPoints];
    self.ownerId = [aDecoder decodeObjectForKey:kcluesDatalistOwnerId];
    self.orgName = [aDecoder decodeObjectForKey:kcluesDatalistOrgName];
    self.findTime = [aDecoder decodeDoubleForKey:kcluesDatalistFindTime];
    self.regionAddr = [aDecoder decodeObjectForKey:kcluesDatalistRegionAddr];
    self.cContact = [aDecoder decodeDoubleForKey:kcluesDatalistCContact];
    self.cusType = [aDecoder decodeObjectForKey:kcluesDatalistCusType];
    self.busiDepartName = [aDecoder decodeObjectForKey:kcluesDatalistBusiDepartName];
    self.findSourceName = [aDecoder decodeObjectForKey:kcluesDatalistFindSourceName];
    self.closeResult = [aDecoder decodeObjectForKey:kcluesDatalistCloseResult];
    self.status = [aDecoder decodeObjectForKey:kcluesDatalistStatus];
    self.cusFullname = [aDecoder decodeObjectForKey:kcluesDatalistCusFullname];
    self.cusTypeName = [aDecoder decodeObjectForKey:kcluesDatalistCusTypeName];
    self.regionIdCountry = [aDecoder decodeObjectForKey:kcluesDatalistRegionIdCountry];
    self.statusName = [aDecoder decodeObjectForKey:kcluesDatalistStatusName];
    self.modifierId = [aDecoder decodeObjectForKey:kcluesDatalistModifierId];
    self.ownerName = [aDecoder decodeObjectForKey:kcluesDatalistOwnerName];
    self.openDate = [aDecoder decodeDoubleForKey:kcluesDatalistOpenDate];
    self.startLevelName = [aDecoder decodeObjectForKey:kcluesDatalistStartLevelName];
    self.busiNatureName = [aDecoder decodeObjectForKey:kcluesDatalistBusiNatureName];
    self.contactTimeLast = [aDecoder decodeDoubleForKey:kcluesDatalistContactTimeLast];
    self.followupResultName = [aDecoder decodeObjectForKey:kcluesDatalistFollowupResultName];
    self.transferReason = [aDecoder decodeObjectForKey:kcluesDatalistTransferReason];
    self.findSourceId = [aDecoder decodeObjectForKey:kcluesDatalistFindSourceId];
    self.busiNature = [aDecoder decodeObjectForKey:kcluesDatalistBusiNature];
    self.orgId = [aDecoder decodeObjectForKey:kcluesDatalistOrgId];
    self.customerLevelName = [aDecoder decodeObjectForKey:kcluesDatalistCustomerLevelName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ownerGroupId forKey:kcluesDatalistOwnerGroupId];
    [aCoder encodeObject:_startLevel forKey:kcluesDatalistStartLevel];
    [aCoder encodeDouble:_createdDatetime forKey:kcluesDatalistCreatedDatetime];
    [aCoder encodeObject:_datalistIdentifier forKey:kcluesDatalistId];
    [aCoder encodeObject:_transferReasonName forKey:kcluesDatalistTransferReasonName];
    [aCoder encodeObject:_regionIdProvince forKey:kcluesDatalistRegionIdProvince];
    [aCoder encodeObject:_followupResult forKey:kcluesDatalistFollowupResult];
    [aCoder encodeObject:_cusId forKey:kcluesDatalistCusId];
    [aCoder encodeObject:_userNature forKey:kcluesDatalistUserNature];
    [aCoder encodeObject:_modifierName forKey:kcluesDatalistModifierName];
    [aCoder encodeObject:_userNatureName forKey:kcluesDatalistUserNatureName];
    [aCoder encodeObject:_busiDepart forKey:kcluesDatalistBusiDepart];
    [aCoder encodeDouble:_modifiedDatetime forKey:kcluesDatalistModifiedDatetime];
    [aCoder encodeDouble:_cPoints forKey:kcluesDatalistCPoints];
    [aCoder encodeObject:_ownerId forKey:kcluesDatalistOwnerId];
    [aCoder encodeObject:_orgName forKey:kcluesDatalistOrgName];
    [aCoder encodeDouble:_findTime forKey:kcluesDatalistFindTime];
    [aCoder encodeObject:_regionAddr forKey:kcluesDatalistRegionAddr];
    [aCoder encodeDouble:_cContact forKey:kcluesDatalistCContact];
    [aCoder encodeObject:_cusType forKey:kcluesDatalistCusType];
    [aCoder encodeObject:_busiDepartName forKey:kcluesDatalistBusiDepartName];
    [aCoder encodeObject:_findSourceName forKey:kcluesDatalistFindSourceName];
    [aCoder encodeObject:_closeResult forKey:kcluesDatalistCloseResult];
    [aCoder encodeObject:_status forKey:kcluesDatalistStatus];
    [aCoder encodeObject:_cusFullname forKey:kcluesDatalistCusFullname];
    [aCoder encodeObject:_cusTypeName forKey:kcluesDatalistCusTypeName];
    [aCoder encodeObject:_regionIdCountry forKey:kcluesDatalistRegionIdCountry];
    [aCoder encodeObject:_statusName forKey:kcluesDatalistStatusName];
    [aCoder encodeObject:_modifierId forKey:kcluesDatalistModifierId];
    [aCoder encodeObject:_ownerName forKey:kcluesDatalistOwnerName];
    [aCoder encodeDouble:_openDate forKey:kcluesDatalistOpenDate];
    [aCoder encodeObject:_startLevelName forKey:kcluesDatalistStartLevelName];
    [aCoder encodeObject:_busiNatureName forKey:kcluesDatalistBusiNatureName];
    [aCoder encodeDouble:_contactTimeLast forKey:kcluesDatalistContactTimeLast];
    [aCoder encodeObject:_followupResultName forKey:kcluesDatalistFollowupResultName];
    [aCoder encodeObject:_transferReason forKey:kcluesDatalistTransferReason];
    [aCoder encodeObject:_findSourceId forKey:kcluesDatalistFindSourceId];
    [aCoder encodeObject:_busiNature forKey:kcluesDatalistBusiNature];
    [aCoder encodeObject:_orgId forKey:kcluesDatalistOrgId];
    [aCoder encodeObject:_customerLevelName forKey:kcluesDatalistCustomerLevelName];
}

- (id)copyWithZone:(NSZone *)zone
{
    cluesDatalist *copy = [[cluesDatalist alloc] init];
    
    if (copy) {

        copy.ownerGroupId = [self.ownerGroupId copyWithZone:zone];
        copy.startLevel = [self.startLevel copyWithZone:zone];
        copy.createdDatetime = self.createdDatetime;
        copy.datalistIdentifier = [self.datalistIdentifier copyWithZone:zone];
        copy.transferReasonName = [self.transferReasonName copyWithZone:zone];
        copy.regionIdProvince = [self.regionIdProvince copyWithZone:zone];
        copy.followupResult = [self.followupResult copyWithZone:zone];
        copy.cusId = [self.cusId copyWithZone:zone];
        copy.userNature = [self.userNature copyWithZone:zone];
        copy.modifierName = [self.modifierName copyWithZone:zone];
        copy.userNatureName = [self.userNatureName copyWithZone:zone];
        copy.busiDepart = [self.busiDepart copyWithZone:zone];
        copy.modifiedDatetime = self.modifiedDatetime;
        copy.cPoints = self.cPoints;
        copy.ownerId = [self.ownerId copyWithZone:zone];
        copy.orgName = [self.orgName copyWithZone:zone];
        copy.findTime = self.findTime;
        copy.regionAddr = [self.regionAddr copyWithZone:zone];
        copy.cContact = self.cContact;
        copy.cusType = [self.cusType copyWithZone:zone];
        copy.busiDepartName = [self.busiDepartName copyWithZone:zone];
        copy.findSourceName = [self.findSourceName copyWithZone:zone];
        copy.closeResult = [self.closeResult copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.cusFullname = [self.cusFullname copyWithZone:zone];
        copy.cusTypeName = [self.cusTypeName copyWithZone:zone];
        copy.regionIdCountry = [self.regionIdCountry copyWithZone:zone];
        copy.statusName = [self.statusName copyWithZone:zone];
        copy.modifierId = [self.modifierId copyWithZone:zone];
        copy.ownerName = [self.ownerName copyWithZone:zone];
        copy.openDate = self.openDate;
        copy.startLevelName = [self.startLevelName copyWithZone:zone];
        copy.busiNatureName = [self.busiNatureName copyWithZone:zone];
        copy.contactTimeLast = self.contactTimeLast;
        copy.followupResultName = [self.followupResultName copyWithZone:zone];
        copy.transferReason = [self.transferReason copyWithZone:zone];
        copy.findSourceId = [self.findSourceId copyWithZone:zone];
        copy.busiNature = [self.busiNature copyWithZone:zone];
        copy.orgId = [self.orgId copyWithZone:zone];
        copy.customerLevelName = [self.customerLevelName copyWithZone:zone];
    }
    
    return copy;
}


@end
