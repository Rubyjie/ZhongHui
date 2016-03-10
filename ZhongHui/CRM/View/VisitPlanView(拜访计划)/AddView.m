//
//  AddView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/22.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "AddView.h"
#import "AFNetworking.h"
#import "PopupView.h"
#import "UserDefault.h"
#import "DefaultCell.h"


@interface AddView () <PopviewDelegate,DefaultDataPickerDelegate,UITextViewDelegate>

//用NSMutableSet保存参与人
@property (nonatomic, strong)NSMutableSet *nameSet;
//保存参与人ID
@property (nonatomic, strong)NSMutableSet *nameIdSet;




@property(nonatomic,strong)DefaultCell *DatePickerCell;
@property(nonatomic,strong)DefaultCell *endPickerCell;
@property(nonatomic,strong)DefaultCell *tiXingPickerCell;

@property (nonatomic, strong)NSMutableArray *sxArray;
@property (nonatomic, strong)NSMutableArray *sxValueArray;
//事项的弹框
@property (nonatomic, strong)PopupView *sxPopView;



@property (nonatomic, strong)NSMutableArray *wayArray;
@property (nonatomic, strong)NSMutableArray *wayValueArray;
//拜访方式的弹框
@property (nonatomic, strong)PopupView *visitWayPopView;


@property (nonatomic, strong)NSMutableArray *ywArray;
@property (nonatomic, strong)NSMutableArray *ywValueArray;
// 业务类型的弹框
@property (nonatomic, strong)PopupView *ywPopView;
@property (nonatomic, strong)NSMutableArray *zyArray;
@property (nonatomic, strong)NSMutableArray *zyValueArray;

// 相关业务的弹框
@property (nonatomic, strong)PopupView *businessPopView;
@property (nonatomic, strong)NSMutableArray *businessArray;
@property (nonatomic, strong)NSMutableArray *businessIdArray;

// 重要性的弹框
@property (nonatomic, strong)PopupView *zyPopView;


@property (nonatomic, strong)NSMutableArray *stateArray;
@property (nonatomic, strong)NSMutableArray *stateValueArray;
// 状态的弹框
@property (nonatomic, strong)PopupView *statePopView;


// 负责人的数组
@property (nonatomic, strong)NSMutableArray *headJiGouIdArray;
@property (nonatomic, strong)NSMutableArray *headNameArray;
@property (nonatomic, strong)NSMutableArray *headIdArray;
@property (nonatomic, strong)PopupView *headPopView;

// 联系人的数组
@property (nonatomic, strong)NSMutableArray *contractNameArray;
@property (nonatomic, strong)NSMutableArray *contractIdArray;
@property (nonatomic, strong)PopupView *contractPopVIew;


// 参与人的数组
@property (nonatomic, strong)NSMutableArray *canYuNameArray;
@property (nonatomic, strong)NSMutableArray *canYuIdArray;
@property (nonatomic, strong)PopupView *canYuPopView;


@end
@implementation AddView

-(NSMutableArray *)businessArray
{
    if (!_businessArray) {
        
        _businessArray = [NSMutableArray array];
    }
    return _businessArray;
}

-(NSMutableArray *)businessIdArray
{
    if (!_businessIdArray) {
        
        _businessIdArray = [NSMutableArray array];
    }
    return _businessIdArray;
}

-(PopupView *)businessPopView
{
    if (!_businessPopView) {
        
        _businessPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.businessArray];
        _businessPopView.delegate = self;
        _businessPopView.tag = 120;
    }
    return _businessPopView;
}



-(NSMutableSet*)nameIdSet
{
    if (!_nameIdSet) {
        _nameIdSet = [[NSMutableSet alloc]initWithCapacity:0];
    }

    return _nameIdSet;
}

-(NSMutableSet *)nameSet
{
    if (!_nameSet) {
        _nameSet = [[NSMutableSet alloc]initWithCapacity:0];
    }

    return _nameSet;
}


-(NSMutableArray *)contractIdArray
{
    if (!_contractIdArray) {
        
        _contractIdArray = [NSMutableArray array];
    }
    return _contractIdArray;
}

-(NSMutableArray *)canYuNameArray
{
    if (!_canYuNameArray) {
        
        _canYuNameArray = [NSMutableArray array];
    }
    return _canYuNameArray;
}

