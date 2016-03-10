//
//  PlanDatalist.m
//
//  Created by   on 15/12/22
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "PlanDatalist.h"


NSString *const kPlanDatalistCloseTime = @"closeTime";
NSString *const kPlanDatalistId = @"id";
NSString *const kPlanDatalistConName = @"conName";
NSString *const kPlanDatalistRelBusiId = @"relBusiId";
NSString *const kPlanDatalistCreatorId = @"creatorId";
NSString *const kPlanDatalistImportanceLevName = @"importanceLevName";
NSString *const kPlanDatalistEndtime = @"endtime";
NSString *const kPlanDatalistPlaTitle = @"plaTitle";
NSString *const kPlanDatalistCreatedDatetime = @"created_Datetime";
NSString *const kPlanDatalistSubject = @"subject";
NSString *const kPlanDatalistBusiTypeName = @"busiTypeName";
NSString *const kPlanDatalistText = @"text";
NSString *const kPlanDatalistCusId = @"cusId";
NSString *const kPlanDatalistDescription = @"description";
NSString *const kPlanDatalistNeedRemind = @"needRemind";
NSString *const kPlanDatalistModifierName = @"modifierName";
NSString *const kPlanDatalistModifiedDatetime = @"modifiedDatetime";
NSString *const kPlanDatalistCreatorName = @"creatorName";
NSString *const kPlanDatalistReasonType = @"reasonType";
NSString *const kPlanDatalistOwnerId = @"ownerId";
NSString *const kPlanDatalistEndDate = @"end_date";
NSString *const kPlanDatalistRelBusiTypeName = @"relBusiTypeName";
NSString *const kPlanDatalistBusiType = @"busiType";
NSString *const kPlanDatalistContactTypeName = @"contactTypeName";
NSString *const kPlanDatalistImportanceLev = @"importanceLev";
NSString *const kPlanDatalistStatus = @"status";
NSString *const kPlanDatalistContactType = @"contactType";
NSString *const kPlanDatalistCusFullname = @"cusFullname";
NSString *const kPlanDatalistPlaContent = @"plaContent";
NSString *const kPlanDatalistConId = @"conId";
NSString *const kPlanDatalistRelBusiType = @"relBusiType";
NSString *const kPlanDatalistStartDate = @"start_date";
NSString *const kPlanDatalistStarttime = @"starttime";
NSString *const kPlanDatalistRemindTime = @"remindTime";
NSString *const kPlanDatalistStatusName = @"statusName";
NSString *const kPlanDatalistCreatedDatetimeStr = @"createdDatetimeStr";
NSString *const kPlanDatalistContactContent = @"contactContent";
NSString *const kPlanDatalistScheduleStatus = @"scheduleStatus";
NSString *const kPlanDatalistModifierId = @"modifierId";
NSString *const kPlanDatalistOwnerName = @"ownerName";
NSString *const kPlanDatalistYeTai = @"yeTai";
NSString *const kPlanDatalistRelBusiName = @"relBusiName";
NSString *const kPlanDatalistOrgId = @"orgId";
NSString *const kPlanDatalistCreated_Datetime = @"created_Datetime";


@interface PlanDatalist ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PlanDatalist

