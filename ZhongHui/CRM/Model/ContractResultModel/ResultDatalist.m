//
//  ResultDatalist.m
//
//  Created by   on 16/1/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ResultDatalist.h"


NSString *const kResultDatalistContactTime = @"contactTime";
NSString *const kResultDatalistNeedAppoint = @"needAppoint";
NSString *const kResultDatalistContactProvince = @"contactProvince";
NSString *const kResultDatalistId = @"id";
NSString *const kResultDatalistConName = @"conName";
NSString *const kResultDatalistContactJoins = @"contactJoins";
NSString *const kResultDatalistCreatorId = @"creatorId";
NSString *const kResultDatalistVisTitle = @"visTitle";
NSString *const kResultDatalistRelBusiId = @"relBusiId";
NSString *const kResultDatalistBusiTypeName = @"busiTypeName";
NSString *const kResultDatalistCusId = @"cusId";
NSString *const kResultDatalistDescription = @"description";
NSString *const kResultDatalistModifierName = @"modifierName";
NSString *const kResultDatalistModifiedDatetime = @"modifiedDatetime";
NSString *const kResultDatalistResultReason = @"resultReason";
NSString *const kResultDatalistCreatorName = @"creatorName";
NSString *const kResultDatalistOwnerId = @"ownerId";
NSString *const kResultDatalistRelBusiTypeName = @"relBusiTypeName";
NSString *const kResultDatalistBusiType = @"busiType";
NSString *const kResultDatalistContactTypeName = @"contactTypeName";
NSString *const kResultDatalistContactAddress = @"contactAddress";
NSString *const kResultDatalistContactResultName = @"contactResultName";
NSString *const kResultDatalistContactCity = @"contactCity";
NSString *const kResultDatalistContactZipCode = @"contactZipCode";
NSString *const kResultDatalistContactDireName = @"contactDireName";
NSString *const kResultDatalistStatus = @"status";
NSString *const kResultDatalistContactType = @"contactType";
NSString *const kResultDatalistCusFullname = @"cusFullname";
NSString *const kResultDatalistContactDistrict = @"contactDistrict";
NSString *const kResultDatalistConId = @"conId";
NSString *const kResultDatalistContactResult = @"contactResult";
NSString *const kResultDatalistRelBusiType = @"relBusiType";
NSString *const kResultDatalistContactCountry = @"contactCountry";
NSString *const kResultDatalistAppointTime = @"appointTime";
NSString *const kResultDatalistCreatedDatetime = @"createdDatetime";
NSString *const kResultDatalistContactContent = @"contactContent";
NSString *const kResultDatalistModifierId = @"modifierId";
NSString *const kResultDatalistOwnerName = @"ownerName";
NSString *const kResultDatalistTenementId = @"tenementId";
NSString *const kResultDatalistRelBusiName = @"relBusiName";
NSString *const kResultDatalistContactDire = @"contactDire";


@interface ResultDatalist ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ResultDatalist

