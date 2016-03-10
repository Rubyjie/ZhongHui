//
//  CluesXqData.h
//
//  Created by   on 16/1/20
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CluesXqData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *userSize;
@property (nonatomic, strong) NSString *startLevel;
@property (nonatomic, strong) NSString *orgId;
@property (nonatomic, strong) NSString *userSizeName;
@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, strong) NSString *creatorId;
@property (nonatomic, strong) NSString *customerLevelName;
@property (nonatomic, strong) NSString *regionIdProvince;
@property (nonatomic, strong) NSString *regionIdProvinceName;
@property (nonatomic, strong) NSString *cusId;
@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, strong) NSString *userNature;
@property (nonatomic, strong) NSString *userNatureName;
@property (nonatomic, strong) NSString *modifierName;
@property (nonatomic, strong) NSString *busiDepart;
@property (nonatomic, assign) double modifiedDatetime;
@property (nonatomic, strong) NSString *userArea;
@property (nonatomic, strong) NSString *ownerId;
@property (nonatomic, strong) NSString *creatorName;
@property (nonatomic, strong) NSString *orgName;
@property (nonatomic, strong) NSString *tripArea;
@property (nonatomic, assign) double findTime;
@property (nonatomic, strong) NSString *userAreaName;
@property (nonatomic, strong) NSString *finderName;
@property (nonatomic, strong) NSString *regionAddr;
@property (nonatomic, strong) NSString *regionIdDistrict;
@property (nonatomic, assign) double cContact;
@property (nonatomic, strong) NSString *busiDepartName;
@property (nonatomic, strong) NSString *cusType;
@property (nonatomic, strong) NSString *tripAreaName;
@property (nonatomic, strong) NSString *finderId;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *cusFullname;
@property (nonatomic, strong) NSString *cusTypeName;
@property (nonatomic, strong) NSString *regionIdCountry;
@property (nonatomic, strong) NSString *managerPartyName;
@property (nonatomic, strong) NSString *statusName;
@property (nonatomic, assign) double createdDatetime;
@property (nonatomic, strong) NSString *regionIdCity;
@property (nonatomic, strong) NSString *modifierId;
@property (nonatomic, strong) NSString *ownerName;
@property (nonatomic, assign) double openDate;
@property (nonatomic, strong) NSString *startLevelName;
@property (nonatomic, strong) NSString *regionIdDistrictName;
@property (nonatomic, strong) NSString *busiNatureName;
@property (nonatomic, strong) NSString *regionIdCityName;
@property (nonatomic, strong) NSString *busiNature;
@property (nonatomic, strong) NSString *findSourceId;
@property (nonatomic, strong) NSString *tenementId;
@property (nonatomic, strong) NSString *regionIdCountryName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