@synthesize closeTime = _closeTime;
@synthesize datalistIdentifier = _datalistIdentifier;
@synthesize conName = _conName;
@synthesize relBusiId = _relBusiId;
@synthesize creatorId = _creatorId;
@synthesize importanceLevName = _importanceLevName;
@synthesize endtime = _endtime;
@synthesize plaTitle = _plaTitle;
@synthesize createdDatetime = _createdDatetime;
@synthesize subject = _subject;
@synthesize busiTypeName = _busiTypeName;
@synthesize text = _text;
@synthesize cusId = _cusId;
@synthesize datalistDescription = _datalistDescription;
@synthesize needRemind = _needRemind;
@synthesize modifierName = _modifierName;
@synthesize modifiedDatetime = _modifiedDatetime;
@synthesize creatorName = _creatorName;
@synthesize reasonType = _reasonType;
@synthesize ownerId = _ownerId;
@synthesize endDate = _endDate;
@synthesize relBusiTypeName = _relBusiTypeName;
@synthesize busiType = _busiType;
@synthesize contactTypeName = _contactTypeName;
@synthesize importanceLev = _importanceLev;
@synthesize status = _status;
@synthesize contactType = _contactType;
@synthesize cusFullname = _cusFullname;
@synthesize plaContent = _plaContent;
@synthesize conId = _conId;
@synthesize relBusiType = _relBusiType;
@synthesize startDate = _startDate;
@synthesize starttime = _starttime;
@synthesize remindTime = _remindTime;
@synthesize statusName = _statusName;
@synthesize contactContent = _contactContent;
@synthesize scheduleStatus = _scheduleStatus;
@synthesize modifierId = _modifierId;
@synthesize ownerName = _ownerName;
@synthesize yeTai = _yeTai;
@synthesize relBusiName = _relBusiName;
@synthesize orgId = _orgId;
@synthesize created_Datetime = _created_Datetime;


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
            self.closeTime = [[self objectOrNilForKey:kPlanDatalistCloseTime fromDictionary:dict] doubleValue];
            self.datalistIdentifier = [self objectOrNilForKey:kPlanDatalistId fromDictionary:dict];
            self.conName = [self objectOrNilForKey:kPlanDatalistConName fromDictionary:dict];
            self.relBusiId = [self objectOrNilForKey:kPlanDatalistRelBusiId fromDictionary:dict];
            self.creatorId = [self objectOrNilForKey:kPlanDatalistCreatorId fromDictionary:dict];
            self.importanceLevName = [self objectOrNilForKey:kPlanDatalistImportanceLevName fromDictionary:dict];
            self.endtime = [[self objectOrNilForKey:kPlanDatalistEndtime fromDictionary:dict] doubleValue];
            self.plaTitle = [self objectOrNilForKey:kPlanDatalistPlaTitle fromDictionary:dict];
            self.subject = [self objectOrNilForKey:kPlanDatalistSubject fromDictionary:dict];
            self.busiTypeName = [self objectOrNilForKey:kPlanDatalistBusiTypeName fromDictionary:dict];
            self.text = [self objectOrNilForKey:kPlanDatalistText fromDictionary:dict];
            self.cusId = [self objectOrNilForKey:kPlanDatalistCusId fromDictionary:dict];
            self.datalistDescription = [self objectOrNilForKey:kPlanDatalistDescription fromDictionary:dict];
            self.needRemind = [[self objectOrNilForKey:kPlanDatalistNeedRemind fromDictionary:dict] boolValue];
            self.modifierName = [self objectOrNilForKey:kPlanDatalistModifierName fromDictionary:dict];
            self.modifiedDatetime = [[self objectOrNilForKey:kPlanDatalistModifiedDatetime fromDictionary:dict] doubleValue];
            self.creatorName = [self objectOrNilForKey:kPlanDatalistCreatorName fromDictionary:dict];
            self.reasonType = [self objectOrNilForKey:kPlanDatalistReasonType fromDictionary:dict];
            self.ownerId = [self objectOrNilForKey:kPlanDatalistOwnerId fromDictionary:dict];
            self.endDate = [self objectOrNilForKey:kPlanDatalistEndDate fromDictionary:dict];
            self.relBusiTypeName = [self objectOrNilForKey:kPlanDatalistRelBusiTypeName fromDictionary:dict];
            self.busiType = [self objectOrNilForKey:kPlanDatalistBusiType fromDictionary:dict];
            self.contactTypeName = [self objectOrNilForKey:kPlanDatalistContactTypeName fromDictionary:dict];
            self.importanceLev = [self objectOrNilForKey:kPlanDatalistImportanceLev fromDictionary:dict];
            self.status = [self objectOrNilForKey:kPlanDatalistStatus fromDictionary:dict];
            self.contactType = [self objectOrNilForKey:kPlanDatalistContactType fromDictionary:dict];
            self.cusFullname = [self objectOrNilForKey:kPlanDatalistCusFullname fromDictionary:dict];
            self.plaContent = [self objectOrNilForKey:kPlanDatalistPlaContent fromDictionary:dict];
            self.conId = [self objectOrNilForKey:kPlanDatalistConId fromDictionary:dict];
            self.relBusiType = [self objectOrNilForKey:kPlanDatalistRelBusiType fromDictionary:dict];
            self.startDate = [self objectOrNilForKey:kPlanDatalistStartDate fromDictionary:dict];
            self.starttime = [[self objectOrNilForKey:kPlanDatalistStarttime fromDictionary:dict] doubleValue];
            self.remindTime = [[self objectOrNilForKey:kPlanDatalistRemindTime fromDictionary:dict] doubleValue];
            self.statusName = [self objectOrNilForKey:kPlanDatalistStatusName fromDictionary:dict];
            self.createdDatetime = [[self objectOrNilForKey:kPlanDatalistCreatedDatetime fromDictionary:dict] doubleValue];
            self.contactContent = [self objectOrNilForKey:kPlanDatalistContactContent fromDictionary:dict];
            self.scheduleStatus = [self objectOrNilForKey:kPlanDatalistScheduleStatus fromDictionary:dict];
            self.modifierId = [self objectOrNilForKey:kPlanDatalistModifierId fromDictionary:dict];
            self.ownerName = [self objectOrNilForKey:kPlanDatalistOwnerName fromDictionary:dict];
            self.yeTai = [self objectOrNilForKey:kPlanDatalistYeTai fromDictionary:dict];
            self.relBusiName = [self objectOrNilForKey:kPlanDatalistRelBusiName fromDictionary:dict];
            self.orgId = [self objectOrNilForKey:kPlanDatalistOrgId fromDictionary:dict];
            self.created_Datetime = [self objectOrNilForKey:kPlanDatalistCreated_Datetime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.closeTime] forKey:kPlanDatalistCloseTime];
    [mutableDict setValue:self.datalistIdentifier forKey:kPlanDatalistId];
    [mutableDict setValue:self.conName forKey:kPlanDatalistConName];
    [mutableDict setValue:self.relBusiId forKey:kPlanDatalistRelBusiId];
    [mutableDict setValue:self.creatorId forKey:kPlanDatalistCreatorId];
    [mutableDict setValue:self.importanceLevName forKey:kPlanDatalistImportanceLevName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endtime] forKey:kPlanDatalistEndtime];
    [mutableDict setValue:self.plaTitle forKey:kPlanDatalistPlaTitle];
    [mutableDict setValue:self.subject forKey:kPlanDatalistSubject];
    [mutableDict setValue:self.busiTypeName forKey:kPlanDatalistBusiTypeName];
    [mutableDict setValue:self.text forKey:kPlanDatalistText];
    [mutableDict setValue:self.cusId forKey:kPlanDatalistCusId];
    [mutableDict setValue:self.datalistDescription forKey:kPlanDatalistDescription];
    [mutableDict setValue:[NSNumber numberWithBool:self.needRemind] forKey:kPlanDatalistNeedRemind];
    [mutableDict setValue:self.modifierName forKey:kPlanDatalistModifierName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifiedDatetime] forKey:kPlanDatalistModifiedDatetime];
    [mutableDict setValue:self.creatorName forKey:kPlanDatalistCreatorName];
    [mutableDict setValue:self.reasonType forKey:kPlanDatalistReasonType];
    [mutableDict setValue:self.ownerId forKey:kPlanDatalistOwnerId];
    [mutableDict setValue:self.endDate forKey:kPlanDatalistEndDate];
    [mutableDict setValue:self.relBusiTypeName forKey:kPlanDatalistRelBusiTypeName];
    [mutableDict setValue:self.busiType forKey:kPlanDatalistBusiType];
    [mutableDict setValue:self.contactTypeName forKey:kPlanDatalistContactTypeName];
    [mutableDict setValue:self.importanceLev forKey:kPlanDatalistImportanceLev];
    [mutableDict setValue:self.status forKey:kPlanDatalistStatus];
    [mutableDict setValue:self.contactType forKey:kPlanDatalistContactType];
    [mutableDict setValue:self.cusFullname forKey:kPlanDatalistCusFullname];
    [mutableDict setValue:self.plaContent forKey:kPlanDatalistPlaContent];
    [mutableDict setValue:self.conId forKey:kPlanDatalistConId];
    [mutableDict setValue:self.relBusiType forKey:kPlanDatalistRelBusiType];
    [mutableDict setValue:self.startDate forKey:kPlanDatalistStartDate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.starttime] forKey:kPlanDatalistStarttime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.remindTime] forKey:kPlanDatalistRemindTime];
    [mutableDict setValue:self.statusName forKey:kPlanDatalistStatusName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdDatetime] forKey:kPlanDatalistCreatedDatetime];
    [mutableDict setValue:self.contactContent forKey:kPlanDatalistContactContent];
    [mutableDict setValue:self.scheduleStatus forKey:kPlanDatalistScheduleStatus];
    [mutableDict setValue:self.modifierId forKey:kPlanDatalistModifierId];
    [mutableDict setValue:self.ownerName forKey:kPlanDatalistOwnerName];
    [mutableDict setValue:self.yeTai forKey:kPlanDatalistYeTai];
    [mutableDict setValue:self.relBusiName forKey:kPlanDatalistRelBusiName];
    [mutableDict setValue:self.orgId forKey:kPlanDatalistOrgId];
    [mutableDict setValue:self.created_Datetime forKey:kPlanDatalistCreated_Datetime];
    
    
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

    self.closeTime = [aDecoder decodeDoubleForKey:kPlanDatalistCloseTime];
    self.datalistIdentifier = [aDecoder decodeObjectForKey:kPlanDatalistId];
    self.conName = [aDecoder decodeObjectForKey:kPlanDatalistConName];
    self.relBusiId = [aDecoder decodeObjectForKey:kPlanDatalistRelBusiId];
    self.creatorId = [aDecoder decodeObjectForKey:kPlanDatalistCreatorId];
    self.importanceLevName = [aDecoder decodeObjectForKey:kPlanDatalistImportanceLevName];
    self.endtime = [aDecoder decodeDoubleForKey:kPlanDatalistEndtime];
    self.plaTitle = [aDecoder decodeObjectForKey:kPlanDatalistPlaTitle];
    self.subject = [aDecoder decodeObjectForKey:kPlanDatalistSubject];
    self.busiTypeName = [aDecoder decodeObjectForKey:kPlanDatalistBusiTypeName];
    self.text = [aDecoder decodeObjectForKey:kPlanDatalistText];
    self.cusId = [aDecoder decodeObjectForKey:kPlanDatalistCusId];
    self.datalistDescription = [aDecoder decodeObjectForKey:kPlanDatalistDescription];
    self.needRemind = [aDecoder decodeBoolForKey:kPlanDatalistNeedRemind];
    self.modifierName = [aDecoder decodeObjectForKey:kPlanDatalistModifierName];
    self.modifiedDatetime = [aDecoder decodeDoubleForKey:kPlanDatalistModifiedDatetime];
    self.creatorName = [aDecoder decodeObjectForKey:kPlanDatalistCreatorName];
    self.reasonType = [aDecoder decodeObjectForKey:kPlanDatalistReasonType];
    self.ownerId = [aDecoder decodeObjectForKey:kPlanDatalistOwnerId];
    self.endDate = [aDecoder decodeObjectForKey:kPlanDatalistEndDate];
    self.relBusiTypeName = [aDecoder decodeObjectForKey:kPlanDatalistRelBusiTypeName];
    self.busiType = [aDecoder decodeObjectForKey:kPlanDatalistBusiType];
    self.contactTypeName = [aDecoder decodeObjectForKey:kPlanDatalistContactTypeName];
    self.importanceLev = [aDecoder decodeObjectForKey:kPlanDatalistImportanceLev];
    self.status = [aDecoder decodeObjectForKey:kPlanDatalistStatus];
    self.contactType = [aDecoder decodeObjectForKey:kPlanDatalistContactType];
    self.cusFullname = [aDecoder decodeObjectForKey:kPlanDatalistCusFullname];
    self.plaContent = [aDecoder decodeObjectForKey:kPlanDatalistPlaContent];
    self.conId = [aDecoder decodeObjectForKey:kPlanDatalistConId];
    self.relBusiType = [aDecoder decodeObjectForKey:kPlanDatalistRelBusiType];
    self.startDate = [aDecoder decodeObjectForKey:kPlanDatalistStartDate];
    self.starttime = [aDecoder decodeDoubleForKey:kPlanDatalistStarttime];
    self.remindTime = [aDecoder decodeDoubleForKey:kPlanDatalistRemindTime];
    self.statusName = [aDecoder decodeObjectForKey:kPlanDatalistStatusName];
    self.createdDatetime = [aDecoder decodeDoubleForKey:kPlanDatalistCreatedDatetime];
    self.contactContent = [aDecoder decodeObjectForKey:kPlanDatalistContactContent];
    self.scheduleStatus = [aDecoder decodeObjectForKey:kPlanDatalistScheduleStatus];
    self.modifierId = [aDecoder decodeObjectForKey:kPlanDatalistModifierId];
    self.ownerName = [aDecoder decodeObjectForKey:kPlanDatalistOwnerName];
    self.yeTai = [aDecoder decodeObjectForKey:kPlanDatalistYeTai];
    self.relBusiName = [aDecoder decodeObjectForKey:kPlanDatalistRelBusiName];
    self.orgId = [aDecoder decodeObjectForKey:kPlanDatalistOrgId];
    self.created_Datetime = [aDecoder decodeObjectForKey:kPlanDatalistCreated_Datetime];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_closeTime forKey:kPlanDatalistCloseTime];
    [aCoder encodeObject:_datalistIdentifier forKey:kPlanDatalistId];
    [aCoder encodeObject:_conName forKey:kPlanDatalistConName];
    [aCoder encodeObject:_relBusiId forKey:kPlanDatalistRelBusiId];
    [aCoder encodeObject:_creatorId forKey:kPlanDatalistCreatorId];
    [aCoder encodeObject:_importanceLevName forKey:kPlanDatalistImportanceLevName];
    [aCoder encodeDouble:_endtime forKey:kPlanDatalistEndtime];
    [aCoder encodeObject:_plaTitle forKey:kPlanDatalistPlaTitle];
    [aCoder encodeObject:_subject forKey:kPlanDatalistSubject];
    [aCoder encodeObject:_busiTypeName forKey:kPlanDatalistBusiTypeName];
    [aCoder encodeObject:_text forKey:kPlanDatalistText];
    [aCoder encodeObject:_cusId forKey:kPlanDatalistCusId];
    [aCoder encodeObject:_datalistDescription forKey:kPlanDatalistDescription];
    [aCoder encodeBool:_needRemind forKey:kPlanDatalistNeedRemind];
    [aCoder encodeObject:_modifierName forKey:kPlanDatalistModifierName];
    [aCoder encodeDouble:_modifiedDatetime forKey:kPlanDatalistModifiedDatetime];
    [aCoder encodeObject:_creatorName forKey:kPlanDatalistCreatorName];
    [aCoder encodeObject:_reasonType forKey:kPlanDatalistReasonType];
    [aCoder encodeObject:_ownerId forKey:kPlanDatalistOwnerId];
    [aCoder encodeObject:_endDate forKey:kPlanDatalistEndDate];
    [aCoder encodeObject:_relBusiTypeName forKey:kPlanDatalistRelBusiTypeName];
    [aCoder encodeObject:_busiType forKey:kPlanDatalistBusiType];
    [aCoder encodeObject:_contactTypeName forKey:kPlanDatalistContactTypeName];
    [aCoder encodeObject:_importanceLev forKey:kPlanDatalistImportanceLev];
    [aCoder encodeObject:_status forKey:kPlanDatalistStatus];
    [aCoder encodeObject:_contactType forKey:kPlanDatalistContactType];
    [aCoder encodeObject:_cusFullname forKey:kPlanDatalistCusFullname];
    [aCoder encodeObject:_plaContent forKey:kPlanDatalistPlaContent];
    [aCoder encodeObject:_conId forKey:kPlanDatalistConId];
    [aCoder encodeObject:_relBusiType forKey:kPlanDatalistRelBusiType];
    [aCoder encodeObject:_startDate forKey:kPlanDatalistStartDate];
    [aCoder encodeDouble:_starttime forKey:kPlanDatalistStarttime];
    [aCoder encodeDouble:_remindTime forKey:kPlanDatalistRemindTime];
    [aCoder encodeObject:_statusName forKey:kPlanDatalistStatusName];
    [aCoder encodeDouble:_createdDatetime forKey:kPlanDatalistCreatedDatetime];
    [aCoder encodeObject:_contactContent forKey:kPlanDatalistContactContent];
    [aCoder encodeObject:_scheduleStatus forKey:kPlanDatalistScheduleStatus];
    [aCoder encodeObject:_modifierId forKey:kPlanDatalistModifierId];
    [aCoder encodeObject:_ownerName forKey:kPlanDatalistOwnerName];
    [aCoder encodeObject:_yeTai forKey:kPlanDatalistYeTai];
    [aCoder encodeObject:_relBusiName forKey:kPlanDatalistRelBusiName];
    [aCoder encodeObject:_orgId forKey:kPlanDatalistOrgId];
    [aCoder encodeObject:_created_Datetime forKey:kPlanDatalistCreated_Datetime];
}

