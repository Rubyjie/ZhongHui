//
//  CluesSearchView.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/17.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "CluesSearchView.h"
#import "DefaultCell.h"
#import "PopupView.h"
#import "AFNetworking.h"


@interface CluesSearchView () <DefaultDataPickerDelegate,PopviewDelegate,UITextFieldDelegate>

@property (nonatomic, strong)DefaultCell *startTimePickerCell;
@property (nonatomic, strong)DefaultCell *endTimePickerCell;

@property (nonatomic, strong)PopupView *levlePopView;
@property (nonatomic, strong)NSMutableArray *levelArray;
@property (nonatomic, strong)NSMutableArray *levelValueArray;

@property (nonatomic, strong)PopupView *typePopView;
@property (nonatomic, strong)NSMutableArray *typeArray;
@property (nonatomic, strong)NSMutableArray *typeValueArray;




@property (nonatomic, strong)PopupView *userXzPopVIew;
@property (nonatomic, strong)NSMutableArray *userNameArray;
@property (nonatomic, strong)NSMutableArray *userValueArray;

@property (nonatomic, strong)PopupView *jyXzPopView;
@property (nonatomic, strong)NSMutableArray *jyXzArray;
@property (nonatomic, strong)NSMutableArray *jyXzValueArray;

@property (nonatomic, strong)PopupView *provincePopView;
//@property (nonatomic, strong)NSMutableArray *provinceArray;
//@property (nonatomic, strong)NSMutableArray *provinceIdArray;

@property (nonatomic, strong)PopupView *cityPopView;
@property (nonatomic, strong)NSMutableArray *cityNameArray;
@property (nonatomic, strong)NSMutableArray *cityIdArray;


@property (nonatomic, strong)PopupView *areaPopView;
@property (nonatomic, strong)NSMutableArray *areaNameArray;
@property (nonatomic, strong)NSMutableArray *areaIdArray;

@property (nonatomic, strong)PopupView *sourcePopView;
@property (nonatomic, strong)NSMutableArray *sourceArray;
@property (nonatomic, strong)NSMutableArray *sourceValueArray;


@property (nonatomic, strong)PopupView *statusPopView;
@property (nonatomic, strong)NSMutableArray *statusArray;
@property (nonatomic, strong)NSMutableArray *statusValueArray;



@end

@implementation CluesSearchView

-(PopupView *)areaPopView
{
    if (!_areaPopView) {
        
        _areaPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.areaNameArray];
        
        _areaPopView.delegate = self;
        _areaPopView.tag = 900;
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
        _cityPopView.tag = 800;
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


-(PopupView *)statusPopView
{
    if (!_statusPopView) {
        
        _statusPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.statusArray];
        _statusPopView.delegate = self;
        _statusPopView.tag = 700;
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


-(PopupView *)sourcePopView
{
    if (!_sourcePopView) {
        
        _sourcePopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.sourceArray];
        _sourcePopView.delegate = self;
        _sourcePopView.tag = 600;
    }
    return _sourcePopView;
}

-(NSMutableArray *)sourceArray
{
    if (!_sourceArray) {
        
        _sourceArray = [NSMutableArray array];
    }
    return _sourceArray;
}

-(NSMutableArray *)sourceValueArray
{
    if (!_sourceValueArray) {
        
        _sourceValueArray = [NSMutableArray array];
    }
    return _sourceValueArray;
}

-(PopupView *)provincePopView
{
    if (!_provincePopView) {
        
        _provincePopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:[Session sharedSession].provinceNameArray];
        _provincePopView.delegate = self;
        _provincePopView.tag = 500;
    }
    return _provincePopView;
}

//-(NSMutableArray *)provinceArray
//{
//    if (!_provinceArray) {
//        
//        _provinceArray = [NSMutableArray array];
//    }
//    return _provinceArray;
//}
//
//-(NSMutableArray *)provinceIdArray
//{
//    if (!_provinceIdArray) {
//        
//        _provinceIdArray = [NSMutableArray array];
//    }
//    return _provinceIdArray;
//}


