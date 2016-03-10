//
//  XSPlanDatalist.m
//
//  Created by   on 15/12/29
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "XSPlanDatalist.h"


NSString *const kXSPlanDatalistId = @"id";
NSString *const kXSPlanDatalistConName = @"conName";
NSString *const kXSPlanDatalistRelBusiId = @"relBusiId";
NSString *const kXSPlanDatalistCreatorId = @"creatorId";
NSString *const kXSPlanDatalistImportanceLevName = @"importanceLevName";
NSString *const kXSPlanDatalistEndtime = @"endtime";
NSString *const kXSPlanDatalistPlaTitle = @"plaTitle";
NSString *const kXSPlanDatalistCreatedDatetime = @"created_Datetime";
NSString *const kXSPlanDatalistBusiTypeName = @"busiTypeName";
NSString *const kXSPlanDatalistText = @"text";
NSString *const kXSPlanDatalistCusId = @"cusId";
NSString *const kXSPlanDatalistNeedRemind = @"needRemind";
NSString *const kXSPlanDatalistCreatorName = @"creatorName";
NSString *const kXSPlanDatalistOwnerId = @"ownerId";
NSString *const kXSPlanDatalistEndDate = @"end_date";
NSString *const kXSPlanDatalistRelBusiTypeName = @"relBusiTypeName";
NSString *const kXSPlanDatalistBusiType = @"busiType";
NSString *const kXSPlanDatalistContactTypeName = @"contactTypeName";
NSString *const kXSPlanDatalistImportanceLev = @"importanceLev";
NSString *const kXSPlanDatalistStatus = @"status";
NSString *const kXSPlanDatalistContactType = @"contactType";
NSString *const kXSPlanDatalistCusFullname = @"cusFullname";
NSString *const kXSPlanDatalistConId = @"conId";
NSString *const kXSPlanDatalistRelBusiType = @"relBusiType";
NSString *const kXSPlanDatalistStartDate = @"start_date";
NSString *const kXSPlanDatalistStarttime = @"starttime";
NSString *const kXSPlanDatalistRemindTime = @"remindTime";
NSString *const kXSPlanDatalistCreatedDatetimeStr = @"createdDatetimeStr";
NSString *const kXSPlanDatalistStatusName = @"statusName";
NSString *const kXSPlanDatalistContactContent = @"contactContent";
NSString *const kXSPlanDatalistScheduleStatus = @"scheduleStatus";
NSString *const kXSPlanDatalistOwnerName = @"ownerName";
NSString *const kXSPlanDatalistRelBusiName = @"relBusiName";


@interface XSPlanDatalist ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation XSPlanDatalist

