//
//  cluesDatalist.h
//
//  Created by   on 15/12/25
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface cluesDatalist : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *ownerGroupId;
@property (nonatomic, strong) NSString *startLevel;
@property (nonatomic, assign) double createdDatetime;
@property (nonatomic, strong) NSString *datalistIdentifier;
@property (nonatomic, strong) NSString *transferReasonName;
@property (nonatomic, strong) NSString *regionIdProvince;
@property (nonatomic, strong) NSString *followupResult;
@property (nonatomic, strong) NSString *cusId;
@property (nonatomic, strong) NSString *userNature;
@property (nonatomic, strong) NSString *modifierName;
@property (nonatomic, strong) NSString *userNatureName;
@property (nonatomic, strong) NSString *busiDepart;
@property (nonatomic, assign) double modifiedDatetime;
@property (nonatomic, assign) double cPoints;
@property (nonatomic, strong) NSString *ownerId;
@property (nonatomic, strong) NSString *orgName;
@property (nonatomic, assign) double findTime;
@property (nonatomic, strong) NSString *regionAddr;
@property (nonatomic, assign) double cContact;
@property (nonatomic, strong) NSString *cusType;
@property (nonatomic, strong) NSString *busiDepartName;
@property (nonatomic, strong) NSString *findSourceName;
@property (nonatomic, strong) NSString *closeResult;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *cusFullname;
@property (nonatomic, strong) NSString *cusTypeName;
@property (nonatomic, strong) NSString *regionIdCountry;
@property (nonatomic, strong) NSString *statusName;
@property (nonatomic, strong) NSString *modifierId;
@property (nonatomic, strong) NSString *ownerName;
@property (nonatomic, assign) double openDate;
@property (nonatomic, strong) NSString *startLevelName;
@property (nonatomic, strong) NSString *busiNatureName;
@property (nonatomic, assign) double contactTimeLast;
@property (nonatomic, strong) NSString *followupResultName;
@property (nonatomic, strong) NSString *transferReason;
@property (nonatomic, strong) NSString *findSourceId;
@property (nonatomic, strong) NSString *busiNature;
@property (nonatomic, strong) NSString *orgId;
@property (nonatomic, strong) NSString *customerLevelName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