-(NSMutableArray *)canYuIdArray
{
    if (!_canYuIdArray) {
        
        _canYuIdArray = [NSMutableArray array];
    }
    return _canYuIdArray;
}

-(PopupView *)canYuPopView
{
    if (!_canYuPopView) {
        
        _canYuPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.canYuNameArray];
        _canYuPopView.delegate = self;
        _canYuPopView.tag = 110;
    }
    return _canYuPopView;
}

-(DefaultCell*)DatePickerCell{
    
    if (!_DatePickerCell) {
        _DatePickerCell = [[DefaultCell alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        _DatePickerCell.delegate = self;
        _DatePickerCell.whichCell = 1;
    }
    
    return _DatePickerCell;
}


-(DefaultCell*)endPickerCell{
    
    if (!_endPickerCell) {
        _endPickerCell = [[DefaultCell alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        _endPickerCell.delegate = self;
        _endPickerCell.whichCell = 2;
    }
    
    return _endPickerCell;
}

-(DefaultCell*)tiXingPickerCell{
    
    if (!_tiXingPickerCell) {
        _tiXingPickerCell = [[DefaultCell alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        _tiXingPickerCell.delegate = self;
        _tiXingPickerCell.whichCell = 3;
    }
    
    return _tiXingPickerCell;
}



- (void)setCustomerId:(NSString *)newId {
    if (newId != _customerId) {
        _customerId = newId;
        if (_customerId.length > 1) {
            
            // 获取联系人
            [self getContractNameDataWithCusId:_customerId];
            
            // 获取业务数据
            [self getBusinessDataWithcusId:_customerId];
            
            // 获取相关业务数据
            [self getRelatedDataWithCusId:_customerId];



        }else{
        
            // 在线索里添加计划，如果客户id是空的，就用当前客户的id调联系人
            [self getContractNameDataWithCusId:self.customerId];
            
            self.contractButton.userInteractionEnabled = NO;
            [[Session sharedSession].tpView presentMessageTips:@"请先选客户"];
            
            self.businessButton.userInteractionEnabled = NO;
            [[Session sharedSession].tpView presentMessageTips:@"请先选客户"];

        }
    }
}




-(NSMutableArray *)contractNameArray
{
    if (!_contractNameArray) {
        
        _contractNameArray = [NSMutableArray array];
    }
    return _contractNameArray;
}

-(PopupView *)contractPopVIew
{
    if (!_contractPopVIew) {
        
        _contractPopVIew = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.contractNameArray];
        _contractPopVIew.delegate = self;
        _contractPopVIew.tag = 100;
    }
    return _contractPopVIew;
}




-(NSMutableArray *)sxArray
{
    if (!_sxArray) {
        
        _sxArray = [NSMutableArray array];
    }
    return _sxArray;
}

-(NSMutableArray *)sxValueArray
{
    if (!_sxValueArray) {
        
        _sxValueArray = [NSMutableArray array];
    }
    return _sxValueArray;
}

-(PopupView *)sxPopView
{
    if (!_sxPopView) {
        
        _sxPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.sxArray];
        _sxPopView.delegate = self;
        _sxPopView.tag = 40;
    }
    return _sxPopView;
}


-(NSMutableArray *)wayArray
{
    if (!_wayArray) {
        
        _wayArray = [NSMutableArray array];
    }
    return _wayArray;
}

-(NSMutableArray *)wayValueArray
{
    if (!_wayValueArray) {
        
        _wayValueArray = [NSMutableArray array];
    }
    return _wayValueArray;
}

-(PopupView *)visitWayPopView
{
    if (!_visitWayPopView) {
        
        _visitWayPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.wayArray];
        _visitWayPopView.delegate = self;
        _visitWayPopView.tag = 50;
    }
    return _visitWayPopView;
}


-(NSMutableArray *)ywArray
{
    if (!_ywArray) {
        
        _ywArray = [NSMutableArray array];
    }
    return _ywArray;
}

-(NSMutableArray *)ywValueArray
{
    if (!_ywValueArray) {
        
        _ywValueArray = [NSMutableArray array];
    }
    return _ywValueArray;
}

-(PopupView *)ywPopView
{
    if (!_ywPopView) {
        
        _ywPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.ywArray];
        _ywPopView.delegate = self;
        _ywPopView.tag = 60;
    }
    return _ywPopView;
}


-(NSMutableArray *)zyArray
{
    if (!_zyArray) {
        
        _zyArray = [NSMutableArray array];
    }
    return _zyArray;
}

-(NSMutableArray *)zyValueArray
{
    if (!_zyValueArray) {
        
        _zyValueArray = [NSMutableArray array];
    }
    return _zyValueArray;
}

-(PopupView *)zyPopView
{
    if (!_zyPopView) {
        
        _zyPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.zyArray];
        _zyPopView.delegate = self;
        _zyPopView.tag = 70;
    }
    return _zyPopView;
}


-(NSMutableArray *)stateArray
{
    if (!_stateArray) {
        
        _stateArray = [NSMutableArray array];
    }
    return _stateArray;
}

-(NSMutableArray *)stateValueArray
{
    if (!_stateValueArray) {
        
        _stateValueArray = [NSMutableArray array];
    }
    return _stateValueArray;
}

-(PopupView *)statePopView
{
    if (!_statePopView) {
        
        _statePopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.stateArray];
        _statePopView.delegate = self;
        _statePopView.tag = 80;
    }
    return _statePopView;
}


