//
//  CluesXqData.m
//
//  Created by   on 16/1/20
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CluesXqData.h"


NSString *const kCluesXqDataUserSize = @"userSize";
NSString *const kCluesXqDataStartLevel = @"startLevel";
NSString *const kCluesXqDataOrgId = @"orgId";
NSString *const kCluesXqDataUserSizeName = @"userSizeName";
NSString *const kCluesXqDataId = @"id";
NSString *const kCluesXqDataCreatorId = @"creatorId";
NSString *const kCluesXqDataCustomerLevelName = @"customerLevelName";
NSString *const kCluesXqDataRegionIdProvince = @"regionIdProvince";
NSString *const kCluesXqDataRegionIdProvinceName = @"regionIdProvinceName";
NSString *const kCluesXqDataCusId = @"cusId";
NSString *const kCluesXqDataDescription = @"description";
NSString *const kCluesXqDataUserNature = @"userNature";
NSString *const kCluesXqDataUserNatureName = @"userNatureName";
NSString *const kCluesXqDataModifierName = @"modifierName";
NSString *const kCluesXqDataBusiDepart = @"busiDepart";
NSString *const kCluesXqDataModifiedDatetime = @"modifiedDatetime";
NSString *const kCluesXqDataUserArea = @"userArea";
NSString *const kCluesXqDataOwnerId = @"ownerId";
NSString *const kCluesXqDataCreatorName = @"creatorName";
NSString *const kCluesXqDataOrgName = @"orgName";
NSString *const kCluesXqDataTripArea = @"tripArea";
NSString *const kCluesXqDataFindTime = @"findTime";
NSString *const kCluesXqDataUserAreaName = @"userAreaName";
NSString *const kCluesXqDataFinderName = @"finderName";
NSString *const kCluesXqDataRegionAddr = @"regionAddr";
NSString *const kCluesXqDataRegionIdDistrict = @"regionIdDistrict";
NSString *const kCluesXqDataCContact = @"CContact";
NSString *const kCluesXqDataBusiDepartName = @"busiDepartName";
NSString *const kCluesXqDataCusType = @"cusType";
NSString *const kCluesXqDataTripAreaName = @"tripAreaName";
NSString *const kCluesXqDataFinderId = @"finderId";
NSString *const kCluesXqDataStatus = @"status";
NSString *const kCluesXqDataCusFullname = @"cusFullname";
NSString *const kCluesXqDataCusTypeName = @"cusTypeName";
NSString *const kCluesXqDataRegionIdCountry = @"regionIdCountry";
NSString *const kCluesXqDataManagerPartyName = @"managerPartyName";
NSString *const kCluesXqDataStatusName = @"statusName";
NSString *const kCluesXqDataCreatedDatetime = @"createdDatetime";
NSString *const kCluesXqDataRegionIdCity = @"regionIdCity";
NSString *const kCluesXqDataModifierId = @"modifierId";
NSString *const kCluesXqDataOwnerName = @"ownerName";
NSString *const kCluesXqDataOpenDate = @"openDate";
NSString *const kCluesXqDataStartLevelName = @"startLevelName";
NSString *const kCluesXqDataRegionIdDistrictName = @"regionIdDistrictName";
NSString *const kCluesXqDataBusiNatureName = @"busiNatureName";
NSString *const kCluesXqDataRegionIdCityName = @"regionIdCityName";
NSString *const kCluesXqDataBusiNature = @"busiNature";
NSString *const kCluesXqDataFindSourceId = @"findSourceId";
NSString *const kCluesXqDataTenementId = @"tenementId";
NSString *const kCluesXqDataRegionIdCountryName = @"regionIdCountryName";


@interface CluesXqData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CluesXqData

