//
//  CustomerSearchView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CustomerSearchView.h"
#import "DefaultCell.h"
#import "AFNetworking.h"
#import "PopupView.h"

@interface CustomerSearchView () <DefaultDataPickerDelegate,PopviewDelegate,UITextFieldDelegate>

@property (nonatomic, strong)DefaultCell *openStrartTimePicker; // 开业开始时间
@property (nonatomic, strong)DefaultCell *openEndTimePicker;    // 开业截止时间
@property (nonatomic, strong)DefaultCell *decorateStartPicker;  // 装修开始时间
@property (nonatomic, strong)DefaultCell *decorateEndTimePicker;// 装修截止时间

@property (nonatomic, strong)PopupView *provincePopView;

@property (nonatomic, strong)PopupView *cityPopView;
@property (nonatomic, strong)NSMutableArray *cityNameArray;
@property (nonatomic, strong)NSMutableArray *cityIdArray;


@property (nonatomic, strong)PopupView *areaPopView;
@property (nonatomic, strong)NSMutableArray *areaNameArray;
@property (nonatomic, strong)NSMutableArray *areaIdArray;


@property (nonatomic, strong)PopupView *cusTypePopView;
@property (nonatomic, strong)NSMutableArray *cusTypeArray;
@property (nonatomic, strong)NSMutableArray *cusTypeValueArray;


@property (nonatomic, strong)PopupView *levelPopView;
@property (nonatomic, strong)NSMutableArray *levelArray;
@property (nonatomic, strong)NSMutableArray *levelValueArray;


#pragma mark - 经营性质
@property (nonatomic, strong)PopupView *jyXzPopView;
@property (nonatomic, strong)NSMutableArray *jyXzArray;
@property (nonatomic, strong)NSMutableArray *jyXzValueArray;

#pragma mark - 资产归属
@property (nonatomic, strong)PopupView *assetOwnerPopView;
@property (nonatomic, strong)NSMutableArray *assetOwnerArray;
@property (nonatomic, strong)NSMutableArray *assetOwnerValueArray;

#pragma mark - 管理方
@property (nonatomic, strong)PopupView *managerPopView;
@property (nonatomic, strong)NSMutableArray *managerArray;
@property (nonatomic, strong)NSMutableArray *managerValueArray;



@property (nonatomic, strong)PopupView *statusPopView;
@property (nonatomic, strong)NSMutableArray *statusArray;
@property (nonatomic, strong)NSMutableArray *statusValueArray;

@end

@implementation CustomerSearchView
-(PopupView *)managerPopView
{
    if (!_managerPopView) {
        
        _managerPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.managerArray];
        _managerPopView.delegate = self;
        _managerPopView.tag = 1700;
    }
    return _managerPopView;
}

-(NSMutableArray *)managerArray
{
    if (!_managerArray) {
        
        _managerArray = [NSMutableArray array];
    }
    return _managerArray;
}

-(NSMutableArray *)managerValueArray
{
    if (!_managerValueArray) {
        
        _managerValueArray = [NSMutableArray array];
    }
    return _managerValueArray;
}






-(PopupView *)assetOwnerPopView
{
    if (!_assetOwnerPopView) {
        
        _assetOwnerPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.assetOwnerArray];
        _assetOwnerPopView.delegate = self;
        _assetOwnerPopView.tag = 1600;
    }
    return _assetOwnerPopView;
}

-(NSMutableArray *)assetOwnerArray
{
    if (!_assetOwnerArray) {
        
        _assetOwnerArray = [NSMutableArray array];
    }
    return _assetOwnerArray;
}

-(NSMutableArray *)assetOwnerValueArray
{
    if (!_assetOwnerValueArray) {
        
        _assetOwnerValueArray = [NSMutableArray array];
    }
    return _assetOwnerValueArray;
}



-(PopupView *)statusPopView
{
    if (!_statusPopView) {
        
        _statusPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.statusArray];
        _statusPopView.delegate = self;
        _statusPopView.tag = 1500;
    }
    return _statusPopView;
}

-(NSMutableArray *)statusArray
{
    if (!_statusArray) {
        
        _statusArray = [NSMutableArray array];
    }
    return _statusArray;
}

-(NSMutableArray *)statusValueArray
{
    if (!_statusValueArray) {
        
        _statusValueArray = [NSMutableArray array];
    }
    return _statusValueArray;
}


-(PopupView *)jyXzPopView
{
    if (!_jyXzPopView) {
        
        _jyXzPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.jyXzArray];
        
        _jyXzPopView.delegate = self;
        _jyXzPopView.tag = 1400;
    }
    return _jyXzPopView;
}

