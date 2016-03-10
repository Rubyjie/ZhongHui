//
//  PlanDeailsData.m
//
//  Created by   on 15/12/22
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "PlanDeailsData.h"


NSString *const kDataId = @"id";
NSString *const kDataConName = @"conName";
NSString *const kDataRelBusiId = @"relBusiId";
NSString *const kDataCloseTimeVo = @"closeTimeVo";
NSString *const kDataCreatorId = @"creatorId";
NSString *const kDataImportanceLevName = @"importanceLevName";
NSString *const kDataEndtime = @"endtime";
NSString *const kDataPlaTitle = @"plaTitle";
NSString *const kDataCreatedDatetime = @"created_Datetime";
NSString *const kDataSubject = @"subject";
NSString *const kDataText = @"text";
NSString *const kDataBusiTypeName = @"busiTypeName";
NSString *const kDataCusId = @"cusId";
NSString *const kDataDescription = @"description";
NSString *const kDataNeedRemind = @"needRemind";
NSString *const kDataModifierName = @"modifierName";
NSString *const kDataModifiedDatetime = @"modifiedDatetime";
NSString *const kDataCreatorName = @"creatorName";
NSString *const kDataOwnerId = @"ownerId";
NSString *const kDataEndDate = @"end_date";
NSString *const kDataRelBusiTypeName = @"relBusiTypeName";
NSString *const kDataBusiType = @"busiType";
NSString *const kDataContactTypeName = @"contactTypeName";
NSString *const kDataImportanceLev = @"importanceLev";
NSString *const kDataStatus = @"status";
NSString *const kDataContactType = @"contactType";
NSString *const kDataCusFullname = @"cusFullname";
NSString *const kDataPlaContent = @"plaContent";
NSString *const kDataConId = @"conId";
NSString *const kDataRelBusiType = @"relBusiType";
NSString *const kDataStartDate = @"start_date";
NSString *const kDataStarttime = @"starttime";
NSString *const kDataRemindTime = @"remindTime";
NSString *const kDataStatusName = @"statusName";
NSString *const kDataContactContent = @"contactContent";
NSString *const kDataScheduleStatus = @"scheduleStatus";
NSString *const kDataModifierId = @"modifierId";
NSString *const kDataOwnerName = @"ownerName";
NSString *const kDataRelBusiName = @"relBusiName";