@synthesize userSize = _userSize;
@synthesize startLevel = _startLevel;
@synthesize orgId = _orgId;
@synthesize userSizeName = _userSizeName;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize creatorId = _creatorId;
@synthesize customerLevelName = _customerLevelName;
@synthesize regionIdProvince = _regionIdProvince;
@synthesize regionIdProvinceName = _regionIdProvinceName;
@synthesize cusId = _cusId;
@synthesize dataDescription = _dataDescription;
@synthesize userNature = _userNature;
@synthesize userNatureName = _userNatureName;
@synthesize modifierName = _modifierName;
@synthesize busiDepart = _busiDepart;
@synthesize modifiedDatetime = _modifiedDatetime;
@synthesize userArea = _userArea;
@synthesize ownerId = _ownerId;
@synthesize creatorName = _creatorName;
@synthesize orgName = _orgName;
@synthesize tripArea = _tripArea;
@synthesize findTime = _findTime;
@synthesize userAreaName = _userAreaName;
@synthesize finderName = _finderName;
@synthesize regionAddr = _regionAddr;
@synthesize regionIdDistrict = _regionIdDistrict;
@synthesize cContact = _cContact;
@synthesize busiDepartName = _busiDepartName;
@synthesize cusType = _cusType;
@synthesize tripAreaName = _tripAreaName;
@synthesize finderId = _finderId;
@synthesize status = _status;
@synthesize cusFullname = _cusFullname;
@synthesize cusTypeName = _cusTypeName;
@synthesize regionIdCountry = _regionIdCountry;
@synthesize managerPartyName = _managerPartyName;
@synthesize statusName = _statusName;
@synthesize createdDatetime = _createdDatetime;
@synthesize regionIdCity = _regionIdCity;
@synthesize modifierId = _modifierId;
@synthesize ownerName = _ownerName;
@synthesize openDate = _openDate;
@synthesize startLevelName = _startLevelName;
@synthesize regionIdDistrictName = _regionIdDistrictName;
@synthesize busiNatureName = _busiNatureName;
@synthesize regionIdCityName = _regionIdCityName;
@synthesize busiNature = _busiNature;
@synthesize findSourceId = _findSourceId;
@synthesize tenementId = _tenementId;
@synthesize regionIdCountryName = _regionIdCountryName;


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
            self.userSize = [self objectOrNilForKey:kCluesXqDataUserSize fromDictionary:dict];
            self.startLevel = [self objectOrNilForKey:kCluesXqDataStartLevel fromDictionary:dict];
            self.orgId = [self objectOrNilForKey:kCluesXqDataOrgId fromDictionary:dict];
            self.userSizeName = [self objectOrNilForKey:kCluesXqDataUserSizeName fromDictionary:dict];
            self.dataIdentifier = [self objectOrNilForKey:kCluesXqDataId fromDictionary:dict];
            self.creatorId = [self objectOrNilForKey:kCluesXqDataCreatorId fromDictionary:dict];
            self.customerLevelName = [self objectOrNilForKey:kCluesXqDataCustomerLevelName fromDictionary:dict];
            self.regionIdProvince = [self objectOrNilForKey:kCluesXqDataRegionIdProvince fromDictionary:dict];
            self.regionIdProvinceName = [self objectOrNilForKey:kCluesXqDataRegionIdProvinceName fromDictionary:dict];
            self.cusId = [self objectOrNilForKey:kCluesXqDataCusId fromDictionary:dict];
            self.dataDescription = [self objectOrNilForKey:kCluesXqDataDescription fromDictionary:dict];
            self.userNature = [self objectOrNilForKey:kCluesXqDataUserNature fromDictionary:dict];
            self.userNatureName = [self objectOrNilForKey:kCluesXqDataUserNatureName fromDictionary:dict];
            self.modifierName = [self objectOrNilForKey:kCluesXqDataModifierName fromDictionary:dict];
            self.busiDepart = [self objectOrNilForKey:kCluesXqDataBusiDepart fromDictionary:dict];
            self.modifiedDatetime = [[self objectOrNilForKey:kCluesXqDataModifiedDatetime fromDictionary:dict] doubleValue];
            self.userArea = [self objectOrNilForKey:kCluesXqDataUserArea fromDictionary:dict];
            self.ownerId = [self objectOrNilForKey:kCluesXqDataOwnerId fromDictionary:dict];
            self.creatorName = [self objectOrNilForKey:kCluesXqDataCreatorName fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kCluesXqDataOrgName fromDictionary:dict];
            self.tripArea = [self objectOrNilForKey:kCluesXqDataTripArea fromDictionary:dict];
            self.findTime = [[self objectOrNilForKey:kCluesXqDataFindTime fromDictionary:dict] doubleValue];
            self.userAreaName = [self objectOrNilForKey:kCluesXqDataUserAreaName fromDictionary:dict];
            self.finderName = [self objectOrNilForKey:kCluesXqDataFinderName fromDictionary:dict];
            self.regionAddr = [self objectOrNilForKey:kCluesXqDataRegionAddr fromDictionary:dict];
            self.regionIdDistrict = [self objectOrNilForKey:kCluesXqDataRegionIdDistrict fromDictionary:dict];
            self.cContact = [[self objectOrNilForKey:kCluesXqDataCContact fromDictionary:dict] doubleValue];
            self.busiDepartName = [self objectOrNilForKey:kCluesXqDataBusiDepartName fromDictionary:dict];
            self.cusType = [self objectOrNilForKey:kCluesXqDataCusType fromDictionary:dict];
            self.tripAreaName = [self objectOrNilForKey:kCluesXqDataTripAreaName fromDictionary:dict];
            self.finderId = [self objectOrNilForKey:kCluesXqDataFinderId fromDictionary:dict];
            self.status = [self objectOrNilForKey:kCluesXqDataStatus fromDictionary:dict];
            self.cusFullname = [self objectOrNilForKey:kCluesXqDataCusFullname fromDictionary:dict];
            self.cusTypeName = [self objectOrNilForKey:kCluesXqDataCusTypeName fromDictionary:dict];
            self.regionIdCountry = [self objectOrNilForKey:kCluesXqDataRegionIdCountry fromDictionary:dict];
            self.managerPartyName = [self objectOrNilForKey:kCluesXqDataManagerPartyName fromDictionary:dict];
            self.statusName = [self objectOrNilForKey:kCluesXqDataStatusName fromDictionary:dict];
            self.createdDatetime = [[self objectOrNilForKey:kCluesXqDataCreatedDatetime fromDictionary:dict] doubleValue];
            self.regionIdCity = [self objectOrNilForKey:kCluesXqDataRegionIdCity fromDictionary:dict];
            self.modifierId = [self objectOrNilForKey:kCluesXqDataModifierId fromDictionary:dict];
            self.ownerName = [self objectOrNilForKey:kCluesXqDataOwnerName fromDictionary:dict];
            self.openDate = [[self objectOrNilForKey:kCluesXqDataOpenDate fromDictionary:dict] doubleValue];
            self.startLevelName = [self objectOrNilForKey:kCluesXqDataStartLevelName fromDictionary:dict];
            self.regionIdDistrictName = [self objectOrNilForKey:kCluesXqDataRegionIdDistrictName fromDictionary:dict];
            self.busiNatureName = [self objectOrNilForKey:kCluesXqDataBusiNatureName fromDictionary:dict];
            self.regionIdCityName = [self objectOrNilForKey:kCluesXqDataRegionIdCityName fromDictionary:dict];
            self.busiNature = [self objectOrNilForKey:kCluesXqDataBusiNature fromDictionary:dict];
            self.findSourceId = [self objectOrNilForKey:kCluesXqDataFindSourceId fromDictionary:dict];
            self.tenementId = [self objectOrNilForKey:kCluesXqDataTenementId fromDictionary:dict];
            self.regionIdCountryName = [self objectOrNilForKey:kCluesXqDataRegionIdCountryName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.userSize forKey:kCluesXqDataUserSize];
    [mutableDict setValue:self.startLevel forKey:kCluesXqDataStartLevel];
    [mutableDict setValue:self.orgId forKey:kCluesXqDataOrgId];
    [mutableDict setValue:self.userSizeName forKey:kCluesXqDataUserSizeName];
    [mutableDict setValue:self.dataIdentifier forKey:kCluesXqDataId];
    [mutableDict setValue:self.creatorId forKey:kCluesXqDataCreatorId];
    [mutableDict setValue:self.customerLevelName forKey:kCluesXqDataCustomerLevelName];
    [mutableDict setValue:self.regionIdProvince forKey:kCluesXqDataRegionIdProvince];
    [mutableDict setValue:self.regionIdProvinceName forKey:kCluesXqDataRegionIdProvinceName];
    [mutableDict setValue:self.cusId forKey:kCluesXqDataCusId];
    [mutableDict setValue:self.dataDescription forKey:kCluesXqDataDescription];
    [mutableDict setValue:self.userNature forKey:kCluesXqDataUserNature];
    [mutableDict setValue:self.userNatureName forKey:kCluesXqDataUserNatureName];
    [mutableDict setValue:self.modifierName forKey:kCluesXqDataModifierName];
    [mutableDict setValue:self.busiDepart forKey:kCluesXqDataBusiDepart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifiedDatetime] forKey:kCluesXqDataModifiedDatetime];
    [mutableDict setValue:self.userArea forKey:kCluesXqDataUserArea];
    [mutableDict setValue:self.ownerId forKey:kCluesXqDataOwnerId];
    [mutableDict setValue:self.creatorName forKey:kCluesXqDataCreatorName];
    [mutableDict setValue:self.orgName forKey:kCluesXqDataOrgName];
    [mutableDict setValue:self.tripArea forKey:kCluesXqDataTripArea];
    [mutableDict setValue:[NSNumber numberWithDouble:self.findTime] forKey:kCluesXqDataFindTime];
    [mutableDict setValue:self.userAreaName forKey:kCluesXqDataUserAreaName];
    [mutableDict setValue:self.finderName forKey:kCluesXqDataFinderName];
    [mutableDict setValue:self.regionAddr forKey:kCluesXqDataRegionAddr];
    [mutableDict setValue:self.regionIdDistrict forKey:kCluesXqDataRegionIdDistrict];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cContact] forKey:kCluesXqDataCContact];
    [mutableDict setValue:self.busiDepartName forKey:kCluesXqDataBusiDepartName];
    [mutableDict setValue:self.cusType forKey:kCluesXqDataCusType];
    [mutableDict setValue:self.tripAreaName forKey:kCluesXqDataTripAreaName];
    [mutableDict setValue:self.finderId forKey:kCluesXqDataFinderId];
    [mutableDict setValue:self.status forKey:kCluesXqDataStatus];
    [mutableDict setValue:self.cusFullname forKey:kCluesXqDataCusFullname];
    [mutableDict setValue:self.cusTypeName forKey:kCluesXqDataCusTypeName];
    [mutableDict setValue:self.regionIdCountry forKey:kCluesXqDataRegionIdCountry];
    [mutableDict setValue:self.managerPartyName forKey:kCluesXqDataManagerPartyName];
    [mutableDict setValue:self.statusName forKey:kCluesXqDataStatusName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdDatetime] forKey:kCluesXqDataCreatedDatetime];
    [mutableDict setValue:self.regionIdCity forKey:kCluesXqDataRegionIdCity];
    [mutableDict setValue:self.modifierId forKey:kCluesXqDataModifierId];
    [mutableDict setValue:self.ownerName forKey:kCluesXqDataOwnerName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.openDate] forKey:kCluesXqDataOpenDate];
    [mutableDict setValue:self.startLevelName forKey:kCluesXqDataStartLevelName];
    [mutableDict setValue:self.regionIdDistrictName forKey:kCluesXqDataRegionIdDistrictName];
    [mutableDict setValue:self.busiNatureName forKey:kCluesXqDataBusiNatureName];
    [mutableDict setValue:self.regionIdCityName forKey:kCluesXqDataRegionIdCityName];
    [mutableDict setValue:self.busiNature forKey:kCluesXqDataBusiNature];
    [mutableDict setValue:self.findSourceId forKey:kCluesXqDataFindSourceId];
    [mutableDict setValue:self.tenementId forKey:kCluesXqDataTenementId];
    [mutableDict setValue:self.regionIdCountryName forKey:kCluesXqDataRegionIdCountryName];

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

    self.userSize = [aDecoder decodeObjectForKey:kCluesXqDataUserSize];
    self.startLevel = [aDecoder decodeObjectForKey:kCluesXqDataStartLevel];
    self.orgId = [aDecoder decodeObjectForKey:kCluesXqDataOrgId];
    self.userSizeName = [aDecoder decodeObjectForKey:kCluesXqDataUserSizeName];
    self.dataIdentifier = [aDecoder decodeObjectForKey:kCluesXqDataId];
    self.creatorId = [aDecoder decodeObjectForKey:kCluesXqDataCreatorId];
    self.customerLevelName = [aDecoder decodeObjectForKey:kCluesXqDataCustomerLevelName];
    self.regionIdProvince = [aDecoder decodeObjectForKey:kCluesXqDataRegionIdProvince];
    self.regionIdProvinceName = [aDecoder decodeObjectForKey:kCluesXqDataRegionIdProvinceName];
    self.cusId = [aDecoder decodeObjectForKey:kCluesXqDataCusId];
    self.dataDescription = [aDecoder decodeObjectForKey:kCluesXqDataDescription];
    self.userNature = [aDecoder decodeObjectForKey:kCluesXqDataUserNature];
    self.userNatureName = [aDecoder decodeObjectForKey:kCluesXqDataUserNatureName];
    self.modifierName = [aDecoder decodeObjectForKey:kCluesXqDataModifierName];
    self.busiDepart = [aDecoder decodeObjectForKey:kCluesXqDataBusiDepart];
    self.modifiedDatetime = [aDecoder decodeDoubleForKey:kCluesXqDataModifiedDatetime];
    self.userArea = [aDecoder decodeObjectForKey:kCluesXqDataUserArea];
    self.ownerId = [aDecoder decodeObjectForKey:kCluesXqDataOwnerId];
    self.creatorName = [aDecoder decodeObjectForKey:kCluesXqDataCreatorName];
    self.orgName = [aDecoder decodeObjectForKey:kCluesXqDataOrgName];
    self.tripArea = [aDecoder decodeObjectForKey:kCluesXqDataTripArea];
    self.findTime = [aDecoder decodeDoubleForKey:kCluesXqDataFindTime];
    self.userAreaName = [aDecoder decodeObjectForKey:kCluesXqDataUserAreaName];
    self.finderName = [aDecoder decodeObjectForKey:kCluesXqDataFinderName];
    self.regionAddr = [aDecoder decodeObjectForKey:kCluesXqDataRegionAddr];
    self.regionIdDistrict = [aDecoder decodeObjectForKey:kCluesXqDataRegionIdDistrict];
    self.cContact = [aDecoder decodeDoubleForKey:kCluesXqDataCContact];
    self.busiDepartName = [aDecoder decodeObjectForKey:kCluesXqDataBusiDepartName];
    self.cusType = [aDecoder decodeObjectForKey:kCluesXqDataCusType];
    self.tripAreaName = [aDecoder decodeObjectForKey:kCluesXqDataTripAreaName];
    self.finderId = [aDecoder decodeObjectForKey:kCluesXqDataFinderId];
    self.status = [aDecoder decodeObjectForKey:kCluesXqDataStatus];
    self.cusFullname = [aDecoder decodeObjectForKey:kCluesXqDataCusFullname];
    self.cusTypeName = [aDecoder decodeObjectForKey:kCluesXqDataCusTypeName];
    self.regionIdCountry = [aDecoder decodeObjectForKey:kCluesXqDataRegionIdCountry];
    self.managerPartyName = [aDecoder decodeObjectForKey:kCluesXqDataManagerPartyName];
    self.statusName = [aDecoder decodeObjectForKey:kCluesXqDataStatusName];
    self.createdDatetime = [aDecoder decodeDoubleForKey:kCluesXqDataCreatedDatetime];
    self.regionIdCity = [aDecoder decodeObjectForKey:kCluesXqDataRegionIdCity];
    self.modifierId = [aDecoder decodeObjectForKey:kCluesXqDataModifierId];
    self.ownerName = [aDecoder decodeObjectForKey:kCluesXqDataOwnerName];
    self.openDate = [aDecoder decodeDoubleForKey:kCluesXqDataOpenDate];
    self.startLevelName = [aDecoder decodeObjectForKey:kCluesXqDataStartLevelName];
    self.regionIdDistrictName = [aDecoder decodeObjectForKey:kCluesXqDataRegionIdDistrictName];
    self.busiNatureName = [aDecoder decodeObjectForKey:kCluesXqDataBusiNatureName];
    self.regionIdCityName = [aDecoder decodeObjectForKey:kCluesXqDataRegionIdCityName];
    self.busiNature = [aDecoder decodeObjectForKey:kCluesXqDataBusiNature];
    self.findSourceId = [aDecoder decodeObjectForKey:kCluesXqDataFindSourceId];
    self.tenementId = [aDecoder decodeObjectForKey:kCluesXqDataTenementId];
    self.regionIdCountryName = [aDecoder decodeObjectForKey:kCluesXqDataRegionIdCountryName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_userSize forKey:kCluesXqDataUserSize];
    [aCoder encodeObject:_startLevel forKey:kCluesXqDataStartLevel];
    [aCoder encodeObject:_orgId forKey:kCluesXqDataOrgId];
    [aCoder encodeObject:_userSizeName forKey:kCluesXqDataUserSizeName];
    [aCoder encodeObject:_dataIdentifier forKey:kCluesXqDataId];
    [aCoder encodeObject:_creatorId forKey:kCluesXqDataCreatorId];
    [aCoder encodeObject:_customerLevelName forKey:kCluesXqDataCustomerLevelName];
    [aCoder encodeObject:_regionIdProvince forKey:kCluesXqDataRegionIdProvince];
    [aCoder encodeObject:_regionIdProvinceName forKey:kCluesXqDataRegionIdProvinceName];
    [aCoder encodeObject:_cusId forKey:kCluesXqDataCusId];
    [aCoder encodeObject:_dataDescription forKey:kCluesXqDataDescription];
    [aCoder encodeObject:_userNature forKey:kCluesXqDataUserNature];
    [aCoder encodeObject:_userNatureName forKey:kCluesXqDataUserNatureName];
    [aCoder encodeObject:_modifierName forKey:kCluesXqDataModifierName];
    [aCoder encodeObject:_busiDepart forKey:kCluesXqDataBusiDepart];
    [aCoder encodeDouble:_modifiedDatetime forKey:kCluesXqDataModifiedDatetime];
    [aCoder encodeObject:_userArea forKey:kCluesXqDataUserArea];
    [aCoder encodeObject:_ownerId forKey:kCluesXqDataOwnerId];
    [aCoder encodeObject:_creatorName forKey:kCluesXqDataCreatorName];
    [aCoder encodeObject:_orgName forKey:kCluesXqDataOrgName];
    [aCoder encodeObject:_tripArea forKey:kCluesXqDataTripArea];
    [aCoder encodeDouble:_findTime forKey:kCluesXqDataFindTime];
    [aCoder encodeObject:_userAreaName forKey:kCluesXqDataUserAreaName];
    [aCoder encodeObject:_finderName forKey:kCluesXqDataFinderName];
    [aCoder encodeObject:_regionAddr forKey:kCluesXqDataRegionAddr];
    [aCoder encodeObject:_regionIdDistrict forKey:kCluesXqDataRegionIdDistrict];
    [aCoder encodeDouble:_cContact forKey:kCluesXqDataCContact];
    [aCoder encodeObject:_busiDepartName forKey:kCluesXqDataBusiDepartName];
    [aCoder encodeObject:_cusType forKey:kCluesXqDataCusType];
    [aCoder encodeObject:_tripAreaName forKey:kCluesXqDataTripAreaName];
    [aCoder encodeObject:_finderId forKey:kCluesXqDataFinderId];
    [aCoder encodeObject:_status forKey:kCluesXqDataStatus];
    [aCoder encodeObject:_cusFullname forKey:kCluesXqDataCusFullname];
    [aCoder encodeObject:_cusTypeName forKey:kCluesXqDataCusTypeName];
    [aCoder encodeObject:_regionIdCountry forKey:kCluesXqDataRegionIdCountry];
    [aCoder encodeObject:_managerPartyName forKey:kCluesXqDataManagerPartyName];
    [aCoder encodeObject:_statusName forKey:kCluesXqDataStatusName];
    [aCoder encodeDouble:_createdDatetime forKey:kCluesXqDataCreatedDatetime];
    [aCoder encodeObject:_regionIdCity forKey:kCluesXqDataRegionIdCity];
    [aCoder encodeObject:_modifierId forKey:kCluesXqDataModifierId];
    [aCoder encodeObject:_ownerName forKey:kCluesXqDataOwnerName];
    [aCoder encodeDouble:_openDate forKey:kCluesXqDataOpenDate];
    [aCoder encodeObject:_startLevelName forKey:kCluesXqDataStartLevelName];
    [aCoder encodeObject:_regionIdDistrictName forKey:kCluesXqDataRegionIdDistrictName];
    [aCoder encodeObject:_busiNatureName forKey:kCluesXqDataBusiNatureName];
    [aCoder encodeObject:_regionIdCityName forKey:kCluesXqDataRegionIdCityName];
    [aCoder encodeObject:_busiNature forKey:kCluesXqDataBusiNature];
    [aCoder encodeObject:_findSourceId forKey:kCluesXqDataFindSourceId];
    [aCoder encodeObject:_tenementId forKey:kCluesXqDataTenementId];
    [aCoder encodeObject:_regionIdCountryName forKey:kCluesXqDataRegionIdCountryName];
}