-(NSMutableArray *)headJiGouIdArray
{
    if (!_headJiGouIdArray) {
        
        _headJiGouIdArray = [NSMutableArray array];
    }
    return _headJiGouIdArray;
}

-(NSMutableArray *)headNameArray
{
    if (!_headNameArray) {
        
        _headNameArray = [NSMutableArray array];
    }
    return _headNameArray;
}

-(NSMutableArray *)headIdArray
{
    if (!_headIdArray) {
        
        _headIdArray = [NSMutableArray array];
    }
    return _headIdArray;
}

-(PopupView *)headPopView
{
    if (!_headPopView) {
        
        _headPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.headNameArray];
        _headPopView.delegate = self;
        _headPopView.tag = 90;
    }
    return _headPopView;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        [self initAddPlanView];
        
        self.busineStr = @"";
        
        // 获取事项数据
        [self getShiXiangData];
        
        // 获取拜访方式数据
        [self getVisitWayData];
        
        
        // 获取重要性数据
        [self getimportanceData];
        
        // 获取状态数据
        [self getStateData];
        
        // 获取负责人
        [self getHeadNameData];
        
        // 获取参与人
        [self getParticipantsNameData];
        
    }
    return self;
}

#pragma mark - 获取联系人
-(void)getContractNameDataWithCusId:(NSString *)cusId
{
    NSString *contractUrl = [NSString stringWithFormat:@"%@%@",MAINURL,@"myplan/schedule/queryContactsValid"];
   
    
    NSDictionary *dict = @{@"customerId":cusId};
    
    NSLog(@"---%@",dict);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:contractUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"---%@",[responseObject JSONString]);
        if ([responseObject objectForKey:@"success"]) {
            
            [self.contractNameArray removeAllObjects];
            [self.contractIdArray removeAllObjects];
            
            NSDictionary *dataDict = [responseObject objectForKey:@"data"];
            NSArray *dataArray = [dataDict objectForKey:@"data"];
            for (int i =0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *contractName = [dict objectForKey:@"conName"];
                NSString *contractId = [dict objectForKey:@"id"];
                [self.contractNameArray addObject:contractName];
                [self.contractIdArray addObject:contractId];
                
                self.contractPopVIew = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.contractNameArray];
                self.contractPopVIew.delegate = self;
                self.contractPopVIew.tag = 100;
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
}


#pragma mark - 获取业务数据
-(void)getBusinessDataWithcusId:(NSString *)cusId
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"myplan/schedule/queryRelBusinValid"];
    NSDictionary *dict = @{@"cusId":self.customerId};
    
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    
    [manger POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"------%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dataDict = [responseObject objectForKey:@"data"];
            
            NSArray *dataArray = [dataDict objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                
                NSString *yeWuStr = [dict objectForKey:@"cusFullname"];
                
                NSString *yeWuId = [dict objectForKey:@"id"];
                
                [self.businessIdArray addObject:yeWuId];
                [self.businessArray addObject:yeWuStr];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"-----%@",error);
    }];

}

#pragma mark - 获取参与人
-(void)getParticipantsNameData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/employee/permissionPageQuery?start=0&limit=15"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dataDIct = [responseObject objectForKey:@"data"];
            
            NSArray *dataArray = [dataDIct objectForKey:@"data"];
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *name = [dict objectForKey:@"employeeName"];
                NSString *canYuId = [dict objectForKey:@"id"];
                [self.canYuNameArray addObject:name];
                [self.canYuIdArray addObject:canYuId];
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}

