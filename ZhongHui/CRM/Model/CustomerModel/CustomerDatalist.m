//
//  CustomerDatalist.m
//
//  Created by   on 15/12/23
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "CustomerDatalist.h"


NSString *const kcusDatalistProvinceName = @"provinceName";
NSString *const kcusDatalistStartLevel = @"startLevel";
NSString *const kcusDatalistUserSizeName = @"userSizeName";
NSString *const kcusDatalistCountryName = @"countryName";
NSString *const kcusDatalistId = @"id";
NSString *const kcusDatalistCountry = @"country";
NSString *const kcusDatalistCreatorId = @"creatorId";
NSString *const kcusDatalistCusCode = @"cusCode";
NSString *const kcusDatalistBustNature = @"bustNature";
NSString *const kcusDatalistRedecDateLast = @"redecDateLast";
NSString *const kcusDatalistDescription = @"description";
NSString *const kcusDatalistUserNature = @"userNature";
NSString *const kcusDatalistModifierName = @"modifierName";
NSString *const kcusDatalistUserNatureName = @"userNatureName";
NSString *const kcusDatalistCFloors = @"cFloors";
NSString *const kcusDatalistModifiedDatetime = @"modifiedDatetime";
NSString *const kcusDatalistDistrict = @"district";
NSString *const kcusDatalistUserArea = @"userArea";
NSString *const kcusDatalistCreatorName = @"creatorName";
NSString *const kcusDatalistCPoints = @"cPoints";
NSString *const kcusDatalistBrand = @"brand";
NSString *const kcusDatalistTripArea = @"tripArea";
NSString *const kcusDatalistUserAreaName = @"userAreaName";
NSString *const kcusDatalistRegionAddr = @"regionAddr";
NSString *const kcusDatalistCRooms = @"cRooms";
NSString *const kcusDatalistCusFullName = @"cusFullName";
NSString *const kcusDatalistCusType = @"cusType";
NSString *const kcusDatalistTripAreaName = @"tripAreaName";
NSString *const kcusDatalistStatus = @"status";
NSString *const kcusDatalistCity = @"city";
NSString *const kcusDatalistCityName = @"cityName";
NSString *const kcusDatalistManagerParty = @"managerParty";
NSString *const kcusDatalistCusTypeName = @"cusTypeName";
NSString *const kcusDatalistBustNatureName = @"bustNatureName";
NSString *const kcusDatalistProvince = @"province";
NSString *const kcusDatalistCusShortName = @"cusShortName";
NSString *const kcusDatalistPostcode = @"postcode";
NSString *const kcusDatalistManagerPartyName = @"managerPartyName";
NSString *const kcusDatalistAssetsOwner = @"assetsOwner";
NSString *const kcusDatalistStatusName = @"statusName";
NSString *const kcusDatalistDistrictName = @"districtName";
NSString *const kcusDatalistAssetsOwnerName = @"assetsOwnerName";
NSString *const kcusDatalistModifierId = @"modifierId";
NSString *const kcusDatalistCreatedDatetime = @"createdDatetime";
NSString *const kcusDatalistOpenDate = @"openDate";
NSString *const kcusDatalistStartLevelName = @"startLevelName";
NSString *const kcusDatalistUserSize = @"userSize";
NSString *const kcusDatalistOwnerGroupId = @"ownerGroupId";



@interface CustomerDatalist ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CustomerDatalist