-(PopupView *)jyXzPopView
{
    if (!_jyXzPopView) {
        
        _jyXzPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.jyXzArray];
        _jyXzPopView.delegate = self;
        _jyXzPopView.tag = 400;
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




-(PopupView *)userXzPopVIew
{
    if (!_userXzPopVIew) {
        
        _userXzPopVIew = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.userNameArray];
        _userXzPopVIew.delegate = self;
        _userXzPopVIew.tag = 300;
    }
    return _userXzPopVIew;
}

-(NSMutableArray *)userNameArray
{
    if (!_userNameArray) {
        
        _userNameArray = [NSMutableArray array];
    }
    return _userNameArray;
}

-(NSMutableArray *)userValueArray
{
    if (!_userValueArray) {
        
        _userValueArray = [NSMutableArray array];
    }
    return _userValueArray;
}





-(PopupView *)levlePopView
{
    if (!_levlePopView) {
        
        _levlePopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.levelArray];
        _levlePopView.delegate = self;
        _levlePopView.tag = 100;
    }
    return _levlePopView;
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



-(PopupView *)typePopView
{
    if (!_typePopView) {
        
        _typePopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.typeArray];
        _typePopView.delegate = self;
        _typePopView.tag = 200;
    }
    return _typePopView;
}

-(NSMutableArray *)typeArray
{
    if (!_typeArray) {
        
        _typeArray = [NSMutableArray array];
    }
    return _typeArray;
}

-(NSMutableArray *)typeValueArray
{
    if (!_typeValueArray) {
        
        _typeValueArray = [NSMutableArray array];
    }
    return _typeValueArray;
}



-(DefaultCell*)startTimePickerCell{
    
    if (!_startTimePickerCell) {
        _startTimePickerCell = [[DefaultCell alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        _startTimePickerCell.delegate = self;
        _startTimePickerCell.whichCell = 1;
    }
    
    return _startTimePickerCell;
}


-(DefaultCell*)endTimePickerCell{
    
    if (!_endTimePickerCell) {
        _endTimePickerCell = [[DefaultCell alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        _endTimePickerCell.delegate = self;
        _endTimePickerCell.whichCell = 2;
    }
    
    return _endTimePickerCell;
}


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initCluesSearchView];
        
        // 获取星级
        [self getLevelData];
        
        // 获取类型
        [self getTypeData];
        
        // 获取所属集团就是获取客户数据
//        [self getJiTuanData];
        
        // 获取用户性质
        [self getUserXZData];
        
        // 获取经营性质
        [self getJyXzData];
        
        // 获取省
//        [self getProvinceData];
        
        // 获取来源
        [self getSourceData];
        
        // 获取状态
        [self getStatusData];
    }
    return self;
}


-(void)getStatusData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"/base/parameter/item/system/queryValid?type=SP_CLUESTATUS"];
    
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

-(void)getSourceData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"/base/parameter/item/business/queryValid?type=BP_FINDSOURCEID"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i ++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                
                NSString *souName = [dict objectForKey:@"name"];
                NSString *souValue = [dict objectForKey:@"value"];
                [self.sourceArray addObject:souName];
                [self.sourceValueArray addObject:souValue];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"-----%@",error);
    }];



}

//-(void)getProvinceData
//{
//    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/region/query"];
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    NSDictionary *dict = @{@"type":@"1"};
//    
//    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSLog(@"-----%@",[responseObject JSONString]);
//        
//        if ([responseObject objectForKey:@"success"]) {
//            
//            NSDictionary *dictData = [responseObject objectForKey:@"data"];
//            NSArray *dataArray = [dictData objectForKey:@"data"];
//            for (int i = 0 ; i < dataArray.count; i ++) {
//                
//                NSDictionary *dict = [dataArray objectAtIndex:i];
//                
//                NSString *nameStr = [dict objectForKey:@"name"];
//                NSString *idStr = [dict objectForKey:@"id"];
//                [self.provinceArray addObject:nameStr];
//                [self.provinceIdArray addObject:idStr];
//                
//            }
//        }
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        NSLog(@"-----%@",error);
//    }];
//
//}

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