-(NSMutableArray *)jyXzArray
{
    if (!_jyXzArray) {
        
        _jyXzArray = [NSMutableArray array];
    }
    return _jyXzArray;
}

-(NSMutableArray *)jyXzValueArray
{
    if (!_jyXzValueArray) {
        
        _jyXzValueArray = [NSMutableArray array];
    }
    return _jyXzValueArray;
}


-(PopupView *)levelPopView
{
    if (!_levelPopView) {
        
        _levelPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.levelArray];
        
        _levelPopView.delegate = self;
        _levelPopView.tag = 1300;
    }
    return _levelPopView;
}

-(NSMutableArray *)levelArray
{
    if (!_levelArray) {
        
        _levelArray = [NSMutableArray array];
    }
    return _levelArray;
}

-(NSMutableArray *)levelValueArray
{
    if (!_levelValueArray) {
        
        _levelValueArray = [NSMutableArray array];
    }
    return _levelValueArray;
}



-(PopupView *)cusTypePopView
{
    if (!_cusTypePopView) {
        
        _cusTypePopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.cusTypeArray];
        
        _cusTypePopView.delegate = self;
        _cusTypePopView.tag = 1200;
    }
    return _cusTypePopView;
}

-(NSMutableArray *)cusTypeArray
{
    if (!_cusTypeArray) {
        
        _cusTypeArray = [NSMutableArray array];
    }
    return _cusTypeArray;
}

-(NSMutableArray *)cusTypeValueArray
{
    if (!_cusTypeValueArray) {
        
        _cusTypeValueArray = [NSMutableArray array];
    }
    return _cusTypeValueArray;
}



-(PopupView *)areaPopView
{
    if (!_areaPopView) {
        
        _areaPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.areaNameArray];
        _areaPopView.delegate = self;
        _areaPopView.tag = 1110;
    }
    return _areaPopView;
}


-(NSMutableArray *)areaNameArray
{
    if (!_areaNameArray) {
        
        _areaNameArray = [NSMutableArray array];
    }
    return _areaNameArray;
}

-(NSMutableArray *)areaIdArray
{
    if (!_areaIdArray) {
        
        _areaIdArray = [NSMutableArray array];
    }
    return _areaIdArray;
}



-(PopupView *)cityPopView
{
    if (!_cityPopView) {
        
        _cityPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.cityNameArray];
        _cityPopView.delegate = self;
        _cityPopView.tag = 1100;
    }
    return _cityPopView;
}


-(NSMutableArray *)cityNameArray
{
    if (!_cityNameArray) {
        
        _cityNameArray = [NSMutableArray array];
    }
    return _cityNameArray;
}


-(NSMutableArray *)cityIdArray
{
    if (!_cityIdArray) {
        
        _cityIdArray = [NSMutableArray array];
    }
    return _cityIdArray;
}


-(PopupView *)provincePopView
{
    if (!_provincePopView) {
        
        _provincePopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:[Session sharedSession].provinceNameArray];
        _provincePopView.delegate = self;
        _provincePopView.tag = 1000;
    }
    return _provincePopView;
}

