//
//  NewCluesView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/24.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "NewCluesView.h"
#import "DefaultCell.h"
#import "AFNetworking.h"
#import "PopupView.h"


@interface NewCluesView () <UITextViewDelegate,PopviewDelegate,DefaultDataPickerDelegate>


@property(nonatomic,strong)DefaultCell *findDatePickerCell;

@property (nonatomic, strong)UILabel *placeholderLabel;

@property (nonatomic, strong)NSMutableArray *stateArray;
@property (nonatomic, strong)NSMutableArray *stateValueArray;
@property (nonatomic, strong)PopupView *statePopView;


@property (nonatomic, strong)NSMutableArray *jiGouArray;
@property (nonatomic, strong)NSMutableArray *jiGouIdArray;
@property (nonatomic, strong)PopupView *jiGouPopVIew;

@property (nonatomic, strong)NSMutableArray *yeTaiArray;
@property (nonatomic, strong)NSMutableArray *yeTaiValueArray;
@property (nonatomic, strong)PopupView *yeTaiPopView;

@property (nonatomic, strong)PopupView *headPopView;

@property (nonatomic, strong)PopupView *jiGouHeadPopView;
@property (nonatomic, strong)NSMutableArray *jiGouHeadNameArray;
@property (nonatomic, strong)NSMutableArray *jiGouHeadIdArray;


@property (nonatomic, strong)PopupView *sourcePopView;
@property (nonatomic, strong)NSMutableArray *sourceArray;
@property (nonatomic, strong)NSMutableArray *sourceValueArray;

@end

@implementation NewCluesView

-(PopupView *)jiGouHeadPopView
{
    if (!_jiGouHeadPopView) {
        
        _jiGouHeadPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.jiGouHeadNameArray];
        _jiGouHeadPopView.delegate = self;
        _jiGouHeadPopView.tag = 600;
    }
    return _jiGouHeadPopView;
}

-(NSMutableArray *)jiGouHeadNameArray
{
    if (!_jiGouHeadNameArray) {
        
        _jiGouHeadNameArray = [NSMutableArray array];
    }
    return _jiGouHeadNameArray;
}


-(NSMutableArray *)jiGouHeadIdArray
{
    if (!_jiGouHeadIdArray) {
        
        _jiGouHeadIdArray = [NSMutableArray array];
    }
    return _jiGouHeadIdArray;
}


-(DefaultCell*)findDatePickerCell{
    
    if (!_findDatePickerCell) {
        _findDatePickerCell = [[DefaultCell alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        _findDatePickerCell.delegate = self;
        _findDatePickerCell.whichCell = 1;
    }
    
    return _findDatePickerCell;
}


-(PopupView *)sourcePopView
{
    if (!_sourcePopView) {
        
        _sourcePopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.sourceArray];
        _sourcePopView.delegate = self;
        _sourcePopView.tag = 500;
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


-(PopupView *)statePopView
{
    if (!_statePopView) {
        
        _statePopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.stateArray];
        _statePopView.delegate = self;
        _statePopView.tag = 100;
    }
    return _statePopView;
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


-(NSMutableArray *)jiGouArray
{
    if (!_jiGouArray) {
        
        _jiGouArray = [NSMutableArray array];
    }
    return _jiGouArray;
}

-(NSMutableArray *)jiGouIdArray
{
    if (!_jiGouIdArray) {
        
        _jiGouIdArray = [NSMutableArray array];
    }
    return _jiGouIdArray;
}

-(PopupView *)jiGouPopVIew
{
    if (!_jiGouPopVIew) {
        
        _jiGouPopVIew = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.jiGouArray];
        _jiGouPopVIew.delegate = self;
        _jiGouPopVIew.tag = 200;
    }
    return _jiGouPopVIew;
}

-(NSMutableArray *)yeTaiArray
{
    if (!_yeTaiArray) {
        
        _yeTaiArray = [NSMutableArray array];
    }
    return _yeTaiArray;
}



-(NSMutableArray *)yeTaiValueArray
{
    if (!_yeTaiValueArray) {
        
        _yeTaiValueArray = [NSMutableArray array];
    }
    
    return _yeTaiValueArray;
}

-(PopupView *)yeTaiPopView
{
    if (!_yeTaiPopView) {
        
        _yeTaiPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.yeTaiArray];
        _yeTaiPopView.delegate = self;
        _yeTaiPopView.tag = 300;
    }
    return _yeTaiPopView;
}

-(PopupView *)headPopView
{
    if (!_headPopView) {
        
        _headPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:[Session sharedSession].headNameArray];
        _headPopView.delegate = self;
        _headPopView.tag = 400;
    }
    return _headPopView;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
    
        self.backgroundColor = [UIColor whiteColor];
        
        [self initNewCluesView];
        
        // 获取状态数据
        [self getStateData];
        
        // 来源类型
        [self getSourceData];
        
        
        // 业态
        [self getYeTaiData];
        
    }

    return self;
}