@synthesize contactTime = _contactTime;
@synthesize needAppoint = _needAppoint;
@synthesize contactProvince = _contactProvince;
@synthesize datalistIdentifier = _datalistIdentifier;
@synthesize conName = _conName;
@synthesize contactJoins = _contactJoins;
@synthesize creatorId = _creatorId;
@synthesize visTitle = _visTitle;
@synthesize relBusiId = _relBusiId;
@synthesize busiTypeName = _busiTypeName;
@synthesize cusId = _cusId;
@synthesize datalistDescription = _datalistDescription;
@synthesize modifierName = _modifierName;
@synthesize modifiedDatetime = _modifiedDatetime;
@synthesize resultReason = _resultReason;
@synthesize creatorName = _creatorName;
@synthesize ownerId = _ownerId;
@synthesize relBusiTypeName = _relBusiTypeName;
@synthesize busiType = _busiType;
@synthesize contactTypeName = _contactTypeName;
@synthesize contactAddress = _contactAddress;
@synthesize contactResultName = _contactResultName;
@synthesize contactCity = _contactCity;
@synthesize contactZipCode = _contactZipCode;
@synthesize contactDireName = _contactDireName;
@synthesize status = _status;
@synthesize contactType = _contactType;
@synthesize cusFullname = _cusFullname;
@synthesize contactDistrict = _contactDistrict;
@synthesize conId = _conId;
@synthesize contactResult = _contactResult;
@synthesize relBusiType = _relBusiType;
@synthesize contactCountry = _contactCountry;
@synthesize appointTime = _appointTime;
@synthesize createdDatetime = _createdDatetime;
@synthesize contactContent = _contactContent;
@synthesize modifierId = _modifierId;
@synthesize ownerName = _ownerName;
@synthesize tenementId = _tenementId;
@synthesize relBusiName = _relBusiName;
@synthesize contactDire = _contactDire;


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
            self.contactTime = [[self objectOrNilForKey:kResultDatalistContactTime fromDictionary:dict] doubleValue];
            self.needAppoint = [self objectOrNilForKey:kResultDatalistNeedAppoint fromDictionary:dict];
            self.contactProvince = [self objectOrNilForKey:kResultDatalistContactProvince fromDictionary:dict];
            self.datalistIdentifier = [self objectOrNilForKey:kResultDatalistId fromDictionary:dict];
            self.conName = [self objectOrNilForKey:kResultDatalistConName fromDictionary:dict];
            self.contactJoins = [self objectOrNilForKey:kResultDatalistContactJoins fromDictionary:dict];
            self.creatorId = [self objectOrNilForKey:kResultDatalistCreatorId fromDictionary:dict];
            self.visTitle = [self objectOrNilForKey:kResultDatalistVisTitle fromDictionary:dict];
            self.relBusiId = [self objectOrNilForKey:kResultDatalistRelBusiId fromDictionary:dict];
            self.busiTypeName = [self objectOrNilForKey:kResultDatalistBusiTypeName fromDictionary:dict];
            self.cusId = [self objectOrNilForKey:kResultDatalistCusId fromDictionary:dict];
            self.datalistDescription = [self objectOrNilForKey:kResultDatalistDescription fromDictionary:dict];
            self.modifierName = [self objectOrNilForKey:kResultDatalistModifierName fromDictionary:dict];
            self.modifiedDatetime = [[self objectOrNilForKey:kResultDatalistModifiedDatetime fromDictionary:dict] doubleValue];
            self.resultReason = [self objectOrNilForKey:kResultDatalistResultReason fromDictionary:dict];
            self.creatorName = [self objectOrNilForKey:kResultDatalistCreatorName fromDictionary:dict];
            self.ownerId = [self objectOrNilForKey:kResultDatalistOwnerId fromDictionary:dict];
            self.relBusiTypeName = [self objectOrNilForKey:kResultDatalistRelBusiTypeName fromDictionary:dict];
            self.busiType = [self objectOrNilForKey:kResultDatalistBusiType fromDictionary:dict];
            self.contactTypeName = [self objectOrNilForKey:kResultDatalistContactTypeName fromDictionary:dict];
            self.contactAddress = [self objectOrNilForKey:kResultDatalistContactAddress fromDictionary:dict];
            self.contactResultName = [self objectOrNilForKey:kResultDatalistContactResultName fromDictionary:dict];
            self.contactCity = [self objectOrNilForKey:kResultDatalistContactCity fromDictionary:dict];
            self.contactZipCode = [self objectOrNilForKey:kResultDatalistContactZipCode fromDictionary:dict];
            self.contactDireName = [self objectOrNilForKey:kResultDatalistContactDireName fromDictionary:dict];
            self.status = [self objectOrNilForKey:kResultDatalistStatus fromDictionary:dict];
            self.contactType = [self objectOrNilForKey:kResultDatalistContactType fromDictionary:dict];
            self.cusFullname = [self objectOrNilForKey:kResultDatalistCusFullname fromDictionary:dict];
            self.contactDistrict = [self objectOrNilForKey:kResultDatalistContactDistrict fromDictionary:dict];
            self.conId = [self objectOrNilForKey:kResultDatalistConId fromDictionary:dict];
            self.contactResult = [self objectOrNilForKey:kResultDatalistContactResult fromDictionary:dict];
            self.relBusiType = [self objectOrNilForKey:kResultDatalistRelBusiType fromDictionary:dict];
            self.contactCountry = [self objectOrNilForKey:kResultDatalistContactCountry fromDictionary:dict];
            self.appointTime = [[self objectOrNilForKey:kResultDatalistAppointTime fromDictionary:dict] doubleValue];
            self.createdDatetime = [[self objectOrNilForKey:kResultDatalistCreatedDatetime fromDictionary:dict] doubleValue];
            self.contactContent = [self objectOrNilForKey:kResultDatalistContactContent fromDictionary:dict];
            self.modifierId = [self objectOrNilForKey:kResultDatalistModifierId fromDictionary:dict];
            self.ownerName = [self objectOrNilForKey:kResultDatalistOwnerName fromDictionary:dict];
            self.tenementId = [self objectOrNilForKey:kResultDatalistTenementId fromDictionary:dict];
            self.relBusiName = [self objectOrNilForKey:kResultDatalistRelBusiName fromDictionary:dict];
            self.contactDire = [self objectOrNilForKey:kResultDatalistContactDire fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.contactTime] forKey:kResultDatalistContactTime];
    [mutableDict setValue:self.needAppoint forKey:kResultDatalistNeedAppoint];
    [mutableDict setValue:self.contactProvince forKey:kResultDatalistContactProvince];
    [mutableDict setValue:self.datalistIdentifier forKey:kResultDatalistId];
    [mutableDict setValue:self.conName forKey:kResultDatalistConName];
    NSMutableArray *tempArrayForContactJoins = [NSMutableArray array];
    for (NSObject *subArrayObject in self.contactJoins) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForContactJoins addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForContactJoins addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForContactJoins] forKey:kResultDatalistContactJoins];
    [mutableDict setValue:self.creatorId forKey:kResultDatalistCreatorId];
    [mutableDict setValue:self.visTitle forKey:kResultDatalistVisTitle];
    [mutableDict setValue:self.relBusiId forKey:kResultDatalistRelBusiId];
    [mutableDict setValue:self.busiTypeName forKey:kResultDatalistBusiTypeName];
    [mutableDict setValue:self.cusId forKey:kResultDatalistCusId];
    [mutableDict setValue:self.datalistDescription forKey:kResultDatalistDescription];
    [mutableDict setValue:self.modifierName forKey:kResultDatalistModifierName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifiedDatetime] forKey:kResultDatalistModifiedDatetime];
    [mutableDict setValue:self.resultReason forKey:kResultDatalistResultReason];
    [mutableDict setValue:self.creatorName forKey:kResultDatalistCreatorName];
    [mutableDict setValue:self.ownerId forKey:kResultDatalistOwnerId];
    [mutableDict setValue:self.relBusiTypeName forKey:kResultDatalistRelBusiTypeName];
    [mutableDict setValue:self.busiType forKey:kResultDatalistBusiType];
    [mutableDict setValue:self.contactTypeName forKey:kResultDatalistContactTypeName];
    [mutableDict setValue:self.contactAddress forKey:kResultDatalistContactAddress];
    [mutableDict setValue:self.contactResultName forKey:kResultDatalistContactResultName];
    [mutableDict setValue:self.contactCity forKey:kResultDatalistContactCity];
    [mutableDict setValue:self.contactZipCode forKey:kResultDatalistContactZipCode];
    [mutableDict setValue:self.contactDireName forKey:kResultDatalistContactDireName];
    [mutableDict setValue:self.status forKey:kResultDatalistStatus];
    [mutableDict setValue:self.contactType forKey:kResultDatalistContactType];
    [mutableDict setValue:self.cusFullname forKey:kResultDatalistCusFullname];
    [mutableDict setValue:self.contactDistrict forKey:kResultDatalistContactDistrict];
    [mutableDict setValue:self.conId forKey:kResultDatalistConId];
    [mutableDict setValue:self.contactResult forKey:kResultDatalistContactResult];
    [mutableDict setValue:self.relBusiType forKey:kResultDatalistRelBusiType];
    [mutableDict setValue:self.contactCountry forKey:kResultDatalistContactCountry];
    [mutableDict setValue:[NSNumber numberWithDouble:self.appointTime] forKey:kResultDatalistAppointTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdDatetime] forKey:kResultDatalistCreatedDatetime];
    [mutableDict setValue:self.contactContent forKey:kResultDatalistContactContent];
    [mutableDict setValue:self.modifierId forKey:kResultDatalistModifierId];
    [mutableDict setValue:self.ownerName forKey:kResultDatalistOwnerName];
    [mutableDict setValue:self.tenementId forKey:kResultDatalistTenementId];
    [mutableDict setValue:self.relBusiName forKey:kResultDatalistRelBusiName];
    [mutableDict setValue:self.contactDire forKey:kResultDatalistContactDire];

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

    self.contactTime = [aDecoder decodeDoubleForKey:kResultDatalistContactTime];
    self.needAppoint = [aDecoder decodeObjectForKey:kResultDatalistNeedAppoint];
    self.contactProvince = [aDecoder decodeObjectForKey:kResultDatalistContactProvince];
    self.datalistIdentifier = [aDecoder decodeObjectForKey:kResultDatalistId];
    self.conName = [aDecoder decodeObjectForKey:kResultDatalistConName];
    self.contactJoins = [aDecoder decodeObjectForKey:kResultDatalistContactJoins];
    self.creatorId = [aDecoder decodeObjectForKey:kResultDatalistCreatorId];
    self.visTitle = [aDecoder decodeObjectForKey:kResultDatalistVisTitle];
    self.relBusiId = [aDecoder decodeObjectForKey:kResultDatalistRelBusiId];
    self.busiTypeName = [aDecoder decodeObjectForKey:kResultDatalistBusiTypeName];
    self.cusId = [aDecoder decodeObjectForKey:kResultDatalistCusId];
    self.datalistDescription = [aDecoder decodeObjectForKey:kResultDatalistDescription];
    self.modifierName = [aDecoder decodeObjectForKey:kResultDatalistModifierName];
    self.modifiedDatetime = [aDecoder decodeDoubleForKey:kResultDatalistModifiedDatetime];
    self.resultReason = [aDecoder decodeObjectForKey:kResultDatalistResultReason];
    self.creatorName = [aDecoder decodeObjectForKey:kResultDatalistCreatorName];
    self.ownerId = [aDecoder decodeObjectForKey:kResultDatalistOwnerId];
    self.relBusiTypeName = [aDecoder decodeObjectForKey:kResultDatalistRelBusiTypeName];
    self.busiType = [aDecoder decodeObjectForKey:kResultDatalistBusiType];
    self.contactTypeName = [aDecoder decodeObjectForKey:kResultDatalistContactTypeName];
    self.contactAddress = [aDecoder decodeObjectForKey:kResultDatalistContactAddress];
    self.contactResultName = [aDecoder decodeObjectForKey:kResultDatalistContactResultName];
    self.contactCity = [aDecoder decodeObjectForKey:kResultDatalistContactCity];
    self.contactZipCode = [aDecoder decodeObjectForKey:kResultDatalistContactZipCode];
    self.contactDireName = [aDecoder decodeObjectForKey:kResultDatalistContactDireName];
    self.status = [aDecoder decodeObjectForKey:kResultDatalistStatus];
    self.contactType = [aDecoder decodeObjectForKey:kResultDatalistContactType];
    self.cusFullname = [aDecoder decodeObjectForKey:kResultDatalistCusFullname];
    self.contactDistrict = [aDecoder decodeObjectForKey:kResultDatalistContactDistrict];
    self.conId = [aDecoder decodeObjectForKey:kResultDatalistConId];
    self.contactResult = [aDecoder decodeObjectForKey:kResultDatalistContactResult];
    self.relBusiType = [aDecoder decodeObjectForKey:kResultDatalistRelBusiType];
    self.contactCountry = [aDecoder decodeObjectForKey:kResultDatalistContactCountry];
    self.appointTime = [aDecoder decodeDoubleForKey:kResultDatalistAppointTime];
    self.createdDatetime = [aDecoder decodeDoubleForKey:kResultDatalistCreatedDatetime];
    self.contactContent = [aDecoder decodeObjectForKey:kResultDatalistContactContent];
    self.modifierId = [aDecoder decodeObjectForKey:kResultDatalistModifierId];
    self.ownerName = [aDecoder decodeObjectForKey:kResultDatalistOwnerName];
    self.tenementId = [aDecoder decodeObjectForKey:kResultDatalistTenementId];
    self.relBusiName = [aDecoder decodeObjectForKey:kResultDatalistRelBusiName];
    self.contactDire = [aDecoder decodeObjectForKey:kResultDatalistContactDire];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_contactTime forKey:kResultDatalistContactTime];
    [aCoder encodeObject:_needAppoint forKey:kResultDatalistNeedAppoint];
    [aCoder encodeObject:_contactProvince forKey:kResultDatalistContactProvince];
    [aCoder encodeObject:_datalistIdentifier forKey:kResultDatalistId];
    [aCoder encodeObject:_conName forKey:kResultDatalistConName];
    [aCoder encodeObject:_contactJoins forKey:kResultDatalistContactJoins];
    [aCoder encodeObject:_creatorId forKey:kResultDatalistCreatorId];
    [aCoder encodeObject:_visTitle forKey:kResultDatalistVisTitle];
    [aCoder encodeObject:_relBusiId forKey:kResultDatalistRelBusiId];
    [aCoder encodeObject:_busiTypeName forKey:kResultDatalistBusiTypeName];
    [aCoder encodeObject:_cusId forKey:kResultDatalistCusId];
    [aCoder encodeObject:_datalistDescription forKey:kResultDatalistDescription];
    [aCoder encodeObject:_modifierName forKey:kResultDatalistModifierName];
    [aCoder encodeDouble:_modifiedDatetime forKey:kResultDatalistModifiedDatetime];
    [aCoder encodeObject:_resultReason forKey:kResultDatalistResultReason];
    [aCoder encodeObject:_creatorName forKey:kResultDatalistCreatorName];
    [aCoder encodeObject:_ownerId forKey:kResultDatalistOwnerId];
    [aCoder encodeObject:_relBusiTypeName forKey:kResultDatalistRelBusiTypeName];
    [aCoder encodeObject:_busiType forKey:kResultDatalistBusiType];
    [aCoder encodeObject:_contactTypeName forKey:kResultDatalistContactTypeName];
    [aCoder encodeObject:_contactAddress forKey:kResultDatalistContactAddress];
    [aCoder encodeObject:_contactResultName forKey:kResultDatalistContactResultName];
    [aCoder encodeObject:_contactCity forKey:kResultDatalistContactCity];
    [aCoder encodeObject:_contactZipCode forKey:kResultDatalistContactZipCode];
    [aCoder encodeObject:_contactDireName forKey:kResultDatalistContactDireName];
    [aCoder encodeObject:_status forKey:kResultDatalistStatus];
    [aCoder encodeObject:_contactType forKey:kResultDatalistContactType];
    [aCoder encodeObject:_cusFullname forKey:kResultDatalistCusFullname];
    [aCoder encodeObject:_contactDistrict forKey:kResultDatalistContactDistrict];
    [aCoder encodeObject:_conId forKey:kResultDatalistConId];
    [aCoder encodeObject:_contactResult forKey:kResultDatalistContactResult];
    [aCoder encodeObject:_relBusiType forKey:kResultDatalistRelBusiType];
    [aCoder encodeObject:_contactCountry forKey:kResultDatalistContactCountry];
    [aCoder encodeDouble:_appointTime forKey:kResultDatalistAppointTime];
    [aCoder encodeDouble:_createdDatetime forKey:kResultDatalistCreatedDatetime];
    [aCoder encodeObject:_contactContent forKey:kResultDatalistContactContent];
    [aCoder encodeObject:_modifierId forKey:kResultDatalistModifierId];
    [aCoder encodeObject:_ownerName forKey:kResultDatalistOwnerName];
    [aCoder encodeObject:_tenementId forKey:kResultDatalistTenementId];
    [aCoder encodeObject:_relBusiName forKey:kResultDatalistRelBusiName];
    [aCoder encodeObject:_contactDire forKey:kResultDatalistContactDire];
}