-(DefaultCell*)openStrartTimePicker{
    
    if (!_openStrartTimePicker) {
        _openStrartTimePicker = [[DefaultCell alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        _openStrartTimePicker.delegate = self;
        _openStrartTimePicker.whichCell = 1;
    }
    
    return _openStrartTimePicker;
}


-(DefaultCell*)openEndTimePicker{
    
    if (!_openEndTimePicker) {
        _openEndTimePicker = [[DefaultCell alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        _openEndTimePicker.delegate = self;
        _openEndTimePicker.whichCell = 2;
    }
    
    return _openEndTimePicker;
}


-(DefaultCell*)decorateStartPicker{
    
    if (!_decorateStartPicker) {
        _decorateStartPicker = [[DefaultCell alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        _decorateStartPicker.delegate = self;
        _decorateStartPicker.whichCell = 3;
    }
    
    return _decorateStartPicker;
}


-(DefaultCell*)decorateEndTimePicker{
    
    if (!_decorateEndTimePicker) {
        _decorateEndTimePicker = [[DefaultCell alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        _decorateEndTimePicker.delegate = self;
        _decorateEndTimePicker.whichCell = 4;
    }
    
    return _decorateEndTimePicker;
}

#pragma mark - 市
-(void)getCityDataWithId:(NSString *)provinceid
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/region/query"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"parentId":provinceid};
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dataDict = [responseObject objectForKey:@"data"];
            
            NSArray *dataArray = [dataDict objectForKey:@"data"];
            
            for (int i = 0 ; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                
                NSString *cityName = [dict objectForKey:@"name"];
                NSString *cityId = [dict objectForKey:@"id"];
                
                [self.cityNameArray addObject:cityName];
                [self.cityIdArray addObject:cityId];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
}

#pragma mark - 区
-(void)getAreaDataWithCityId:(NSString *)cityId
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/region/query"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"parentId":cityId};
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
#pragma mark - 数据不对
        NSLog(@"------%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dictData = [responseObject objectForKey:@"data"];
            
            NSArray *dataArray = [dictData objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i ++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                
                NSString *areaName = [dict objectForKey:@"name"];
                NSString *areaId = [dict objectForKey:@"id"];
                [self.areaNameArray addObject:areaName];
                [self.areaIdArray addObject:areaId];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}


#pragma mark - 时间
- (void)returnTime:(NSInteger)whichdatapicker shijianchuo:(NSString *)shijianchuo shijian:(NSString *)timestr
{
    switch (whichdatapicker) {
        case 1:
            
            if (shijianchuo.length < 1) {
                
                NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
                NSDateFormatter *pickerFormatter = [[NSDateFormatter alloc] init];// 创建一个日期格式器
                //时间戳的值
                NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
                //不带时间的
                [pickerFormatter setDateFormat:@"yyyy年MM月dd日"];
                NSString *dateString = [pickerFormatter stringFromDate:datenow];
                
                [self.openStartButton setTitle:dateString forState:UIControlStateNormal];
                [self.openStartButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.openStartStr = timeSp;
                
            }else{
                
                [self.openStartButton setTitle:timestr forState:UIControlStateNormal];
                [self.openStartButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.openStartStr = shijianchuo;
            }
            
            break;
            
            
        case 2:
            
            if (shijianchuo.length < 1) {
                
                NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
                NSDateFormatter *pickerFormatter = [[NSDateFormatter alloc] init];// 创建一个日期格式器
                //时间戳的值
                NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
                //不带时间的
                [pickerFormatter setDateFormat:@"yyyy年MM月dd日"];
                NSString *dateString = [pickerFormatter stringFromDate:datenow];
                
                [self.openEndButton setTitle:dateString forState:UIControlStateNormal];
                [self.openEndButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.openEndStr = timeSp;
                
            }else{
                
                [self.openEndButton setTitle:timestr forState:UIControlStateNormal];
                [self.openEndButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.openEndStr = shijianchuo;
            }
            
            break;
        case 3:
            
            if (shijianchuo.length < 1) {
                
                NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
                NSDateFormatter *pickerFormatter = [[NSDateFormatter alloc] init];// 创建一个日期格式器
                //时间戳的值
                NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
                //不带时间的
                [pickerFormatter setDateFormat:@"yyyy年MM月dd日"];
                NSString *dateString = [pickerFormatter stringFromDate:datenow];
                
                [self.decorateStartButton setTitle:dateString forState:UIControlStateNormal];
                [self.decorateStartButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.decorateStartStr = timeSp;
                
            }else{
                
                [self.decorateStartButton setTitle:timestr forState:UIControlStateNormal];
                [self.decorateStartButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.decorateStartStr = shijianchuo;
            }
            
            break;
            
            
        case 4:
            
            if (shijianchuo.length < 1) {
                
                NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
                NSDateFormatter *pickerFormatter = [[NSDateFormatter alloc] init];// 创建一个日期格式器
                //时间戳的值
                NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
                //不带时间的
                [pickerFormatter setDateFormat:@"yyyy年MM月dd日"];
                NSString *dateString = [pickerFormatter stringFromDate:datenow];
                
                [self.decorateEndButton setTitle:dateString forState:UIControlStateNormal];
                [self.decorateEndButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.decorateEndStr = timeSp;
                
            }else{
                
                [self.decorateEndButton setTitle:timestr forState:UIControlStateNormal];
                [self.decorateEndButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.decorateEndStr = shijianchuo;
            }
            
            break;
  
        default:
            break;
    }
}



-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initCustomerSearchView];
        
        // 获取客户类型
        [self getCustomerTypeData];
        
        // 获取星级数据
        [self getLevelData];
        
        // 获取经营性质
        [self getBusinessData];
        
        // 获取资产归属
        [self getAssetsOwnerData];
        
        // 获取管理方数据
        [self getManagerData];
        
        // 获取状态
        [self getStatusData];
        
    }
    return self;
}


#pragma mark - 获取管理方数据
-(void)getManagerData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"/base/parameter/item/business/queryValid?type=BP_GLF"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i ++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                
                NSString *mangerName = [dict objectForKey:@"name"];
                NSString *managerValue = [dict objectForKey:@"value"];
                [self.managerArray addObject:mangerName];
                [self.managerValueArray addObject:managerValue];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"-----%@",error);
    }];


}


#pragma mark - 获取状态
-(void)getStatusData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"/base/parameter/item/business/queryValid?type=CUSTOMER_STATUS"];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSLog(@"-----%@",[responseObject JSONString]);

        if ([responseObject objectForKey:@"success"]) {

            NSArray *dataArray = [responseObject objectForKey:@"data"];

            for (int i = 0; i < dataArray.count; i ++) {

                NSDictionary *dict = [dataArray objectAtIndex:i];

                NSString *statusName = [dict objectForKey:@"name"];
                NSString *statusValue = [dict objectForKey:@"value"];
                [self.statusArray addObject:statusName];
                [self.statusValueArray addObject:statusValue];
            }
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"-----%@",error);
    }];
}

#pragma mark - 获取资产归属
-(void)getAssetsOwnerData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"/base/parameter/item/business/queryValid?type=USER_NATURE"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i ++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                
                NSString *assetOwnerName = [dict objectForKey:@"name"];
                NSString *assetOwnerValue = [dict objectForKey:@"value"];
                [self.assetOwnerArray addObject:assetOwnerName];
                [self.assetOwnerValueArray addObject:assetOwnerValue];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"-----%@",error);
    }];



}

#pragma mark - 获取经营性质
-(void)getBusinessData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"/base/parameter/item/business/queryValid?type=BUSI_NATURE"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i ++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                
                NSString *jyXzName = [dict objectForKey:@"name"];
                NSString *jyXzValue = [dict objectForKey:@"value"];
                [self.jyXzArray addObject:jyXzName];
                [self.jyXzValueArray addObject:jyXzValue];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"-----%@",error);
    }];


}