- (id)copyWithZone:(NSZone *)zone
{
    CluesXqData *copy = [[CluesXqData alloc] init];
    
    if (copy) {

        copy.userSize = [self.userSize copyWithZone:zone];
        copy.startLevel = [self.startLevel copyWithZone:zone];
        copy.orgId = [self.orgId copyWithZone:zone];
        copy.userSizeName = [self.userSizeName copyWithZone:zone];
        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.creatorId = [self.creatorId copyWithZone:zone];
        copy.customerLevelName = [self.customerLevelName copyWithZone:zone];
        copy.regionIdProvince = [self.regionIdProvince copyWithZone:zone];
        copy.regionIdProvinceName = [self.regionIdProvinceName copyWithZone:zone];
        copy.cusId = [self.cusId copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.userNature = [self.userNature copyWithZone:zone];
        copy.userNatureName = [self.userNatureName copyWithZone:zone];
        copy.modifierName = [self.modifierName copyWithZone:zone];
        copy.busiDepart = [self.busiDepart copyWithZone:zone];
        copy.modifiedDatetime = self.modifiedDatetime;
        copy.userArea = [self.userArea copyWithZone:zone];
        copy.ownerId = [self.ownerId copyWithZone:zone];
        copy.creatorName = [self.creatorName copyWithZone:zone];
        copy.orgName = [self.orgName copyWithZone:zone];
        copy.tripArea = [self.tripArea copyWithZone:zone];
        copy.findTime = self.findTime;
        copy.userAreaName = [self.userAreaName copyWithZone:zone];
        copy.finderName = [self.finderName copyWithZone:zone];
        copy.regionAddr = [self.regionAddr copyWithZone:zone];
        copy.regionIdDistrict = [self.regionIdDistrict copyWithZone:zone];
        copy.cContact = self.cContact;
        copy.busiDepartName = [self.busiDepartName copyWithZone:zone];
        copy.cusType = [self.cusType copyWithZone:zone];
        copy.tripAreaName = [self.tripAreaName copyWithZone:zone];
        copy.finderId = [self.finderId copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.cusFullname = [self.cusFullname copyWithZone:zone];
        copy.cusTypeName = [self.cusTypeName copyWithZone:zone];
        copy.regionIdCountry = [self.regionIdCountry copyWithZone:zone];
        copy.managerPartyName = [self.managerPartyName copyWithZone:zone];
        copy.statusName = [self.statusName copyWithZone:zone];
        copy.createdDatetime = self.createdDatetime;
        copy.regionIdCity = [self.regionIdCity copyWithZone:zone];
        copy.modifierId = [self.modifierId copyWithZone:zone];
        copy.ownerName = [self.ownerName copyWithZone:zone];
        copy.openDate = self.openDate;
        copy.startLevelName = [self.startLevelName copyWithZone:zone];
        copy.regionIdDistrictName = [self.regionIdDistrictName copyWithZone:zone];
        copy.busiNatureName = [self.busiNatureName copyWithZone:zone];
        copy.regionIdCityName = [self.regionIdCityName copyWithZone:zone];
        copy.busiNature = [self.busiNature copyWithZone:zone];
        copy.findSourceId = [self.findSourceId copyWithZone:zone];
        copy.tenementId = [self.tenementId copyWithZone:zone];
        copy.regionIdCountryName = [self.regionIdCountryName copyWithZone:zone];
    }
    
    return copy;
}


@end