- (id)copyWithZone:(NSZone *)zone
{
    ResultDatalist *copy = [[ResultDatalist alloc] init];
    
    if (copy) {

        copy.contactTime = self.contactTime;
        copy.needAppoint = [self.needAppoint copyWithZone:zone];
        copy.contactProvince = [self.contactProvince copyWithZone:zone];
        copy.datalistIdentifier = [self.datalistIdentifier copyWithZone:zone];
        copy.conName = [self.conName copyWithZone:zone];
        copy.contactJoins = [self.contactJoins copyWithZone:zone];
        copy.creatorId = [self.creatorId copyWithZone:zone];
        copy.visTitle = [self.visTitle copyWithZone:zone];
        copy.relBusiId = [self.relBusiId copyWithZone:zone];
        copy.busiTypeName = [self.busiTypeName copyWithZone:zone];
        copy.cusId = [self.cusId copyWithZone:zone];
        copy.datalistDescription = [self.datalistDescription copyWithZone:zone];
        copy.modifierName = [self.modifierName copyWithZone:zone];
        copy.modifiedDatetime = self.modifiedDatetime;
        copy.resultReason = [self.resultReason copyWithZone:zone];
        copy.creatorName = [self.creatorName copyWithZone:zone];
        copy.ownerId = [self.ownerId copyWithZone:zone];
        copy.relBusiTypeName = [self.relBusiTypeName copyWithZone:zone];
        copy.busiType = [self.busiType copyWithZone:zone];
        copy.contactTypeName = [self.contactTypeName copyWithZone:zone];
        copy.contactAddress = [self.contactAddress copyWithZone:zone];
        copy.contactResultName = [self.contactResultName copyWithZone:zone];
        copy.contactCity = [self.contactCity copyWithZone:zone];
        copy.contactZipCode = [self.contactZipCode copyWithZone:zone];
        copy.contactDireName = [self.contactDireName copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.contactType = [self.contactType copyWithZone:zone];
        copy.cusFullname = [self.cusFullname copyWithZone:zone];
        copy.contactDistrict = [self.contactDistrict copyWithZone:zone];
        copy.conId = [self.conId copyWithZone:zone];
        copy.contactResult = [self.contactResult copyWithZone:zone];
        copy.relBusiType = [self.relBusiType copyWithZone:zone];
        copy.contactCountry = [self.contactCountry copyWithZone:zone];
        copy.appointTime = self.appointTime;
        copy.createdDatetime = self.createdDatetime;
        copy.contactContent = [self.contactContent copyWithZone:zone];
        copy.modifierId = [self.modifierId copyWithZone:zone];
        copy.ownerName = [self.ownerName copyWithZone:zone];
        copy.tenementId = [self.tenementId copyWithZone:zone];
        copy.relBusiName = [self.relBusiName copyWithZone:zone];
        copy.contactDire = [self.contactDire copyWithZone:zone];
    }
    
    return copy;
}


@end