#pragma mark - 获取星级数据
-(void)getLevelData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"/base/parameter/item/business/queryValid?type=START_LEVEL"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i ++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                
                NSString *levelName = [dict objectForKey:@"name"];
                NSString *levelValue = [dict objectForKey:@"value"];
                [self.levelArray addObject:levelName];
                [self.levelValueArray addObject:levelValue];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"-----%@",error);
    }];
}

#pragma mark - 获取客户类型
-(void)getCustomerTypeData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"/base/parameter/item/business/queryValid?type=BP_KHLX"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i ++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                
                NSString *typeName = [dict objectForKey:@"name"];
                NSString *typeValue = [dict objectForKey:@"value"];
                [self.cusTypeArray addObject:typeName];
                [self.cusTypeValueArray addObject:typeValue];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"-----%@",error);
    }];



}

-(void)initCustomerSearchView
{
    NSArray *titleArray = @[@"客户名称",@"编码",@"所属集团",@"开业起始时间",@"开业截止时间",@"装修开始时间",@"装修截止时间",@"省",@"市",@"区县",@"类型",@"星级",@"经营性质",@"资产归属",@"管理方",@"状态"];

    CGFloat LeftMargin = 10;
    
    for (int i = 0; i < titleArray.count; i++) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(LeftMargin, 50*i, 80, 50)];
        label.textColor = [UIColor grayColor];
        label.adjustsFontSizeToFitWidth = YES;
        label.text = [titleArray objectAtIndex:i];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
        
        CALayer *henglayer = [[CALayer alloc] init];
        henglayer.backgroundColor = RGB(0, 195, 236).CGColor;
        henglayer.frame = CGRectMake(0, 49.5*(i+1), PHONE_UISCREEN_WIDTH, 0.5);
        [self.layer addSublayer:henglayer];

        
        if (i < 2) {
        
            UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(label.frame)+10, 50*i, PHONE_UISCREEN_WIDTH-LeftMargin*2-100, 50)];
            textField.delegate = self;
            textField.font = [UIFont systemFontOfSize:14];
            textField.tag = 10+i;
            textField.placeholder = @"请输入内容";
            [self addSubview:textField];
            
            switch (i) {
                case 0:
                    self.cusText = textField;
                    break;
                case 1:
                    self.cusCodeText = textField;
                    break;
                default:
                    break;
            }
            
        }else{
        
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(CGRectGetMaxX(label.frame)+10, 50*i, PHONE_UISCREEN_WIDTH-LeftMargin*2-100, 50);
            button.tag = 100 + i;
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button addTarget:self action:@selector(customerSearchButton:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:@"请选择" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [self addSubview:button];
            
            switch (i) {
                case 2:
                    self.jiTuanButton = button;
                    break;
                case 3:
                    self.openStartButton = button;
                    break;
                case 4:
                    self.openEndButton = button;
                    break;
                case 5:
                    self.decorateStartButton = button;
                    break;
                case 6:
                    self.decorateEndButton = button;
                    break;
                case 7:
                    self.provinceButton = button;
                    break;
                case 8:
                    self.cityButton = button;
                    break;
                case 9:
                    self.areaButton = button;
                    break;
                case 10:
                    self.typeButton = button;
                    break;
                case 11:
                    self.levelButton = button;
                    break;
                case 12:
                    self.jyXzButton = button;
                    break;
                case 13:
                    self.assetsOwnerButton = button;
                    break;
                case 14:
                    self.managerButton = button;
                    break;
                case 15:
                    self.statusButton = button;
                default:
                    break;
            }
        
        }
    }
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == 10 || textField.tag == 11) {
        
        [textField resignFirstResponder];
        return YES;
    }
    return YES;
}