- (id)copyWithZone:(NSZone *)zone
{
    PlanDatalist *copy = [[PlanDatalist alloc] init];
    
    if (copy) {

        copy.closeTime = self.closeTime;
        copy.datalistIdentifier = [self.datalistIdentifier copyWithZone:zone];
        copy.conName = [self.conName copyWithZone:zone];
        copy.relBusiId = [self.relBusiId copyWithZone:zone];
        copy.creatorId = [self.creatorId copyWithZone:zone];
        copy.importanceLevName = [self.importanceLevName copyWithZone:zone];
        copy.endtime = self.endtime;
        copy.plaTitle = [self.plaTitle copyWithZone:zone];
        copy.subject = [self.subject copyWithZone:zone];
        copy.busiTypeName = [self.busiTypeName copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.cusId = [self.cusId copyWithZone:zone];
        copy.datalistDescription = [self.datalistDescription copyWithZone:zone];
        copy.needRemind = self.needRemind;
        copy.modifierName = [self.modifierName copyWithZone:zone];
        copy.modifiedDatetime = self.modifiedDatetime;
        copy.creatorName = [self.creatorName copyWithZone:zone];
        copy.reasonType = [self.reasonType copyWithZone:zone];
        copy.ownerId = [self.ownerId copyWithZone:zone];
        copy.endDate = [self.endDate copyWithZone:zone];
        copy.relBusiTypeName = [self.relBusiTypeName copyWithZone:zone];
        copy.busiType = [self.busiType copyWithZone:zone];
        copy.contactTypeName = [self.contactTypeName copyWithZone:zone];
        copy.importanceLev = [self.importanceLev copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.contactType = [self.contactType copyWithZone:zone];
        copy.cusFullname = [self.cusFullname copyWithZone:zone];
        copy.plaContent = [self.plaContent copyWithZone:zone];
        copy.conId = [self.conId copyWithZone:zone];
        copy.relBusiType = [self.relBusiType copyWithZone:zone];
        copy.startDate = [self.startDate copyWithZone:zone];
        copy.starttime = self.starttime;
        copy.remindTime = self.remindTime;
        copy.statusName = [self.statusName copyWithZone:zone];
        copy.createdDatetime = self.createdDatetime;
        copy.contactContent = [self.contactContent copyWithZone:zone];
        copy.scheduleStatus = [self.scheduleStatus copyWithZone:zone];
        copy.modifierId = [self.modifierId copyWithZone:zone];
        copy.ownerName = [self.ownerName copyWithZone:zone];
        copy.yeTai = [self.yeTai copyWithZone:zone];
        copy.relBusiName = [self.relBusiName copyWithZone:zone];
        copy.orgId = [self.orgId copyWithZone:zone];
        copy.created_Datetime = [self.created_Datetime copyWithZone:zone];
    }
    
    return copy;
}


@end