@interface PlanDeailsData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PlanDeailsData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize conName = _conName;
@synthesize relBusiId = _relBusiId;
@synthesize closeTimeVo = _closeTimeVo;
@synthesize creatorId = _creatorId;
@synthesize importanceLevName = _importanceLevName;
@synthesize endtime = _endtime;
@synthesize plaTitle = _plaTitle;
@synthesize createdDatetime = _createdDatetime;
@synthesize subject = _subject;
@synthesize text = _text;
@synthesize busiTypeName = _busiTypeName;
@synthesize cusId = _cusId;
@synthesize dataDescription = _dataDescription;
@synthesize needRemind = _needRemind;
@synthesize modifierName = _modifierName;
@synthesize modifiedDatetime = _modifiedDatetime;
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
        self.dataIdentifier = [self objectOrNilForKey:kDataId fromDictionary:dict];
        self.conName = [self objectOrNilForKey:kDataConName fromDictionary:dict];
        self.relBusiId = [self objectOrNilForKey:kDataRelBusiId fromDictionary:dict];
        self.closeTimeVo = [self objectOrNilForKey:kDataCloseTimeVo fromDictionary:dict];
        self.creatorId = [self objectOrNilForKey:kDataCreatorId fromDictionary:dict];
        self.importanceLevName = [self objectOrNilForKey:kDataImportanceLevName fromDictionary:dict];
        self.endtime = [[self objectOrNilForKey:kDataEndtime fromDictionary:dict] doubleValue];
        self.plaTitle = [self objectOrNilForKey:kDataPlaTitle fromDictionary:dict];
        self.subject = [self objectOrNilForKey:kDataSubject fromDictionary:dict];
        self.text = [self objectOrNilForKey:kDataText fromDictionary:dict];
        self.busiTypeName = [self objectOrNilForKey:kDataBusiTypeName fromDictionary:dict];
        self.cusId = [self objectOrNilForKey:kDataCusId fromDictionary:dict];
        self.dataDescription = [self objectOrNilForKey:kDataDescription fromDictionary:dict];
        self.needRemind = [[self objectOrNilForKey:kDataNeedRemind fromDictionary:dict] boolValue];
        self.modifierName = [self objectOrNilForKey:kDataModifierName fromDictionary:dict];
        self.modifiedDatetime = [[self objectOrNilForKey:kDataModifiedDatetime fromDictionary:dict] doubleValue];
        self.creatorName = [self objectOrNilForKey:kDataCreatorName fromDictionary:dict];
        self.ownerId = [self objectOrNilForKey:kDataOwnerId fromDictionary:dict];
        self.endDate = [self objectOrNilForKey:kDataEndDate fromDictionary:dict];
        self.relBusiTypeName = [self objectOrNilForKey:kDataRelBusiTypeName fromDictionary:dict];
        self.busiType = [self objectOrNilForKey:kDataBusiType fromDictionary:dict];
        self.contactTypeName = [self objectOrNilForKey:kDataContactTypeName fromDictionary:dict];
        self.importanceLev = [self objectOrNilForKey:kDataImportanceLev fromDictionary:dict];
        self.status = [self objectOrNilForKey:kDataStatus fromDictionary:dict];
        self.contactType = [self objectOrNilForKey:kDataContactType fromDictionary:dict];
        self.cusFullname = [self objectOrNilForKey:kDataCusFullname fromDictionary:dict];
        self.plaContent = [self objectOrNilForKey:kDataPlaContent fromDictionary:dict];
        self.conId = [self objectOrNilForKey:kDataConId fromDictionary:dict];
        self.relBusiType = [self objectOrNilForKey:kDataRelBusiType fromDictionary:dict];
        self.startDate = [self objectOrNilForKey:kDataStartDate fromDictionary:dict];
        self.starttime = [[self objectOrNilForKey:kDataStarttime fromDictionary:dict] doubleValue];
        self.remindTime = [[self objectOrNilForKey:kDataRemindTime fromDictionary:dict] doubleValue];
        self.statusName = [self objectOrNilForKey:kDataStatusName fromDictionary:dict];
        self.createdDatetime = [[self objectOrNilForKey:kDataCreatedDatetime fromDictionary:dict] doubleValue];
        self.contactContent = [self objectOrNilForKey:kDataContactContent fromDictionary:dict];
        self.scheduleStatus = [self objectOrNilForKey:kDataScheduleStatus fromDictionary:dict];
        self.modifierId = [self objectOrNilForKey:kDataModifierId fromDictionary:dict];
        self.ownerName = [self objectOrNilForKey:kDataOwnerName fromDictionary:dict];
        self.relBusiName = [self objectOrNilForKey:kDataRelBusiName fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kDataId];
    [mutableDict setValue:self.conName forKey:kDataConName];
    [mutableDict setValue:self.relBusiId forKey:kDataRelBusiId];
    [mutableDict setValue:self.closeTimeVo forKey:kDataCloseTimeVo];
    [mutableDict setValue:self.creatorId forKey:kDataCreatorId];
    [mutableDict setValue:self.importanceLevName forKey:kDataImportanceLevName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endtime] forKey:kDataEndtime];
    [mutableDict setValue:self.plaTitle forKey:kDataPlaTitle];
    [mutableDict setValue:self.subject forKey:kDataSubject];
    [mutableDict setValue:self.text forKey:kDataText];
    [mutableDict setValue:self.busiTypeName forKey:kDataBusiTypeName];
    [mutableDict setValue:self.cusId forKey:kDataCusId];
    [mutableDict setValue:self.dataDescription forKey:kDataDescription];
    [mutableDict setValue:[NSNumber numberWithBool:self.needRemind] forKey:kDataNeedRemind];
    [mutableDict setValue:self.modifierName forKey:kDataModifierName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modifiedDatetime] forKey:kDataModifiedDatetime];
    [mutableDict setValue:self.creatorName forKey:kDataCreatorName];
    [mutableDict setValue:self.ownerId forKey:kDataOwnerId];
    [mutableDict setValue:self.endDate forKey:kDataEndDate];
    [mutableDict setValue:self.relBusiTypeName forKey:kDataRelBusiTypeName];
    [mutableDict setValue:self.busiType forKey:kDataBusiType];
    [mutableDict setValue:self.contactTypeName forKey:kDataContactTypeName];
    [mutableDict setValue:self.importanceLev forKey:kDataImportanceLev];
    [mutableDict setValue:self.status forKey:kDataStatus];
    [mutableDict setValue:self.contactType forKey:kDataContactType];
    [mutableDict setValue:self.cusFullname forKey:kDataCusFullname];
    [mutableDict setValue:self.plaContent forKey:kDataPlaContent];
    [mutableDict setValue:self.conId forKey:kDataConId];
    [mutableDict setValue:self.relBusiType forKey:kDataRelBusiType];
    [mutableDict setValue:self.startDate forKey:kDataStartDate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.starttime] forKey:kDataStarttime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.remindTime] forKey:kDataRemindTime];
    [mutableDict setValue:self.statusName forKey:kDataStatusName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdDatetime] forKey:kDataCreatedDatetime];
    [mutableDict setValue:self.contactContent forKey:kDataContactContent];
    [mutableDict setValue:self.scheduleStatus forKey:kDataScheduleStatus];
    [mutableDict setValue:self.modifierId forKey:kDataModifierId];
    [mutableDict setValue:self.ownerName forKey:kDataOwnerName];
    [mutableDict setValue:self.relBusiName forKey:kDataRelBusiName];
    
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
    
    self.dataIdentifier = [aDecoder decodeObjectForKey:kDataId];
    self.conName = [aDecoder decodeObjectForKey:kDataConName];
    self.relBusiId = [aDecoder decodeObjectForKey:kDataRelBusiId];
    self.closeTimeVo = [aDecoder decodeObjectForKey:kDataCloseTimeVo];
    self.creatorId = [aDecoder decodeObjectForKey:kDataCreatorId];
    self.importanceLevName = [aDecoder decodeObjectForKey:kDataImportanceLevName];
    self.endtime = [aDecoder decodeDoubleForKey:kDataEndtime];
    self.plaTitle = [aDecoder decodeObjectForKey:kDataPlaTitle];
    self.subject = [aDecoder decodeObjectForKey:kDataSubject];
    self.text = [aDecoder decodeObjectForKey:kDataText];
    self.busiTypeName = [aDecoder decodeObjectForKey:kDataBusiTypeName];
    self.cusId = [aDecoder decodeObjectForKey:kDataCusId];
    self.dataDescription = [aDecoder decodeObjectForKey:kDataDescription];
    self.needRemind = [aDecoder decodeBoolForKey:kDataNeedRemind];
    self.modifierName = [aDecoder decodeObjectForKey:kDataModifierName];
    self.modifiedDatetime = [aDecoder decodeDoubleForKey:kDataModifiedDatetime];
    self.creatorName = [aDecoder decodeObjectForKey:kDataCreatorName];
    self.ownerId = [aDecoder decodeObjectForKey:kDataOwnerId];
    self.endDate = [aDecoder decodeObjectForKey:kDataEndDate];
    self.relBusiTypeName = [aDecoder decodeObjectForKey:kDataRelBusiTypeName];
    self.busiType = [aDecoder decodeObjectForKey:kDataBusiType];
    self.contactTypeName = [aDecoder decodeObjectForKey:kDataContactTypeName];
    self.importanceLev = [aDecoder decodeObjectForKey:kDataImportanceLev];
    self.status = [aDecoder decodeObjectForKey:kDataStatus];
    self.contactType = [aDecoder decodeObjectForKey:kDataContactType];
    self.cusFullname = [aDecoder decodeObjectForKey:kDataCusFullname];
    self.plaContent = [aDecoder decodeObjectForKey:kDataPlaContent];
    self.conId = [aDecoder decodeObjectForKey:kDataConId];
    self.relBusiType = [aDecoder decodeObjectForKey:kDataRelBusiType];
    self.startDate = [aDecoder decodeObjectForKey:kDataStartDate];
    self.starttime = [aDecoder decodeDoubleForKey:kDataStarttime];
    self.remindTime = [aDecoder decodeDoubleForKey:kDataRemindTime];
    self.statusName = [aDecoder decodeObjectForKey:kDataStatusName];
    self.createdDatetime = [aDecoder decodeDoubleForKey:kDataCreatedDatetime];
    self.contactContent = [aDecoder decodeObjectForKey:kDataContactContent];
    self.scheduleStatus = [aDecoder decodeObjectForKey:kDataScheduleStatus];
    self.modifierId = [aDecoder decodeObjectForKey:kDataModifierId];
    self.ownerName = [aDecoder decodeObjectForKey:kDataOwnerName];
    self.relBusiName = [aDecoder decodeObjectForKey:kDataRelBusiName];
    return self;
}


