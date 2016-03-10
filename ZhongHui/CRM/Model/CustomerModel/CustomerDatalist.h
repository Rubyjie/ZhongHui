//
//  CustomerDatalist.h
//
//  Created by   on 15/12/23
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CustomerDatalist : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *provinceName;
@property (nonatomic, strong) NSString *startLevel;
@property (nonatomic, strong) NSString *userSizeName;
@property (nonatomic, strong) NSString *countryName;
@property (nonatomic, strong) NSString *datalistIdentifier;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *creatorId;
@property (nonatomic, strong) NSString *cusCode;
@property (nonatomic, strong) NSString *bustNature;
@property (nonatomic, assign) double redecDateLast;
@property (nonatomic, strong) NSString *datalistDescription;
@property (nonatomic, strong) NSString *userNature;
@property (nonatomic, strong) NSString *modifierName;
@property (nonatomic, strong) NSString *userNatureName;
@property (nonatomic, assign) double cFloors;
@property (nonatomic, assign) double modifiedDatetime;
@property (nonatomic, strong) NSString *district;
@property (nonatomic, strong) NSString *userArea;
@property (nonatomic, strong) NSString *creatorName;
@property (nonatomic, assign) double cPoints;
@property (nonatomic, strong) NSString *brand;
@property (nonatomic, strong) NSString *tripArea;
@property (nonatomic, strong) NSString *userAreaName;
@property (nonatomic, strong) NSString *regionAddr;
@property (nonatomic, assign) double cRooms;
@property (nonatomic, strong) NSString *cusFullName;
@property (nonatomic, strong) NSString *cusType;
@property (nonatomic, strong) NSString *tripAreaName;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSString *managerParty;
@property (nonatomic, strong) NSString *cusTypeName;
@property (nonatomic, strong) NSString *bustNatureName;
@property (nonatomic, strong) NSString *province;
@property (nonatomic, strong) NSString *cusShortName;
@property (nonatomic, strong) NSString *postcode;
@property (nonatomic, strong) NSString *managerPartyName;
@property (nonatomic, strong) NSString *assetsOwner;
@property (nonatomic, strong) NSString *statusName;
@property (nonatomic, strong) NSString *districtName;
@property (nonatomic, strong) NSString *assetsOwnerName;
@property (nonatomic, strong) NSString *modifierId;
@property (nonatomic, assign) double createdDatetime;
@property (nonatomic, assign) double openDate;
@property (nonatomic, strong) NSString *startLevelName;
@property (nonatomic, strong) NSString *userSize;
@property (nonatomic, strong) NSString *ownerGroupId;



+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