#pragma mark - 获取时间
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
                [pickerFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
                NSString *dateString = [pickerFormatter stringFromDate:datenow];
                
                [self.startTimeButton setTitle:dateString forState:UIControlStateNormal];
                [self.startTimeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.statrDateStr = timeSp;
                
            }else{
                
                [self.startTimeButton setTitle:timestr forState:UIControlStateNormal];
                [self.startTimeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.statrDateStr = shijianchuo;
            }
            
            break;
         
            
        case 2:
            
            if (shijianchuo.length < 1) {
                
                NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
                NSDateFormatter *pickerFormatter = [[NSDateFormatter alloc] init];// 创建一个日期格式器
                //时间戳的值
                NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
                //不带时间的
                [pickerFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
                NSString *dateString = [pickerFormatter stringFromDate:datenow];
                
                [self.endTimeButton setTitle:dateString forState:UIControlStateNormal];
                [self.endTimeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.endDataStr = timeSp;
                
            }else{
                
                [self.endTimeButton setTitle:timestr forState:UIControlStateNormal];
                [self.endTimeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.endDataStr = shijianchuo;
            }
            
            break;
            
        case 3:
            
            if (shijianchuo.length < 1) {
                
                NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
                NSDateFormatter *pickerFormatter = [[NSDateFormatter alloc] init];// 创建一个日期格式器
                //时间戳的值
                NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
                //不带时间的
                [pickerFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
                NSString *dateString = [pickerFormatter stringFromDate:datenow];
                
                [self.tiXingButton setTitle:dateString forState:UIControlStateNormal];
                [self.tiXingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.tiXingStr = timeSp;
                
            }else{
                
                [self.tiXingButton setTitle:timestr forState:UIControlStateNormal];
                [self.tiXingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.tiXingStr = shijianchuo;
            }
            
            break;

        default:
            break;
    }
}


#pragma mark - 获取事项数据
-(void)getShiXiangData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/parameter/item/business/queryValid?type=YWSX_OPERMAT"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                
                NSString *sxName = [dict objectForKey:@"name"];
                NSString *sxValue = [dict objectForKey:@"value"];
                [self.sxArray addObject:sxName];
                [self.sxValueArray addObject:sxValue];
                
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}

#pragma mark - 获取拜访方式数据
-(void)getVisitWayData
{
    NSString *wayUrl = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/parameter/item/business/queryValid?type=LLFS_CONTINFO"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:wayUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *wayDataArray = [responseObject objectForKey:@"data"];
            
            for (int i = 0 ; i < wayDataArray.count; i++) {
                
                NSDictionary *wayDict = [wayDataArray objectAtIndex:i];
                
                NSString *wayName = [wayDict objectForKey:@"name"];
                NSString *wayValue = [wayDict objectForKey:@"value"];
                [self.wayArray addObject:wayName];
                [self.wayValueArray addObject:wayValue];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}

#pragma mark - 获取相关业务数据
-(void)getRelatedDataWithCusId:(NSString *)cusId
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/parameter/item/business/queryValid?type=XGYW_RELBUSIN"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *dict = @{@"cusId":self.customerId};
    
    [manager GET:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *name = [dict objectForKey:@"name"];
                NSString *ywValue = [dict objectForKey:@"value"];
                [self.ywArray addObject:name];
                [self.ywValueArray addObject:ywValue];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}

#pragma mark - 获取重要性数据
-(void)getimportanceData
{
    NSString *zyUrl = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/parameter/item/business/queryValid?type=ZYX_IMPORTANCE"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:zyUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *zyDataArray = [responseObject objectForKey:@"data"];
            
            for (int i = 0; i < zyDataArray.count; i++) {
                
                NSDictionary *dict = [zyDataArray objectAtIndex:i];
                NSString *name = [dict objectForKey:@"name"];
                NSString *zyValue = [dict objectForKey:@"value"];
                [self.zyArray addObject:name];
                [self.zyValueArray addObject:zyValue];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    

}

#pragma mark - 获取状态数据
-(void)getStateData
{
    NSString *stateUrl = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/parameter/item/business/queryValid?type=JHZT_PLANSTATUS"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:stateUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *name = [dict objectForKey:@"name"];
                NSString *stateValue = [dict objectForKey:@"value"];
                [self.stateArray addObject:name];
                [self.stateValueArray addObject:stateValue];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}

#pragma mark - 获取负责人
-(void)getHeadNameData
{
    NSString *headNameUrl = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/employee/queryValid"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:headNameUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"---%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dataDict = [responseObject objectForKey:@"data"];
            NSArray *dataArray = [dataDict objectForKey:@"data"];
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *headName = [dict objectForKey:@"employeeName"];
                NSString *headId = [dict objectForKey:@"id"];
        
                NSString *orgId = [dict objectForKey:@"orgId"];
                
                // 如果orgId为空做的判断
                if (orgId == nil) {
                    orgId = @"0";
                }
                [self.headJiGouIdArray addObject:orgId];
                [self.headNameArray addObject:headName];
                [self.headIdArray addObject:headId];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}




-(void)initAddPlanView
{
    NSArray *titleArray = @[@"标题",@"事项",@"内容",@"地址/电话",@"负责人",@"参与人",@"状态",@"开始时间",@"完成时间",@"客户",@"联系人",@"重要性",@"方式",@"业务类型",@"相关业务",@""];
    
    for (int i = 0; i < titleArray.count; i++) {
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 50*i, 80, 50)];
        titleLabel.text = [titleArray objectAtIndex:i];
        titleLabel.textColor = [UIColor grayColor];
        titleLabel.tag = 100 + i;
        if (titleLabel.tag == 100 || titleLabel.tag == 107 || titleLabel.tag == 108 || titleLabel.tag == 109 || titleLabel.tag == 110 || titleLabel.tag == 113 || titleLabel.tag == 114) {
            
            titleLabel.textColor = [UIColor redColor];
        }
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:titleLabel];
        

        CALayer *henglayer = [[CALayer alloc] init];
        henglayer.backgroundColor = RGB(0, 195, 236).CGColor;
        henglayer.frame = CGRectMake(0, 50*(i+1), PHONE_UISCREEN_WIDTH, 0.5);
        [self.layer addSublayer:henglayer];

        
        if (i == 0 || i == 2 || i == 3) {
            
            UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame)+20, (50*i), PHONE_UISCREEN_WIDTH - 100, 50)];
            textView.backgroundColor = [UIColor clearColor];
            textView.text = @"请输入";
            textView.textColor = RGB(192, 192, 194);
            textView.delegate = self;
            
//            CGFloat fontCapHeight = textView.font.capHeight; // 文字大小所占的高度
            CGFloat topMargin = 10; // 跟顶部的间距
            textView.contentInset = UIEdgeInsetsMake(topMargin , 0, 0, 0);
            textView.font = [UIFont systemFontOfSize:14];
            [self addSubview:textView];
            
            switch (i) {
                case 0:
                    self.titleField = textView;
                    textView.tag = 5;
                    break;
                case 2:
                    self.contentField = textView;
                    break;
                case 3:
                    self.addressPhone = textView;
                default:
                    break;
            }
            
            
            
            
        }else if (i == 1  || i == 4 || i == 5 || i == 6 || i == 7 || i == 8 || i == 9 || i == 10 || i == 11 || i == 12 || i == 13 || i == 14 || i == 15){
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame)+20, (50*i), PHONE_UISCREEN_WIDTH-20-80, 50);
            [button setTitle:@"请选择" forState:UIControlStateNormal];
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            button.tag = 500 + i;
            [button addTarget:self action:@selector(clcikButtonAddVlsit:) forControlEvents:UIControlEventTouchUpInside];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button setTitleColor:RGB(179, 179, 184) forState:UIControlStateNormal];
            [self addSubview:button];


            switch (i) {
                case 1:
                    self.sxButton = button;
                    break;
                case 4:
                    self.headButton = button;
                    [self.headButton setTitle:[UserDefault getDataObjectForKey:@"logInName"] forState:UIControlStateNormal];
                    self.headJiGouId = [UserDefault getDataObjectForKey:@"jiGouIdStr"];

                    [self.headButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

                    break;
                case 5:
                    self.canYuButton = button;
                    self.canYuButton.titleLabel.adjustsFontSizeToFitWidth = YES;

                    break;
                case 6:
                    self.stateButton = button;
                    [self.stateButton setTitle:@"待跟进" forState:UIControlStateNormal];
                    [self.stateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

                    break;

                case 7:
                    self.startTimeButton = button;
                    [self.startTimeButton setTitle:@"必选项" forState:UIControlStateNormal];

                    break;
                case 8:
                    self.endTimeButton = button;
                    [self.endTimeButton setTitle:@"必选项" forState:UIControlStateNormal];

                    break;
                case 9:
                    self.customerButton = button;
                    [self.customerButton setTitle:@"必选项" forState:UIControlStateNormal];

                    break;
                case 10:
                    self.contractButton = button;
                    [self.contractButton setTitle:@"必选项" forState:UIControlStateNormal];

                    break;
                case 11:
                    self.zyxButton = button;
                    break;
                case 12:
                    self.visitWayButton = button;
                    break;
                case 13:
                    self.ywButton = button;
                    [self.ywButton setTitle:@"必选项" forState:UIControlStateNormal];

                    break;
                    
                case 14:
                    self.businessButton = button;
                    [self.businessButton setTitle:@"必选项" forState:UIControlStateNormal];

                    break;
                case 15:
                    self.tiXingButton = button;
                    self.tiXingButton.enabled = NO;
                    [self.tiXingButton setTitle:@"提醒时间" forState:UIControlStateNormal];
                    break;
                default:
                    break;
            }

        }
        
    }
    
    // 添加提醒按钮
    UIButton *checkBox = [UIButton buttonWithType:UIButtonTypeCustom];
    checkBox.selected = NO;  // 默认勾选分享按钮
    [checkBox setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    checkBox.frame = CGRectMake(25, 15*50+10, 30, 30);
    [checkBox setImage:[UIImage imageWithName:@"new_feature_share_false"] forState:UIControlStateNormal];
    [checkBox setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateSelected];
    [checkBox addTarget:self action:@selector(checkClcik:) forControlEvents:UIControlEventTouchUpInside];
    self.isTiXing = checkBox;
    [self addSubview:checkBox];

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 16 * 50+20, PHONE_UISCREEN_WIDTH-20, 30);
    button.backgroundColor = RGB(0, 195, 236);
    [button addTarget:self action:@selector(ciclkButtonAddPlan) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [self addSubview:button];
}



- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    
    if (textView.tag == 5) {
        
        if (textView.text.length > 0) {
            
            textView.textColor = [UIColor blackColor];
            
            UILabel *label = (UILabel *)[self viewWithTag:100];
            label.textColor = [UIColor grayColor];

        }
    }
    
    if ([textView.text isEqualToString:@"请输入"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
}


//-(void)textChange:(UITextField *)textFierd
//{
//    if (textFierd.tag == 5) {
//        
//        if (textFierd.text.length > 0) {
//            
//            UILabel *label = (UILabel *)[self viewWithTag:100];
//            label.textColor = [UIColor grayColor];
//
//        }else{
//        
//            UILabel *label = (UILabel *)[self viewWithTag:100];
//            label.textColor = [UIColor redColor];
//
//        }
//    }
//}


- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text.length<1) {
        textView.textColor = RGB(192, 192, 194);
        textView.text = @"请输入";
    }
}