- (void)encodeWithCoder:(NSCoder *)aCoder
{

    
    [aCoder encodeObject:_dataIdentifier forKey:kDataId];
    [aCoder encodeObject:_conName forKey:kDataConName];
    [aCoder encodeObject:_relBusiId forKey:kDataRelBusiId];
    [aCoder encodeObject:_closeTimeVo forKey:kDataCloseTimeVo];
    [aCoder encodeObject:_creatorId forKey:kDataCreatorId];
    [aCoder encodeObject:_importanceLevName forKey:kDataImportanceLevName];
    [aCoder encodeDouble:_endtime forKey:kDataEndtime];
    [aCoder encodeObject:_plaTitle forKey:kDataPlaTitle];
    [aCoder encodeObject:_subject forKey:kDataSubject];
    [aCoder encodeObject:_text forKey:kDataText];
    [aCoder encodeObject:_busiTypeName forKey:kDataBusiTypeName];
    [aCoder encodeObject:_cusId forKey:kDataCusId];
    [aCoder encodeObject:_dataDescription forKey:kDataDescription];
    [aCoder encodeBool:_needRemind forKey:kDataNeedRemind];
    [aCoder encodeObject:_modifierName forKey:kDataModifierName];
    [aCoder encodeDouble:_modifiedDatetime forKey:kDataModifiedDatetime];
    [aCoder encodeObject:_creatorName forKey:kDataCreatorName];
    [aCoder encodeObject:_ownerId forKey:kDataOwnerId];
    [aCoder encodeObject:_endDate forKey:kDataEndDate];
    [aCoder encodeObject:_relBusiTypeName forKey:kDataRelBusiTypeName];
    [aCoder encodeObject:_busiType forKey:kDataBusiType];
    [aCoder encodeObject:_contactTypeName forKey:kDataContactTypeName];
    [aCoder encodeObject:_importanceLev forKey:kDataImportanceLev];
    [aCoder encodeObject:_status forKey:kDataStatus];
    [aCoder encodeObject:_contactType forKey:kDataContactType];
    [aCoder encodeObject:_cusFullname forKey:kDataCusFullname];
    [aCoder encodeObject:_plaContent forKey:kDataPlaContent];
    [aCoder encodeObject:_conId forKey:kDataConId];
    [aCoder encodeObject:_relBusiType forKey:kDataRelBusiType];
    [aCoder encodeObject:_startDate forKey:kDataStartDate];
    [aCoder encodeDouble:_starttime forKey:kDataStarttime];
    [aCoder encodeDouble:_remindTime forKey:kDataRemindTime];
    [aCoder encodeObject:_statusName forKey:kDataStatusName];
    [aCoder encodeDouble:_createdDatetime forKey:kDataCreatedDatetime];
    [aCoder encodeObject:_contactContent forKey:kDataContactContent];
    [aCoder encodeObject:_scheduleStatus forKey:kDataScheduleStatus];
    [aCoder encodeObject:_modifierId forKey:kDataModifierId];
    [aCoder encodeObject:_ownerName forKey:kDataOwnerName];
    [aCoder encodeObject:_relBusiName forKey:kDataRelBusiName];}

- (id)copyWithZone:(NSZone *)zone
{
    PlanDeailsData *copy = [[PlanDeailsData alloc] init];
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.conName = [self.conName copyWithZone:zone];
        copy.relBusiId = [self.relBusiId copyWithZone:zone];
        copy.closeTimeVo = [self.closeTimeVo copyWithZone:zone];
        copy.creatorId = [self.creatorId copyWithZone:zone];
        copy.importanceLevName = [self.importanceLevName copyWithZone:zone];
        copy.endtime = self.endtime;
        copy.plaTitle = [self.plaTitle copyWithZone:zone];
        copy.subject = [self.subject copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.busiTypeName = [self.busiTypeName copyWithZone:zone];
        copy.cusId = [self.cusId copyWithZone:zone];
        copy.dataDescription = [self.dataDescription copyWithZone:zone];
        copy.needRemind = self.needRemind;
        copy.modifierName = [self.modifierName copyWithZone:zone];
        copy.modifiedDatetime = self.modifiedDatetime;
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
        copy.relBusiName = [self.relBusiName copyWithZone:zone];
    }
    
    return copy;
}


@end