@synthesize provinceName = _provinceName;
@synthesize startLevel = _startLevel;
@synthesize userSizeName = _userSizeName;
@synthesize countryName = _countryName;
@synthesize datalistIdentifier = _datalistIdentifier;
@synthesize country = _country;
@synthesize creatorId = _creatorId;
@synthesize cusCode = _cusCode;
@synthesize bustNature = _bustNature;
@synthesize redecDateLast = _redecDateLast;
@synthesize datalistDescription = _datalistDescription;
@synthesize userNature = _userNature;
@synthesize modifierName = _modifierName;
@synthesize userNatureName = _userNatureName;
@synthesize cFloors = _cFloors;
@synthesize modifiedDatetime = _modifiedDatetime;
@synthesize district = _district;
@synthesize userArea = _userArea;
@synthesize creatorName = _creatorName;
@synthesize cPoints = _cPoints;
@synthesize brand = _brand;
@synthesize tripArea = _tripArea;
@synthesize userAreaName = _userAreaName;
@synthesize regionAddr = _regionAddr;
@synthesize cRooms = _cRooms;
@synthesize cusFullName = _cusFullName;
@synthesize cusType = _cusType;
@synthesize tripAreaName = _tripAreaName;
@synthesize status = _status;
@synthesize city = _city;
@synthesize cityName = _cityName;
@synthesize managerParty = _managerParty;
@synthesize cusTypeName = _cusTypeName;
@synthesize bustNatureName = _bustNatureName;
@synthesize province = _province;
@synthesize cusShortName = _cusShortName;
@synthesize postcode = _postcode;
@synthesize managerPartyName = _managerPartyName;
@synthesize assetsOwner = _assetsOwner;
@synthesize statusName = _statusName;
@synthesize districtName = _districtName;
@synthesize assetsOwnerName = _assetsOwnerName;
@synthesize modifierId = _modifierId;
@synthesize createdDatetime = _createdDatetime;
@synthesize openDate = _openDate;
@synthesize startLevelName = _startLevelName;
@synthesize userSize = _userSize;
@synthesize ownerGroupId = _ownerGroupId;

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
        self.provinceName = [self objectOrNilForKey:kcusDatalistProvinceName fromDictionary:dict];
        self.startLevel = [self objectOrNilForKey:kcusDatalistStartLevel fromDictionary:dict];
        self.userSizeName = [self objectOrNilForKey:kcusDatalistUserSizeName fromDictionary:dict];
        self.countryName = [self objectOrNilForKey:kcusDatalistCountryName fromDictionary:dict];
        self.datalistIdentifier = [self objectOrNilForKey:kcusDatalistId fromDictionary:dict];
        self.country = [self objectOrNilForKey:kcusDatalistCountry fromDictionary:dict];
        self.creatorId = [self objectOrNilForKey:kcusDatalistCreatorId fromDictionary:dict];
        self.cusCode = [self objectOrNilForKey:kcusDatalistCusCode fromDictionary:dict];
        self.bustNature = [self objectOrNilForKey:kcusDatalistBustNature fromDictionary:dict];
        self.redecDateLast = [[self objectOrNilForKey:kcusDatalistRedecDateLast fromDictionary:dict] doubleValue];
        self.datalistDescription = [self objectOrNilForKey:kcusDatalistDescription fromDictionary:dict];
        self.userNature = [self objectOrNilForKey:kcusDatalistUserNature fromDictionary:dict];
        self.modifierName = [self objectOrNilForKey:kcusDatalistModifierName fromDictionary:dict];
        self.userNatureName = [self objectOrNilForKey:kcusDatalistUserNatureName fromDictionary:dict];
        self.cFloors = [[self objectOrNilForKey:kcusDatalistCFloors fromDictionary:dict] doubleValue];
        self.modifiedDatetime = [[self objectOrNilForKey:kcusDatalistModifiedDatetime fromDictionary:dict] doubleValue];
        self.district = [self objectOrNilForKey:kcusDatalistDistrict fromDictionary:dict];
        self.userArea = [self objectOrNilForKey:kcusDatalistUserArea fromDictionary:dict];
        self.creatorName = [self objectOrNilForKey:kcusDatalistCreatorName fromDictionary:dict];
        self.cPoints = [[self objectOrNilForKey:kcusDatalistCPoints fromDictionary:dict] doubleValue];
        self.brand = [self objectOrNilForKey:kcusDatalistBrand fromDictionary:dict];
        self.tripArea = [self objectOrNilForKey:kcusDatalistTripArea fromDictionary:dict];
        self.userAreaName = [self objectOrNilForKey:kcusDatalistUserAreaName fromDictionary:dict];
        self.regionAddr = [self objectOrNilForKey:kcusDatalistRegionAddr fromDictionary:dict];
        self.cRooms = [[self objectOrNilForKey:kcusDatalistCRooms fromDictionary:dict] doubleValue];
        self.cusFullName = [self objectOrNilForKey:kcusDatalistCusFullName fromDictionary:dict];
        self.cusType = [self objectOrNilForKey:kcusDatalistCusType fromDictionary:dict];
        self.tripAreaName = [self objectOrNilForKey:kcusDatalistTripAreaName fromDictionary:dict];
        self.status = [self objectOrNilForKey:kcusDatalistStatus fromDictionary:dict];
        self.city = [self objectOrNilForKey:kcusDatalistCity fromDictionary:dict];
        self.cityName = [self objectOrNilForKey:kcusDatalistCityName fromDictionary:dict];
        self.managerParty = [self objectOrNilForKey:kcusDatalistManagerParty fromDictionary:dict];
        self.cusTypeName = [self objectOrNilForKey:kcusDatalistCusTypeName fromDictionary:dict];
        self.bustNatureName = [self objectOrNilForKey:kcusDatalistBustNatureName fromDictionary:dict];
        self.province = [self objectOrNilForKey:kcusDatalistProvince fromDictionary:dict];
        self.cusShortName = [self objectOrNilForKey:kcusDatalistCusShortName fromDictionary:dict];
        self.postcode = [self objectOrNilForKey:kcusDatalistPostcode fromDictionary:dict];
        self.managerPartyName = [self objectOrNilForKey:kcusDatalistManagerPartyName fromDictionary:dict];
        self.assetsOwner = [self objectOrNilForKey:kcusDatalistAssetsOwner fromDictionary:dict];
        self.statusName = [self objectOrNilForKey:kcusDatalistStatusName fromDictionary:dict];
        self.districtName = [self objectOrNilForKey:kcusDatalistDistrictName fromDictionary:dict];
        self.assetsOwnerName = [self objectOrNilForKey:kcusDatalistAssetsOwnerName fromDictionary:dict];
        self.modifierId = [self objectOrNilForKey:kcusDatalistModifierId fromDictionary:dict];
        self.createdDatetime = [[self objectOrNilForKey:kcusDatalistCreatedDatetime fromDictionary:dict] doubleValue];
        self.openDate = [[self objectOrNilForKey:kcusDatalistOpenDate fromDictionary:dict] doubleValue];
        self.startLevelName = [self objectOrNilForKey:kcusDatalistStartLevelName fromDictionary:dict];
        self.userSize = [self objectOrNilForKey:kcusDatalistUserSize fromDictionary:dict];
        self.ownerGroupId = [self objectOrNilForKey:kcusDatalistOwnerGroupId fromDictionary:dict];
        
    }
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.provinceName forKey:kcusDatalistProvinceName];
    [mutableDict setValue:self.startLevel forKey:kcusDatalistStartLevel];
    [mutableDict setValue:self.userSizeName forKey:kcusDatalistUserSizeName];
    [mutableDict setValue:self.countryName forKey:kcusDatalistCountryName];
    [mutableDict setValue:self.datalistIdentifier forKey:kcusDatalistId];
    [mutableDict setValue:self.country forKey:kcusDatalistCountry];
    [mutableDict setValue:self.creatorId forKey:kcusDatalistCreatorId];
    [mutableDict setValue:self.cusCode forKey:kcusDatalistCusCode];
    [mutableDict setValue:self.bustNature forKey:kcusDatalistBustNature];
    [mutableDict setValue:[NSNumber numberWithDouble:self.redecDateLast] forKey:kcusDatalistRedecDateLast];
    [mutableDict setValue:self.datalistDescription forKey:kcusDatalistDescription];
    [mutableDict setValue:self.userNature forKey:kcusDatalistUserNature];
    [mutableDict setValue:self.modifierName forKey:kcusDatalistModifierName];
    [mutableDict setValue:self.userNatureName forKey:kcusDatalistUserNatureName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cFloors] forKey:kcusDatalistCFloors];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifiedDatetime] forKey:kcusDatalistModifiedDatetime];
    [mutableDict setValue:self.district forKey:kcusDatalistDistrict];
    [mutableDict setValue:self.userArea forKey:kcusDatalistUserArea];
    [mutableDict setValue:self.creatorName forKey:kcusDatalistCreatorName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cPoints] forKey:kcusDatalistCPoints];
    [mutableDict setValue:self.brand forKey:kcusDatalistBrand];
    [mutableDict setValue:self.tripArea forKey:kcusDatalistTripArea];
    [mutableDict setValue:self.userAreaName forKey:kcusDatalistUserAreaName];
    [mutableDict setValue:self.regionAddr forKey:kcusDatalistRegionAddr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cRooms] forKey:kcusDatalistCRooms];
    [mutableDict setValue:self.cusFullName forKey:kcusDatalistCusFullName];
    [mutableDict setValue:self.cusType forKey:kcusDatalistCusType];
    [mutableDict setValue:self.tripAreaName forKey:kcusDatalistTripAreaName];
    [mutableDict setValue:self.status forKey:kcusDatalistStatus];
    [mutableDict setValue:self.city forKey:kcusDatalistCity];
    [mutableDict setValue:self.cityName forKey:kcusDatalistCityName];
    [mutableDict setValue:self.managerParty forKey:kcusDatalistManagerParty];
    [mutableDict setValue:self.cusTypeName forKey:kcusDatalistCusTypeName];
    [mutableDict setValue:self.bustNatureName forKey:kcusDatalistBustNatureName];
    [mutableDict setValue:self.province forKey:kcusDatalistProvince];
    [mutableDict setValue:self.cusShortName forKey:kcusDatalistCusShortName];
    [mutableDict setValue:self.postcode forKey:kcusDatalistPostcode];
    [mutableDict setValue:self.managerPartyName forKey:kcusDatalistManagerPartyName];
    [mutableDict setValue:self.assetsOwner forKey:kcusDatalistAssetsOwner];
    [mutableDict setValue:self.statusName forKey:kcusDatalistStatusName];
    [mutableDict setValue:self.districtName forKey:kcusDatalistDistrictName];
    [mutableDict setValue:self.assetsOwnerName forKey:kcusDatalistAssetsOwnerName];
    [mutableDict setValue:self.modifierId forKey:kcusDatalistModifierId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdDatetime] forKey:kcusDatalistCreatedDatetime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.openDate] forKey:kcusDatalistOpenDate];
    [mutableDict setValue:self.startLevelName forKey:kcusDatalistStartLevelName];
    [mutableDict setValue:self.userSize forKey:kcusDatalistUserSize];
    [mutableDict setValue:self.ownerGroupId forKey:kcusDatalistOwnerGroupId];
    
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

    self.provinceName = [aDecoder decodeObjectForKey:kcusDatalistProvinceName];
    self.startLevel = [aDecoder decodeObjectForKey:kcusDatalistStartLevel];
    self.userSizeName = [aDecoder decodeObjectForKey:kcusDatalistUserSizeName];
    self.countryName = [aDecoder decodeObjectForKey:kcusDatalistCountryName];
    self.datalistIdentifier = [aDecoder decodeObjectForKey:kcusDatalistId];
    self.country = [aDecoder decodeObjectForKey:kcusDatalistCountry];
    self.creatorId = [aDecoder decodeObjectForKey:kcusDatalistCreatorId];
    self.cusCode = [aDecoder decodeObjectForKey:kcusDatalistCusCode];
    self.bustNature = [aDecoder decodeObjectForKey:kcusDatalistBustNature];
    self.redecDateLast = [aDecoder decodeDoubleForKey:kcusDatalistRedecDateLast];
    self.datalistDescription = [aDecoder decodeObjectForKey:kcusDatalistDescription];
    self.userNature = [aDecoder decodeObjectForKey:kcusDatalistUserNature];
    self.modifierName = [aDecoder decodeObjectForKey:kcusDatalistModifierName];
    self.userNatureName = [aDecoder decodeObjectForKey:kcusDatalistUserNatureName];
    self.cFloors = [aDecoder decodeDoubleForKey:kcusDatalistCFloors];
    self.modifiedDatetime = [aDecoder decodeDoubleForKey:kcusDatalistModifiedDatetime];
    self.district = [aDecoder decodeObjectForKey:kcusDatalistDistrict];
    self.userArea = [aDecoder decodeObjectForKey:kcusDatalistUserArea];
    self.creatorName = [aDecoder decodeObjectForKey:kcusDatalistCreatorName];
    self.cPoints = [aDecoder decodeDoubleForKey:kcusDatalistCPoints];
    self.brand = [aDecoder decodeObjectForKey:kcusDatalistBrand];
    self.tripArea = [aDecoder decodeObjectForKey:kcusDatalistTripArea];
    self.userAreaName = [aDecoder decodeObjectForKey:kcusDatalistUserAreaName];
    self.regionAddr = [aDecoder decodeObjectForKey:kcusDatalistRegionAddr];
    self.cRooms = [aDecoder decodeDoubleForKey:kcusDatalistCRooms];
    self.cusFullName = [aDecoder decodeObjectForKey:kcusDatalistCusFullName];
    self.cusType = [aDecoder decodeObjectForKey:kcusDatalistCusType];
    self.tripAreaName = [aDecoder decodeObjectForKey:kcusDatalistTripAreaName];
    self.status = [aDecoder decodeObjectForKey:kcusDatalistStatus];
    self.city = [aDecoder decodeObjectForKey:kcusDatalistCity];
    self.cityName = [aDecoder decodeObjectForKey:kcusDatalistCityName];
    self.managerParty = [aDecoder decodeObjectForKey:kcusDatalistManagerParty];
    self.cusTypeName = [aDecoder decodeObjectForKey:kcusDatalistCusTypeName];
    self.bustNatureName = [aDecoder decodeObjectForKey:kcusDatalistBustNatureName];
    self.province = [aDecoder decodeObjectForKey:kcusDatalistProvince];
    self.cusShortName = [aDecoder decodeObjectForKey:kcusDatalistCusShortName];
    self.postcode = [aDecoder decodeObjectForKey:kcusDatalistPostcode];
    self.managerPartyName = [aDecoder decodeObjectForKey:kcusDatalistManagerPartyName];
    self.assetsOwner = [aDecoder decodeObjectForKey:kcusDatalistAssetsOwner];
    self.statusName = [aDecoder decodeObjectForKey:kcusDatalistStatusName];
    self.districtName = [aDecoder decodeObjectForKey:kcusDatalistDistrictName];
    self.assetsOwnerName = [aDecoder decodeObjectForKey:kcusDatalistAssetsOwnerName];
    self.modifierId = [aDecoder decodeObjectForKey:kcusDatalistModifierId];
    self.createdDatetime = [aDecoder decodeDoubleForKey:kcusDatalistCreatedDatetime];
    self.openDate = [aDecoder decodeDoubleForKey:kcusDatalistOpenDate];
    self.startLevelName = [aDecoder decodeObjectForKey:kcusDatalistStartLevelName];
    self.userSize = [aDecoder decodeObjectForKey:kcusDatalistUserSize];
    self.ownerGroupId = [aDecoder decodeObjectForKey:kcusDatalistOwnerGroupId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    
    [aCoder encodeObject:_provinceName forKey:kcusDatalistProvinceName];
    [aCoder encodeObject:_startLevel forKey:kcusDatalistStartLevel];
    [aCoder encodeObject:_userSizeName forKey:kcusDatalistUserSizeName];
    [aCoder encodeObject:_countryName forKey:kcusDatalistCountryName];
    [aCoder encodeObject:_datalistIdentifier forKey:kcusDatalistId];
    [aCoder encodeObject:_country forKey:kcusDatalistCountry];
    [aCoder encodeObject:_creatorId forKey:kcusDatalistCreatorId];
    [aCoder encodeObject:_cusCode forKey:kcusDatalistCusCode];
    [aCoder encodeObject:_bustNature forKey:kcusDatalistBustNature];
    [aCoder encodeDouble:_redecDateLast forKey:kcusDatalistRedecDateLast];
    [aCoder encodeObject:_datalistDescription forKey:kcusDatalistDescription];
    [aCoder encodeObject:_userNature forKey:kcusDatalistUserNature];
    [aCoder encodeObject:_modifierName forKey:kcusDatalistModifierName];
    [aCoder encodeObject:_userNatureName forKey:kcusDatalistUserNatureName];
    [aCoder encodeDouble:_cFloors forKey:kcusDatalistCFloors];
    [aCoder encodeDouble:_modifiedDatetime forKey:kcusDatalistModifiedDatetime];
    [aCoder encodeObject:_district forKey:kcusDatalistDistrict];
    [aCoder encodeObject:_userArea forKey:kcusDatalistUserArea];
    [aCoder encodeObject:_creatorName forKey:kcusDatalistCreatorName];
    [aCoder encodeDouble:_cPoints forKey:kcusDatalistCPoints];
    [aCoder encodeObject:_brand forKey:kcusDatalistBrand];
    [aCoder encodeObject:_tripArea forKey:kcusDatalistTripArea];
    [aCoder encodeObject:_userAreaName forKey:kcusDatalistUserAreaName];
    [aCoder encodeObject:_regionAddr forKey:kcusDatalistRegionAddr];
    [aCoder encodeDouble:_cRooms forKey:kcusDatalistCRooms];
    [aCoder encodeObject:_cusFullName forKey:kcusDatalistCusFullName];
    [aCoder encodeObject:_cusType forKey:kcusDatalistCusType];
    [aCoder encodeObject:_tripAreaName forKey:kcusDatalistTripAreaName];
    [aCoder encodeObject:_status forKey:kcusDatalistStatus];
    [aCoder encodeObject:_city forKey:kcusDatalistCity];
    [aCoder encodeObject:_cityName forKey:kcusDatalistCityName];
    [aCoder encodeObject:_managerParty forKey:kcusDatalistManagerParty];
    [aCoder encodeObject:_cusTypeName forKey:kcusDatalistCusTypeName];
    [aCoder encodeObject:_bustNatureName forKey:kcusDatalistBustNatureName];
    [aCoder encodeObject:_province forKey:kcusDatalistProvince];
    [aCoder encodeObject:_cusShortName forKey:kcusDatalistCusShortName];
    [aCoder encodeObject:_postcode forKey:kcusDatalistPostcode];
    [aCoder encodeObject:_managerPartyName forKey:kcusDatalistManagerPartyName];
    [aCoder encodeObject:_assetsOwner forKey:kcusDatalistAssetsOwner];
    [aCoder encodeObject:_statusName forKey:kcusDatalistStatusName];
    [aCoder encodeObject:_districtName forKey:kcusDatalistDistrictName];
    [aCoder encodeObject:_assetsOwnerName forKey:kcusDatalistAssetsOwnerName];
    [aCoder encodeObject:_modifierId forKey:kcusDatalistModifierId];
    [aCoder encodeDouble:_createdDatetime forKey:kcusDatalistCreatedDatetime];
    [aCoder encodeDouble:_openDate forKey:kcusDatalistOpenDate];
    [aCoder encodeObject:_startLevelName forKey:kcusDatalistStartLevelName];
    [aCoder encodeObject:_userSize forKey:kcusDatalistUserSize];
    [aCoder encodeObject:_ownerGroupId forKey:kcusDatalistOwnerGroupId];
}
- (id)copyWithZone:(NSZone *)zone
{
    CustomerDatalist *copy = [[CustomerDatalist alloc] init];
    
    if (copy) {

        copy.provinceName = [self.provinceName copyWithZone:zone];
        copy.startLevel = [self.startLevel copyWithZone:zone];
        copy.userSizeName = [self.userSizeName copyWithZone:zone];
        copy.countryName = [self.countryName copyWithZone:zone];
        copy.datalistIdentifier = [self.datalistIdentifier copyWithZone:zone];
        copy.country = [self.country copyWithZone:zone];
        copy.creatorId = [self.creatorId copyWithZone:zone];
        copy.cusCode = [self.cusCode copyWithZone:zone];
        copy.bustNature = [self.bustNature copyWithZone:zone];
        copy.redecDateLast = self.redecDateLast;
        copy.datalistDescription = [self.datalistDescription copyWithZone:zone];
        copy.userNature = [self.userNature copyWithZone:zone];
        copy.modifierName = [self.modifierName copyWithZone:zone];
        copy.userNatureName = [self.userNatureName copyWithZone:zone];
        copy.cFloors = self.cFloors;
        copy.modifiedDatetime = self.modifiedDatetime;
        copy.district = [self.district copyWithZone:zone];
        copy.userArea = [self.userArea copyWithZone:zone];
        copy.creatorName = [self.creatorName copyWithZone:zone];
        copy.cPoints = self.cPoints;
        copy.brand = [self.brand copyWithZone:zone];
        copy.tripArea = [self.tripArea copyWithZone:zone];
        copy.userAreaName = [self.userAreaName copyWithZone:zone];
        copy.regionAddr = [self.regionAddr copyWithZone:zone];
        copy.cRooms = self.cRooms;
        copy.cusFullName = [self.cusFullName copyWithZone:zone];
        copy.cusType = [self.cusType copyWithZone:zone];
        copy.tripAreaName = [self.tripAreaName copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.city = [self.city copyWithZone:zone];
        copy.cityName = [self.cityName copyWithZone:zone];
        copy.managerParty = [self.managerParty copyWithZone:zone];
        copy.cusTypeName = [self.cusTypeName copyWithZone:zone];
        copy.bustNatureName = [self.bustNatureName copyWithZone:zone];
        copy.province = [self.province copyWithZone:zone];
        copy.cusShortName = [self.cusShortName copyWithZone:zone];
        copy.postcode = [self.postcode copyWithZone:zone];
        copy.managerPartyName = [self.managerPartyName copyWithZone:zone];
        copy.assetsOwner = [self.assetsOwner copyWithZone:zone];
        copy.statusName = [self.statusName copyWithZone:zone];
        copy.districtName = [self.districtName copyWithZone:zone];
        copy.assetsOwnerName = [self.assetsOwnerName copyWithZone:zone];
        copy.modifierId = [self.modifierId copyWithZone:zone];
        copy.createdDatetime = self.createdDatetime;
        copy.openDate = self.openDate;
        copy.startLevelName = [self.startLevelName copyWithZone:zone];
        copy.userSize = [self.userSize copyWithZone:zone];
        copy.ownerGroupId = [self.ownerGroupId copyWithZone:zone];
    }
    
    return copy;
}


@end