@synthesize datalistIdentifier = _datalistIdentifier;
@synthesize conName = _conName;
@synthesize relBusiId = _relBusiId;
@synthesize creatorId = _creatorId;
@synthesize importanceLevName = _importanceLevName;
@synthesize endtime = _endtime;
@synthesize plaTitle = _plaTitle;
@synthesize createdDatetime = _createdDatetime;
@synthesize busiTypeName = _busiTypeName;
@synthesize text = _text;
@synthesize cusId = _cusId;
@synthesize needRemind = _needRemind;
@synthesize creatorName = _creatorName;
@synthesize ownerId = _ownerId;
@synthesize endDate = _endDate;
@synthesize relBusiTypeName = _relBusiTypeName;
@synthesize busiType = _busiType;
@synthesize contactTypeName = _contactTypeName;
@synthesize importanceLev = _importanceLev;
@synthesize status = _status;
@synthesize contactType = _contactType;
@synthesize cusFullname = _cusFullname;
@synthesize conId = _conId;
@synthesize relBusiType = _relBusiType;
@synthesize startDate = _startDate;
@synthesize starttime = _starttime;
@synthesize remindTime = _remindTime;
@synthesize createdDatetimeStr = _createdDatetimeStr;
@synthesize statusName = _statusName;
@synthesize contactContent = _contactContent;
@synthesize scheduleStatus = _scheduleStatus;
@synthesize ownerName = _ownerName;
@synthesize relBusiName = _relBusiName;


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
            self.datalistIdentifier = [self objectOrNilForKey:kXSPlanDatalistId fromDictionary:dict];
            self.conName = [self objectOrNilForKey:kXSPlanDatalistConName fromDictionary:dict];
            self.relBusiId = [self objectOrNilForKey:kXSPlanDatalistRelBusiId fromDictionary:dict];
            self.creatorId = [self objectOrNilForKey:kXSPlanDatalistCreatorId fromDictionary:dict];
            self.importanceLevName = [self objectOrNilForKey:kXSPlanDatalistImportanceLevName fromDictionary:dict];
            self.endtime = [[self objectOrNilForKey:kXSPlanDatalistEndtime fromDictionary:dict] doubleValue];
            self.plaTitle = [self objectOrNilForKey:kXSPlanDatalistPlaTitle fromDictionary:dict];
            self.createdDatetimeStr = [self objectOrNilForKey:kXSPlanDatalistCreatedDatetimeStr fromDictionary:dict];
            self.busiTypeName = [self objectOrNilForKey:kXSPlanDatalistBusiTypeName fromDictionary:dict];
            self.text = [self objectOrNilForKey:kXSPlanDatalistText fromDictionary:dict];
            self.cusId = [self objectOrNilForKey:kXSPlanDatalistCusId fromDictionary:dict];
            self.needRemind = [[self objectOrNilForKey:kXSPlanDatalistNeedRemind fromDictionary:dict] boolValue];
            self.creatorName = [self objectOrNilForKey:kXSPlanDatalistCreatorName fromDictionary:dict];
            self.ownerId = [self objectOrNilForKey:kXSPlanDatalistOwnerId fromDictionary:dict];
            self.endDate = [self objectOrNilForKey:kXSPlanDatalistEndDate fromDictionary:dict];
            self.relBusiTypeName = [self objectOrNilForKey:kXSPlanDatalistRelBusiTypeName fromDictionary:dict];
            self.busiType = [self objectOrNilForKey:kXSPlanDatalistBusiType fromDictionary:dict];
            self.contactTypeName = [self objectOrNilForKey:kXSPlanDatalistContactTypeName fromDictionary:dict];
            self.importanceLev = [self objectOrNilForKey:kXSPlanDatalistImportanceLev fromDictionary:dict];
            self.status = [self objectOrNilForKey:kXSPlanDatalistStatus fromDictionary:dict];
            self.contactType = [self objectOrNilForKey:kXSPlanDatalistContactType fromDictionary:dict];
            self.cusFullname = [self objectOrNilForKey:kXSPlanDatalistCusFullname fromDictionary:dict];
            self.conId = [self objectOrNilForKey:kXSPlanDatalistConId fromDictionary:dict];
            self.relBusiType = [self objectOrNilForKey:kXSPlanDatalistRelBusiType fromDictionary:dict];
            self.startDate = [self objectOrNilForKey:kXSPlanDatalistStartDate fromDictionary:dict];
            self.starttime = [[self objectOrNilForKey:kXSPlanDatalistStarttime fromDictionary:dict] doubleValue];
            self.remindTime = [[self objectOrNilForKey:kXSPlanDatalistRemindTime fromDictionary:dict] doubleValue];
            self.createdDatetime = [[self objectOrNilForKey:kXSPlanDatalistCreatedDatetime fromDictionary:dict] doubleValue];
            self.statusName = [self objectOrNilForKey:kXSPlanDatalistStatusName fromDictionary:dict];
            self.contactContent = [self objectOrNilForKey:kXSPlanDatalistContactContent fromDictionary:dict];
            self.scheduleStatus = [self objectOrNilForKey:kXSPlanDatalistScheduleStatus fromDictionary:dict];
            self.ownerName = [self objectOrNilForKey:kXSPlanDatalistOwnerName fromDictionary:dict];
            self.relBusiName = [self objectOrNilForKey:kXSPlanDatalistRelBusiName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.datalistIdentifier forKey:kXSPlanDatalistId];
    [mutableDict setValue:self.conName forKey:kXSPlanDatalistConName];
    [mutableDict setValue:self.relBusiId forKey:kXSPlanDatalistRelBusiId];
    [mutableDict setValue:self.creatorId forKey:kXSPlanDatalistCreatorId];
    [mutableDict setValue:self.importanceLevName forKey:kXSPlanDatalistImportanceLevName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endtime] forKey:kXSPlanDatalistEndtime];
    [mutableDict setValue:self.plaTitle forKey:kXSPlanDatalistPlaTitle];
    [mutableDict setValue:self.createdDatetimeStr forKey:kXSPlanDatalistCreatedDatetimeStr];
    [mutableDict setValue:self.busiTypeName forKey:kXSPlanDatalistBusiTypeName];
    [mutableDict setValue:self.text forKey:kXSPlanDatalistText];
    [mutableDict setValue:self.cusId forKey:kXSPlanDatalistCusId];
    [mutableDict setValue:[NSNumber numberWithBool:self.needRemind] forKey:kXSPlanDatalistNeedRemind];
    [mutableDict setValue:self.creatorName forKey:kXSPlanDatalistCreatorName];
    [mutableDict setValue:self.ownerId forKey:kXSPlanDatalistOwnerId];
    [mutableDict setValue:self.endDate forKey:kXSPlanDatalistEndDate];
    [mutableDict setValue:self.relBusiTypeName forKey:kXSPlanDatalistRelBusiTypeName];
    [mutableDict setValue:self.busiType forKey:kXSPlanDatalistBusiType];
    [mutableDict setValue:self.contactTypeName forKey:kXSPlanDatalistContactTypeName];
    [mutableDict setValue:self.importanceLev forKey:kXSPlanDatalistImportanceLev];
    [mutableDict setValue:self.status forKey:kXSPlanDatalistStatus];
    [mutableDict setValue:self.contactType forKey:kXSPlanDatalistContactType];
    [mutableDict setValue:self.cusFullname forKey:kXSPlanDatalistCusFullname];
    [mutableDict setValue:self.conId forKey:kXSPlanDatalistConId];
    [mutableDict setValue:self.relBusiType forKey:kXSPlanDatalistRelBusiType];
    [mutableDict setValue:self.startDate forKey:kXSPlanDatalistStartDate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.starttime] forKey:kXSPlanDatalistStarttime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.remindTime] forKey:kXSPlanDatalistRemindTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdDatetime] forKey:kXSPlanDatalistCreatedDatetime];
    [mutableDict setValue:self.statusName forKey:kXSPlanDatalistStatusName];
    [mutableDict setValue:self.contactContent forKey:kXSPlanDatalistContactContent];
    [mutableDict setValue:self.scheduleStatus forKey:kXSPlanDatalistScheduleStatus];
    [mutableDict setValue:self.ownerName forKey:kXSPlanDatalistOwnerName];
    [mutableDict setValue:self.relBusiName forKey:kXSPlanDatalistRelBusiName];

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

    self.datalistIdentifier = [aDecoder decodeObjectForKey:kXSPlanDatalistId];
    self.conName = [aDecoder decodeObjectForKey:kXSPlanDatalistConName];
    self.relBusiId = [aDecoder decodeObjectForKey:kXSPlanDatalistRelBusiId];
    self.creatorId = [aDecoder decodeObjectForKey:kXSPlanDatalistCreatorId];
    self.importanceLevName = [aDecoder decodeObjectForKey:kXSPlanDatalistImportanceLevName];
    self.endtime = [aDecoder decodeDoubleForKey:kXSPlanDatalistEndtime];
    self.plaTitle = [aDecoder decodeObjectForKey:kXSPlanDatalistPlaTitle];
    self.createdDatetimeStr = [aDecoder decodeObjectForKey:kXSPlanDatalistCreatedDatetimeStr];
    self.busiTypeName = [aDecoder decodeObjectForKey:kXSPlanDatalistBusiTypeName];
    self.text = [aDecoder decodeObjectForKey:kXSPlanDatalistText];
    self.cusId = [aDecoder decodeObjectForKey:kXSPlanDatalistCusId];
    self.needRemind = [aDecoder decodeBoolForKey:kXSPlanDatalistNeedRemind];
    self.creatorName = [aDecoder decodeObjectForKey:kXSPlanDatalistCreatorName];
    self.ownerId = [aDecoder decodeObjectForKey:kXSPlanDatalistOwnerId];
    self.endDate = [aDecoder decodeObjectForKey:kXSPlanDatalistEndDate];
    self.relBusiTypeName = [aDecoder decodeObjectForKey:kXSPlanDatalistRelBusiTypeName];
    self.busiType = [aDecoder decodeObjectForKey:kXSPlanDatalistBusiType];
    self.contactTypeName = [aDecoder decodeObjectForKey:kXSPlanDatalistContactTypeName];
    self.importanceLev = [aDecoder decodeObjectForKey:kXSPlanDatalistImportanceLev];
    self.status = [aDecoder decodeObjectForKey:kXSPlanDatalistStatus];
    self.contactType = [aDecoder decodeObjectForKey:kXSPlanDatalistContactType];
    self.cusFullname = [aDecoder decodeObjectForKey:kXSPlanDatalistCusFullname];
    self.conId = [aDecoder decodeObjectForKey:kXSPlanDatalistConId];
    self.relBusiType = [aDecoder decodeObjectForKey:kXSPlanDatalistRelBusiType];
    self.startDate = [aDecoder decodeObjectForKey:kXSPlanDatalistStartDate];
    self.starttime = [aDecoder decodeDoubleForKey:kXSPlanDatalistStarttime];
    self.remindTime = [aDecoder decodeDoubleForKey:kXSPlanDatalistRemindTime];
    self.createdDatetime = [aDecoder decodeDoubleForKey:kXSPlanDatalistCreatedDatetime];
    self.statusName = [aDecoder decodeObjectForKey:kXSPlanDatalistStatusName];
    self.contactContent = [aDecoder decodeObjectForKey:kXSPlanDatalistContactContent];
    self.scheduleStatus = [aDecoder decodeObjectForKey:kXSPlanDatalistScheduleStatus];
    self.ownerName = [aDecoder decodeObjectForKey:kXSPlanDatalistOwnerName];
    self.relBusiName = [aDecoder decodeObjectForKey:kXSPlanDatalistRelBusiName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_datalistIdentifier forKey:kXSPlanDatalistId];
    [aCoder encodeObject:_conName forKey:kXSPlanDatalistConName];
    [aCoder encodeObject:_relBusiId forKey:kXSPlanDatalistRelBusiId];
    [aCoder encodeObject:_creatorId forKey:kXSPlanDatalistCreatorId];
    [aCoder encodeObject:_importanceLevName forKey:kXSPlanDatalistImportanceLevName];
    [aCoder encodeDouble:_endtime forKey:kXSPlanDatalistEndtime];
    [aCoder encodeObject:_plaTitle forKey:kXSPlanDatalistPlaTitle];
    [aCoder encodeObject:_createdDatetimeStr forKey:kXSPlanDatalistCreatedDatetimeStr];
    [aCoder encodeObject:_busiTypeName forKey:kXSPlanDatalistBusiTypeName];
    [aCoder encodeObject:_text forKey:kXSPlanDatalistText];
    [aCoder encodeObject:_cusId forKey:kXSPlanDatalistCusId];
    [aCoder encodeBool:_needRemind forKey:kXSPlanDatalistNeedRemind];
    [aCoder encodeObject:_creatorName forKey:kXSPlanDatalistCreatorName];
    [aCoder encodeObject:_ownerId forKey:kXSPlanDatalistOwnerId];
    [aCoder encodeObject:_endDate forKey:kXSPlanDatalistEndDate];
    [aCoder encodeObject:_relBusiTypeName forKey:kXSPlanDatalistRelBusiTypeName];
    [aCoder encodeObject:_busiType forKey:kXSPlanDatalistBusiType];
    [aCoder encodeObject:_contactTypeName forKey:kXSPlanDatalistContactTypeName];
    [aCoder encodeObject:_importanceLev forKey:kXSPlanDatalistImportanceLev];
    [aCoder encodeObject:_status forKey:kXSPlanDatalistStatus];
    [aCoder encodeObject:_contactType forKey:kXSPlanDatalistContactType];
    [aCoder encodeObject:_cusFullname forKey:kXSPlanDatalistCusFullname];
    [aCoder encodeObject:_conId forKey:kXSPlanDatalistConId];
    [aCoder encodeObject:_relBusiType forKey:kXSPlanDatalistRelBusiType];
    [aCoder encodeObject:_startDate forKey:kXSPlanDatalistStartDate];
    [aCoder encodeDouble:_starttime forKey:kXSPlanDatalistStarttime];
    [aCoder encodeDouble:_remindTime forKey:kXSPlanDatalistRemindTime];
    [aCoder encodeDouble:_createdDatetime forKey:kXSPlanDatalistCreatedDatetime];
    [aCoder encodeObject:_statusName forKey:kXSPlanDatalistStatusName];
    [aCoder encodeObject:_contactContent forKey:kXSPlanDatalistContactContent];
    [aCoder encodeObject:_scheduleStatus forKey:kXSPlanDatalistScheduleStatus];
    [aCoder encodeObject:_ownerName forKey:kXSPlanDatalistOwnerName];
    [aCoder encodeObject:_relBusiName forKey:kXSPlanDatalistRelBusiName];
}