-(void)getYeTaiData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"/base/parameter/item/business/queryValid?type=BP_YETAI"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *yeTaiName = [dict objectForKey:@"name"];
                NSString *yetaiValue = [dict objectForKey:@"value"];
                [self.yeTaiArray addObject:yeTaiName];
                [self.yeTaiValueArray addObject:yetaiValue];
                
            }
        }

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];


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
                [pickerFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
                NSString *dateString = [pickerFormatter stringFromDate:datenow];
                
                [self.timeButton setTitle:dateString forState:UIControlStateNormal];
                [self.timeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.timeStr = timeSp;
                
            }else{
                
                [self.timeButton setTitle:timestr forState:UIControlStateNormal];
                [self.timeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.timeStr = shijianchuo;
            }
            
            break;
        default:
            break;
    }
}



#pragma mark - 根据value查的
-(void)getInstitutionsDataWithYeTaiId:(NSString *)yeTaiId
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"/base/org/queryAll"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *dict = @{@"busiTypeId":yeTaiId};
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        [self.jiGouArray removeAllObjects];

        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dataDict = [responseObject objectForKey:@"data"];
            
            NSArray *dataArray = [dataDict objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                
                NSString *jiGouName = [dict objectForKey:@"name"];
                NSString *jiGouId = [dict objectForKey:@"id"];
                [self.jiGouArray addObject:jiGouName];
                [self.jiGouIdArray addObject:jiGouId];
                
                
            }
        }
        
        
        self.jiGouPopVIew = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.jiGouArray];
        self.jiGouPopVIew.delegate = self;
        self.jiGouPopVIew.tag = 200;

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}




-(void)getSourceData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/parameter/item/business/queryValid?type=BP_FINDSOURCEID"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *name = [dict objectForKey:@"name"];
                NSString *nameValue = [dict objectForKey:@"value"];
                [self.sourceArray addObject:name];
                [self.sourceValueArray addObject:nameValue];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}


