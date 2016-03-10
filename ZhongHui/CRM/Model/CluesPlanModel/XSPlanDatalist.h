//
//  XSPlanDatalist.h
//
//  Created by   on 15/12/29
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface XSPlanDatalist : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *datalistIdentifier;
@property (nonatomic, strong) NSString *conName;
@property (nonatomic, strong) NSString *relBusiId;
@property (nonatomic, strong) NSString *creatorId;
@property (nonatomic, strong) NSString *importanceLevName;
@property (nonatomic, assign) double endtime;
@property (nonatomic, strong) NSString *plaTitle;
@property (nonatomic, strong) NSString *createdDatetimeStr;
@property (nonatomic, strong) NSString *busiTypeName;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *cusId;
@property (nonatomic, assign) BOOL needRemind;
@property (nonatomic, strong) NSString *creatorName;
@property (nonatomic, strong) NSString *ownerId;
@property (nonatomic, strong) NSString *endDate;
@property (nonatomic, strong) NSString *relBusiTypeName;
@property (nonatomic, strong) NSString *busiType;
@property (nonatomic, strong) NSString *contactTypeName;
@property (nonatomic, strong) NSString *importanceLev;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *contactType;
@property (nonatomic, strong) NSString *cusFullname;
@property (nonatomic, strong) NSString *conId;
@property (nonatomic, strong) NSString *relBusiType;
@property (nonatomic, strong) NSString *startDate;
@property (nonatomic, assign) double starttime;
@property (nonatomic, assign) double remindTime;
@property (nonatomic, assign) double createdDatetime;
@property (nonatomic, strong) NSString *statusName;
@property (nonatomic, strong) NSString *contactContent;
@property (nonatomic, strong) NSString *scheduleStatus;
@property (nonatomic, strong) NSString *ownerName;
@property (nonatomic, strong) NSString *relBusiName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