#pragma mark - 提醒按钮点击
-(void)checkClcik:(UIButton *)button
{
    button.selected =! button.isSelected;
    
    if (button.selected == YES) {
        
        UIButton *butt = (UIButton *)[self viewWithTag:515];
        butt.enabled = YES;
        
    }else{
        
        UIButton *butt = (UIButton *)[self viewWithTag:515];
        butt.enabled = NO;
    }

}

-(void)clcikButtonAddVlsit:(UIButton *)button
{
    
    [self endEditing:YES];
    

    if (button.tag == 501) {
        
        [self.sxPopView showAlert];
        
    }else if (button.tag == 512) {
    
        [self.visitWayPopView showAlert];
        
    }else if (button.tag == 513) {
    
        [self.ywPopView showAlert];
    
        
    }else if (button.tag == 511) {
    
        [self.zyPopView showAlert];
        
    }else if (button.tag == 506) {
    
        [self.statePopView showAlert];
        
    }else if (button.tag == 504) {
    
        [self.headPopView showAlert];
        
    }else if (button.tag == 509) {

        [self.delegate swithButtonChooseCustomerWithTag:button.tag];
        
        UILabel *label = (UILabel *)[self viewWithTag:109];
        label.textColor = [UIColor grayColor];

        
    }else if (button.tag == 507) {
    
        [self.DatePickerCell showDatapicker];
        UILabel *label = (UILabel *)[self viewWithTag:107];
        label.textColor = [UIColor grayColor];

        
    }else if (button.tag == 510) {
    
        [self.contractPopVIew showAlert];

        
    }else if (button.tag == 505) {
    
        [self.canYuPopView showAlert];
        
    }else if (button.tag == 508) {
    
        [self.endPickerCell showDatapicker];
        UILabel *label = (UILabel *)[self viewWithTag:108];
        label.textColor = [UIColor grayColor];

        
    }else if (button.tag == 514) {
    
        [self.businessPopView showAlert];
        
    }else if (button.tag == 515) {
        
        [self.tiXingPickerCell showDatapicker];

    }

}