-(void)customerSearchButton:(UIButton *)button
{
    if (button.tag == 102) {
        
        [self.delegate swithButtonChooseJiGouDataWithTag:button.tag];
        
    }else if (button.tag == 103) {
    
        [self.openStrartTimePicker showDatapicker];
        
    }else if (button.tag == 104) {
    
        [self.openEndTimePicker showDatapicker];
    
    }else if (button.tag == 105) {
    
        [self.decorateStartPicker showDatapicker];
    
    }else if (button.tag == 106) {
    
        [self.decorateEndTimePicker showDatapicker];
        
    }else if (button.tag == 107) {
    
        [self.provincePopView showAlert];
    
    }else if (button.tag == 108) {
    
        [self.cityPopView showAlert];
    
    }else if (button.tag == 109) {
    
        [self.areaPopView showAlert];
        
    }else if (button.tag == 110) {
    
        [self.cusTypePopView showAlert];
    
    }else if (button.tag == 111) {
    
        [self.levelPopView showAlert];
    
    }else if (button.tag == 112) {
    
        [self.jyXzPopView showAlert];
    
    }else if (button.tag == 115) {
    
        [self.statusPopView showAlert];
    
    }else if (button.tag == 113) {
    
        [self.assetOwnerPopView showAlert];
        
    }else if (button.tag == 114) {
    
        [self.managerPopView showAlert];
    
    }

}

-(void)selectWhichButtonWithTag:(NSInteger)tag popView:(PopupView *)popview
{
    
    if (popview.tag == 1000) {
        
        [self.provinceButton setTitle:[[Session sharedSession].provinceNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.provinceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.provinceId = [[Session sharedSession].provinceIdArray objectAtIndex:tag - 100];
        
        // 获取市
        [self getCityDataWithId:self.provinceId];


    }else if (popview.tag == 1100) {
    
        [self.cityButton setTitle:[self.cityNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.cityButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.cityId = [self.cityIdArray objectAtIndex:tag - 100];
        
        // area
        [self getAreaDataWithCityId:self.cityId];

    }else if (popview.tag == 1110) {
    
        [self.areaButton setTitle:[self.areaNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.areaButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.areaId = [self.areaIdArray objectAtIndex:tag - 100];
    
    }else if (popview.tag == 1200) {
    
        [self.typeButton setTitle:[self.cusTypeArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.typeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.typeValue = [self.cusTypeValueArray objectAtIndex:tag - 100];
        
    }else if (popview.tag == 1300) {
    
        [self.levelButton setTitle:[self.levelArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.levelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.levelValue = [self.levelValueArray objectAtIndex:tag - 100];
    
    }else if (popview.tag == 1400) {
    
        [self.jyXzButton setTitle:[self.jyXzArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.jyXzButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.jyXzValue = [self.jyXzValueArray objectAtIndex:tag - 100];

    }else if (popview.tag == 1500) {
    
        [self.statusButton setTitle:[self.statusArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.statusButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.statusValue = [self.statusValueArray objectAtIndex:tag - 100];
    
    }else if (popview.tag == 1600) {
    
        [self.assetsOwnerButton setTitle:[self.assetOwnerArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.assetsOwnerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.assetsOwnerValue = [self.assetOwnerValueArray objectAtIndex:tag - 100];

    }else if (popview.tag == 1700) {
    
        [self.managerButton setTitle:[self.managerArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.managerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.managerValue = [self.managerValueArray objectAtIndex:tag - 100];
    
    }

}


//-(void)customerDeails
//{
//    UITextField *nameText = (UITextField *)[self viewWithTag:10];
//    UITextField *codeText = (UITextField *)[self viewWithTag:11];
//    [self.delegate swithButtonQueryCustomerWithName:nameText.text code:codeText.text];
//}

@end