-(void)getAreaDataWithCityId:(NSString *)cityId
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/region/query"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"parentId":cityId};
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
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

-(void)getJyXzData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"/base/parameter/item/business/queryValid?type=BUSI_NATURE"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i ++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                
                NSString *jyName = [dict objectForKey:@"name"];
                NSString *jyValue = [dict objectForKey:@"value"];
                [self.jyXzArray addObject:jyName];
                [self.jyXzValueArray addObject:jyValue];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"-----%@",error);
    }];



}

-(void)getUserXZData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"/base/parameter/item/business/queryValid?type=USER_NATURE"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i ++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                
                NSString *userName = [dict objectForKey:@"name"];
                NSString *userValue = [dict objectForKey:@"value"];
                [self.userNameArray addObject:userName];
                [self.userValueArray addObject:userValue];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"-----%@",error);
    }];

}


-(void)getTypeData
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
                [self.typeArray addObject:typeName];
                [self.typeValueArray addObject:typeValue];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"-----%@",error);
    }];


}

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
                NSString *levleValue = [dict objectForKey:@"value"];
                [self.levelArray addObject:levelName];
                [self.levelValueArray addObject:levleValue];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"-----%@",error);
    }];

}

-(void)initCluesSearchView
{
    NSArray *titleArray = @[@"客户名称",@"星级",@"类型",@"所属集团",@"用户性质",@"经营性质",@"省",@"市",@"区县",@"来源类型",@"发现起始时间",@"发现截止时间",@"状态"];

    for (int i = 0 ; i < titleArray.count; i++) {
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 50*i, 70, 50)];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.adjustsFontSizeToFitWidth = YES;
        titleLabel.textAlignment = NSTextAlignmentRight;
        titleLabel.text = [titleArray objectAtIndex:i];
        [self addSubview:titleLabel];
        
        
        CALayer *henglayer = [[CALayer alloc] init];
        henglayer.backgroundColor = RGB(0, 195, 236).CGColor;
        henglayer.frame = CGRectMake(0, 49.5*(i+1), PHONE_UISCREEN_WIDTH, 0.5);
        [self.layer addSublayer:henglayer];

        
        if (i == 0) {
            
            UITextField *textFierd = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame)+10, 50*i, PHONE_UISCREEN_WIDTH-70, 50)];
            textFierd.delegate = self;
            textFierd.placeholder = @"请输入";
            textFierd.font = [UIFont systemFontOfSize:14];
            [self addSubview:textFierd];
            self.cusText = textFierd;
            
        }else{

        
            UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame)+10, 50*i, PHONE_UISCREEN_WIDTH-70, 50);
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            button.tag = 10+i;
            [button setTitleColor:RGB(194, 194, 197) forState:UIControlStateNormal];
            button.titleLabel.adjustsFontSizeToFitWidth = YES;
            [button addTarget:self action:@selector(clcikCluesSearchButton:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:@"请选择" forState:UIControlStateNormal];
            [self addSubview:button];
            
            switch (i) {
                case 1:
                    self.levelButton = button;
                    break;
                case 2:
                    self.typeButton = button;
                    break;
                case 3:
                    self.jiTuanButton = button;
                    break;
                case 4:
                    self.userXZButton = button;
                    break;
                case 5:
                    self.jyXzButton = button;
                    break;
                case 6:
                    self.ProvinceButton = button;
                    break;
                case 7:
                    self.cityButton = button;
                    break;
                case 8:
                    self.areaButton = button;
                    break;
                case 9:
                    self.sourceButton = button;
                    break;
                case 10:
                    self.startButton = button;
                    break;
                case 11:
                    self.endButton = button;
                    break;
                case 12:
                    self.statusButton = button;
                    break;
                default:
                    break;
            }
            
        }
    
    }

}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

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
                
                [self.startButton setTitle:dateString forState:UIControlStateNormal];
                [self.startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.startStr = timeSp;
                
            }else{
                
                [self.startButton setTitle:timestr forState:UIControlStateNormal];
                [self.startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.startStr = shijianchuo;
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
                
                [self.endButton setTitle:dateString forState:UIControlStateNormal];
                [self.endButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.endStr = timeSp;
                
            }else{
                
                [self.endButton setTitle:timestr forState:UIControlStateNormal];
                [self.endButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.endStr = shijianchuo;
            }
            
            break;
            
        default:
            break;
    }
}



-(void)clcikCluesSearchButton:(UIButton *)button
{
    [self endEditing:YES];
    
    if (button.tag == 20) {
        
        [self.startTimePickerCell showDatapicker];
        
    }else if (button.tag == 21) {
    
        [self.endTimePickerCell showDatapicker];
        
    }else if (button.tag == 11) {
    
        [self.levlePopView showAlert];
        
    }else if (button.tag == 12) {
    
        [self.typePopView showAlert];
        
    }else if (button.tag == 13) {
    
        NSLog(@"集团");
        [self.delegate swithButtonChooseCustomerWithTag:button.tag];
        
    }else if (button.tag == 14) {
    
        [self.userXzPopVIew showAlert];
        
    }else if (button.tag == 15) {
    
        [self.jyXzPopView showAlert];
        
    }else if (button.tag == 16) {
    
        [self.provincePopView showAlert];
        
    }else if (button.tag == 19) {
    
        [self.sourcePopView showAlert];
        
    }else if (button.tag == 22) {
    
        [self.statusPopView showAlert];
        
    }else if (button.tag == 17) {
    
        [self.cityPopView showAlert];
        
    }else if (button.tag == 18) {
    
        [self.areaPopView showAlert];
    }

}

-(void)selectWhichButtonWithTag:(NSInteger)tag popView:(PopupView *)popview
{
    if (popview.tag == 100) {
        
        [self.levelButton setTitle:[self.levelArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.levelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.levelValue = [self.levelValueArray objectAtIndex:tag - 100];
        
    }else if (popview.tag == 200) {
        
        [self.typeButton setTitle:[self.typeArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.typeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.typeValue = [self.typeValueArray objectAtIndex:tag - 100];
    
    }else if (popview.tag == 300) {
    
        [self.userXZButton setTitle:[self.userNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.userXZButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.userValue = [self.userValueArray objectAtIndex:tag - 100];

    
    }else if (popview.tag == 400) {
    
        [self.jyXzButton setTitle:[self.jyXzArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.jyXzButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.jyxzValue = [self.jyXzValueArray objectAtIndex:tag - 100];
    
    }else if (popview.tag == 500) {
    
        [self.ProvinceButton setTitle:[[Session sharedSession].provinceNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.ProvinceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.provinceId = [[Session sharedSession].provinceIdArray objectAtIndex:tag - 100];
        
        // 获取市
        [self getCityDataWithId:self.provinceId];
    
    }else if (popview.tag == 600) {
    
        [self.sourceButton setTitle:[self.sourceArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.sourceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.sourceValue = [self.sourceValueArray objectAtIndex:tag - 100];

    }else if (popview.tag == 700) {
    
        [self.statusButton setTitle:[self.statusArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.statusButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.statusValue = [self.statusValueArray objectAtIndex:tag - 100];
    
    }else if (popview.tag == 800) {
    
        [self.cityButton setTitle:[self.cityNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.cityButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.cityId = [self.cityIdArray objectAtIndex:tag - 100];
        
        // area
        [self getAreaDataWithCityId:self.cityId];
        
        
    }else if (popview.tag == 900) {
    
        [self.areaButton setTitle:[self.areaNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.areaButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.areaId = [self.areaIdArray objectAtIndex:tag - 100];
    }

}

@end