- (void)selectWhichButtonWithTag:(NSInteger )tag popView:(PopupView *)popview
{
    if (popview.tag == 40) {
        
        [self.sxButton setTitle:[self.sxArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.sxButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.sxValue = [self.sxValueArray objectAtIndex:tag - 100];
        
    }else if (popview.tag == 50){
    
        [self.visitWayButton setTitle:[self.wayArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.visitWayButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.visitValue = [self.wayValueArray objectAtIndex:tag -100];


    }else if (popview.tag == 60) {
    
    
        [self.ywButton setTitle:[self.ywArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.ywButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.ywValue = [self.ywValueArray objectAtIndex:tag - 100];
        UILabel *label = (UILabel *)[self viewWithTag:113];
        label.textColor = [UIColor grayColor];
        
        
    }else if (popview.tag == 90){
    
        [self.headButton setTitle:[self.headNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.headButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.headJiGouId = [self.headJiGouIdArray objectAtIndex:tag - 100];
        self.headId = [self.headIdArray objectAtIndex:tag - 100];
        
    }else if (popview.tag == 80){
    
        [self.stateButton setTitle:[self.stateArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.stateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.stateValue = [self.stateValueArray objectAtIndex:tag - 100];
        
    }else if (popview.tag == 70){
    
        [self.zyxButton setTitle:[self.zyArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.zyxButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.zyxValue = [self.zyValueArray objectAtIndex:tag - 100];
        
    }else if (popview.tag == 100){
    
        [self.contractButton setTitle:[self.contractNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.contractButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.contractId = [self.contractIdArray objectAtIndex:tag - 100];
        UILabel *label = (UILabel *)[self viewWithTag:110];
        label.textColor = [UIColor grayColor];

    
    }else if (popview.tag == 110){
    
        [self.canYuButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
        NSString *canYuName = [self.canYuNameArray objectAtIndex:tag-100];
        NSString *canYuId =[self.canYuIdArray objectAtIndex:tag-100];
        
        //用NSMutableSet存储负责人的姓名和id
        [self.nameIdSet addObject:canYuId];
        [self.nameSet addObject:canYuName];

        NSMutableArray *namestringarray = [[NSMutableArray alloc]initWithCapacity:0];
        NSEnumerator * enumerator =  [self.nameSet objectEnumerator];
        NSString * value;

        //用枚举遍历NSmutableSet，并加到namestringarray可变数组里
        while (value = [enumerator nextObject]) {
            [namestringarray addObject:value];
        }

        NSMutableArray *namesidarray = [[NSMutableArray alloc]initWithCapacity:0];
        NSEnumerator * enumeratorid =  [self.nameIdSet objectEnumerator];
        NSString * valueid;
        while (valueid = [enumeratorid nextObject]) {
            [namesidarray addObject:valueid];
        }

        //把数组的内容用，号分开
        [self.canYuButton setTitle:[namestringarray componentsJoinedByString:@","] forState:UIControlStateNormal];
        self.canYuId = [namesidarray componentsJoinedByString:@","];
        
    }else if (popview.tag == 120) {
    
        [self.businessButton setTitle:[self.businessArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.businessButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.busineStr = [self.businessArray objectAtIndex:tag - 100];
        self.businessId = [self.businessIdArray objectAtIndex:tag - 100];
        UILabel *label = (UILabel *)[self viewWithTag:114];
        label.textColor = [UIColor grayColor];
    }
}

-(void)ciclkButtonAddPlan
{
    if ([self.statrDateStr doubleValue] > [self.endDataStr doubleValue]) {
        
        [[Session sharedSession].tpView presentMessageTips:@"开始时间不能大于结束时间"];
    } else {
        
        [self.delegate ciclkButtonAddPlan];
    }
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
@end