- (id)copyWithZone:(NSZone *)zone
{
    XSPlanDatalist *copy = [[XSPlanDatalist alloc] init];
    
    if (copy) {

        copy.datalistIdentifier = [self.datalistIdentifier copyWithZone:zone];
        copy.conName = [self.conName copyWithZone:zone];
        copy.relBusiId = [self.relBusiId copyWithZone:zone];
        copy.creatorId = [self.creatorId copyWithZone:zone];
        copy.importanceLevName = [self.importanceLevName copyWithZone:zone];
        copy.endtime = self.endtime;
        copy.plaTitle = [self.plaTitle copyWithZone:zone];
        copy.createdDatetimeStr = [self.createdDatetimeStr copyWithZone:zone];
        copy.busiTypeName = [self.busiTypeName copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.cusId = [self.cusId copyWithZone:zone];
        copy.needRemind = self.needRemind;
        copy.creatorName = [self.creatorName copyWithZone:zone];
        copy.ownerId = [self.ownerId copyWithZone:zone];
        copy.endDate = [self.endDate copyWithZone:zone];
        copy.relBusiTypeName = [self.relBusiTypeName copyWithZone:zone];
        copy.busiType = [self.busiType copyWithZone:zone];
        copy.contactTypeName = [self.contactTypeName copyWithZone:zone];
        copy.importanceLev = [self.importanceLev copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.contactType = [self.contactType copyWithZone:zone];
        copy.cusFullname = [self.cusFullname copyWithZone:zone];
        copy.conId = [self.conId copyWithZone:zone];
        copy.relBusiType = [self.relBusiType copyWithZone:zone];
        copy.startDate = [self.startDate copyWithZone:zone];
        copy.starttime = self.starttime;
        copy.remindTime = self.remindTime;
        copy.createdDatetime = self.createdDatetime;
        copy.statusName = [self.statusName copyWithZone:zone];
        copy.contactContent = [self.contactContent copyWithZone:zone];
        copy.scheduleStatus = [self.scheduleStatus copyWithZone:zone];
        copy.ownerName = [self.ownerName copyWithZone:zone];
        copy.relBusiName = [self.relBusiName copyWithZone:zone];
    }
    
    return copy;
}


@end