-(void)initNewCluesView
{
    
    
    NSArray *buttonArray = @[@"客户名称",@"星级",@"类型",@"所属集团",@"用户性质",@"经营性质",@"酒店属性",@"酒店规模",@"携程类型",@"管理公司",@"来源名称",@"所在区域",@"详细地址",@"来源类型",@"发现时间",@"归属业态",@"归属机构",@"负责人",@"发现人",@"状态",@"说明"];

    for (int i = 0; i < buttonArray.count; i++) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, (50*i), 80, 50)];
        label.text = [buttonArray objectAtIndex:i];
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor grayColor];
        label.tag = 90 + i;
        if (label.tag == 103 || label.tag == 105 || label.tag == 106 || label.tag == 107) {
            
            label.textColor = [UIColor redColor];
        }
        
        [self addSubview:label];
        
       
    
        CALayer *henglayer = [[CALayer alloc] init];
        henglayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
        henglayer.frame = CGRectMake(0, 49.5*(i+1), PHONE_UISCREEN_WIDTH, 0.5);
        [self.layer addSublayer:henglayer];
        
        if (i == 0 ||i == 1 || i == 2 || i == 3 || i == 4 ||i == 5|| i == 6 || i == 7 || i == 8 || i == 9 || i == 10 || i == 11 || i == 12) {
            
            UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(label.frame)+20, 50*i, PHONE_UISCREEN_WIDTH-110, 50)];
            contentLabel.font = [UIFont systemFontOfSize:14];
            [self addSubview:contentLabel];
            
            switch (i) {
                

                case 0:
                    self.customerLabel = contentLabel;
                    break;
                case 1:
                    self.levelLabel = contentLabel;
                    break;
                case 2:
                    self.typeLabel = contentLabel;
                    break;
                case 3:
                    self.jiTuanLabel = contentLabel;
                    break;
                case 4:
                    self.userXzLabel = contentLabel;
                    break;
                case 5:
                    self.jyxzLabel = contentLabel;
                    break;
                case 6:
                    self.attLabel = contentLabel;
                    break;
                case 7:
                    self.sizeLabel = contentLabel;
                    break;
                case 8:
                    self.ctripLabel = contentLabel;
                    break;
                case 9:
                    self.managerLabel = contentLabel;
                    break;
                case 10:
                    self.sourceLabel = contentLabel;
                    break;
                case 11:
                    self.areaLabel = contentLabel;
                    break;
                case 12:
                    self.addressLabel = contentLabel;
                default:
                    break;
            }
            
        }else if (i == 13 || i == 14 || i == 15 || i == 16 || i == 17 || i == 18 || i == 19){
        
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(CGRectGetMaxX(label.frame)+20, 50*i, PHONE_UISCREEN_WIDTH - 110, 50);
            button.tag = 20 + i;
            [button addTarget:self action:@selector(chooseCustomerData:) forControlEvents:UIControlEventTouchUpInside];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button setTitle:@"请选择" forState:UIControlStateNormal];
            
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [self addSubview:button];
            
            switch (i) {
                    
                    
                case 13:
                    self.sourceButton = button;
                    break;
                    
                case 14:
                    self.timeButton = button;
                    break;
                    
                case 15:
                    self.yeTaiButton = button;
                    break;
                    
                case 16:
                    self.jiGouButton = button;
                    break;
                    
                case 17:
                    self.headButton = button;
                    break;
                    
                case 18:
                    self.findNameButton = button;
                    break;
                    
                case 19:
                    self.stateButton = button;
                    [self.stateButton setTitle:@"待跟踪" forState:UIControlStateNormal];
                    [self.stateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    break;
                    
                default:
                    break;
                    
            }
        
        }
        
        if (i == 20) {
            
            UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(label.frame)+20, 50*i, PHONE_UISCREEN_WIDTH-110, 40)];
            textView.font = [UIFont systemFontOfSize:14];
            textView.backgroundColor = [UIColor clearColor];
            textView.contentInset = UIEdgeInsetsMake(10 , 0, 0, 0);
            textView.text = @"请输入";
            textView.textColor = RGB(192, 192, 194);
            textView.delegate = self;
            [self addSubview:textView];
            self.shuoMingText = textView;
            
        }
        
    }
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = RGB(0, 195, 236);
    button.tag = 40;
    button.userInteractionEnabled = NO;
    button.alpha = 0.5;
    button.frame = CGRectMake(20, 21*50+5, PHONE_UISCREEN_WIDTH-40, 30);
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clcikButtonAddClues) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
}


-(void)chooseCustomerData:(UIButton *)button
{
    [self endEditing:YES];

    if (button.tag == 33) {
        
        [self.sourcePopView showAlert];
        
    }else if (button.tag == 34) {
    
        [self.findDatePickerCell showDatapicker];

        
    }else if (button.tag == 35) {
    
        [self.yeTaiPopView showAlert];
        
    }else if (button.tag == 36) {
        
        if (self.yeTaiValue.length > 1) {
            
            [self.jiGouPopVIew showAlert];

        }else {
        
            [[Session sharedSession].tpView presentMessageTips:@"请先选择业态"];

        }
    
    }else if (button.tag == 37) {
    
        if (self.jiGouId.length > 1) {
            
            if (self.jiGouHeadNameArray.count == 0) {
                
                [[Session sharedSession].tpView presentMessageTips:@"该机构下没有负责人"];
            }else{
            
                [self.jiGouHeadPopView showAlert];
                
                UIButton *butt = (UIButton *)[self viewWithTag:40];
                butt.userInteractionEnabled = YES;
                butt.alpha = 1;

            }
        }else {
            
            [[Session sharedSession].tpView presentMessageTips:@"请先选择机构"];
        }
        
    }else if (button.tag == 38) {
        
        // 发现人
        [self.headPopView showAlert];
        
    }else if (button.tag == 39) {
        
        [self.statePopView showAlert];
        
        
    
    }

}


-(void)getStateData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"/base/parameter/item/system/queryValid?type=SP_CLUESTATUS"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *stateName = [dict objectForKey:@"name"];
                NSString *stateValue = [dict objectForKey:@"value"];
                [self.stateArray addObject:stateName];
                [self.stateValueArray addObject:stateValue];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
}

-(void)selectWhichButtonWithTag:(NSInteger)tag popView:(PopupView *)popview
{
    if (popview.tag == 100) {
        
        [self.stateButton setTitle:[self.stateArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.stateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.stateValue = [self.stateValueArray objectAtIndex:tag - 100];
        
    }else if (popview.tag == 200) {
    
        [self.jiGouButton setTitle:[self.jiGouArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.jiGouButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.jiGouId = [self.jiGouIdArray objectAtIndex:tag - 100];
        
        if (self.jiGouId.length > 1) {
            
            [self getHeadNameWithJiGouId:self.jiGouId];

        }
        UILabel *label = (UILabel *)[self viewWithTag:106];
        label.textColor = [UIColor grayColor];

    }else if (popview.tag == 300) {
    
        [self.yeTaiButton setTitle:[self.yeTaiArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.yeTaiButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        self.yeTaiValue = [self.yeTaiValueArray objectAtIndex:tag - 100];
        
        
        if (self.yeTaiValue.length > 1) {
            
            // 机构
            [self getInstitutionsDataWithYeTaiId:self.yeTaiValue];
            
        }
        
        UILabel *label = (UILabel *)[self viewWithTag:105];
        label.textColor = [UIColor grayColor];

    
    }else if (popview.tag == 400) {
    
        [self.findNameButton setTitle:[[Session sharedSession].headNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.findNameButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }else if (popview.tag == 500) {
    
        [self.sourceButton setTitle:[self.sourceArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.sourceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.sourceValue = [self.sourceValueArray objectAtIndex:tag - 100];
        
        UILabel *label = (UILabel *)[self viewWithTag:103];
        label.textColor = [UIColor grayColor];

        
        
    }else if (popview.tag == 600) {
    
        [self.headButton setTitle:[self.jiGouHeadNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.headButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        UILabel *label = (UILabel *)[self viewWithTag:107];
        label.textColor = [UIColor grayColor];


    }

}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    
    
    if (textView.text.length > 0) {
        
        textView.textColor = [UIColor blackColor];
        
        UILabel *label = (UILabel *)[self viewWithTag:100];
        label.textColor = [UIColor grayColor];
        
    }
    
    if ([textView.text isEqualToString:@"请输入"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
}


- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text.length<1) {
        textView.textColor = RGB(192, 192, 194);
        textView.text = @"请输入";
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

-(void)getHeadNameWithJiGouId:(NSString *)jigouId
{
    NSString *headNameUrl = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/employee/queryValid"];
    
    NSDictionary *dict = @{@"orgId":jigouId};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:headNameUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"---%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dataDict = [responseObject objectForKey:@"data"];
            NSArray *dataArray = [dataDict objectForKey:@"data"];
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *headName = [dict objectForKey:@"employeeName"];
                NSString *headId = [dict objectForKey:@"id"];
                
                [self.jiGouHeadNameArray addObject:headName];
                [self.jiGouHeadIdArray addObject:headId];
            }
        }
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}


-(void)clcikButtonAddClues
{
    [self.delegate swithButtonAddClues];
}



@end
