//
//  TurnToView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/24.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "TurnToView.h"
#import "AFNetworking.h"
#import "PopupView.h"


@interface TurnToView () <UITextViewDelegate,PopviewDelegate>

@property (nonatomic, strong)UILabel *placeholderLabel;

@property (nonatomic, strong)PopupView *yuanYinPopView;
@property (nonatomic, strong)NSMutableArray *yuanYinNameArray;
@property (nonatomic, strong)NSMutableArray *yuanYinValueArray;


@property (nonatomic, strong)NSMutableArray *yeTaiArray;
@property (nonatomic, strong)NSMutableArray *yeTaiValueArray;
@property (nonatomic, strong)PopupView *yeTaiPopView;


@property (nonatomic, strong)PopupView *jiGouPopView;
@property (nonatomic, strong)NSMutableArray *jiGouArray;
@property (nonatomic, strong)NSMutableArray *jiGouIdArray;


@property (nonatomic, strong)PopupView *headPopView;
@property (nonatomic, strong)NSMutableArray *headIdArray;
@property (nonatomic, strong)NSMutableArray *headNameArray;


@end

@implementation TurnToView

-(PopupView *)headPopView
{
    if (!_headPopView) {
        
        _headPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.headNameArray];
        _headPopView.delegate = self;
        _headPopView.tag = 400;
    }
    return _headPopView;
}

-(NSMutableArray *)headIdArray
{
    if (!_headIdArray) {
        
        _headIdArray = [NSMutableArray array];
    }
    return _headIdArray;
}

-(NSMutableArray *)headNameArray
{
    if (!_headNameArray) {
        
        _headNameArray = [NSMutableArray array];
    }
    return _headNameArray;
}


-(PopupView *)jiGouPopView
{
    if (!_jiGouPopView) {
        
        _jiGouPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.jiGouArray];
        _jiGouPopView.delegate = self;
        _jiGouPopView.tag = 300;
    }
    return _jiGouPopView;
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
        _yeTaiPopView.tag = 200;
    }
    return _yeTaiPopView;
}


-(PopupView *)yuanYinPopView
{
    if (!_yuanYinPopView) {
        
        _yuanYinPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.yuanYinNameArray];
        _yuanYinPopView.delegate = self;
        _yuanYinPopView.tag = 100;
    }
    return _yuanYinPopView;
}

-(NSMutableArray *)yuanYinNameArray
{
    if (!_yuanYinNameArray) {
        
        _yuanYinNameArray = [NSMutableArray array];
    }
    return _yuanYinNameArray;
}

-(NSMutableArray *)yuanYinValueArray
{
    if (!_yuanYinValueArray) {
        
        _yuanYinValueArray = [NSMutableArray array];
    }
    return _yuanYinValueArray;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        // 委托的view
        [self initTurnToView];
        
        
        [self getYuanYinData];
        
        // 业态
        [self getYeTaiData];
        
    }
    return self;
}

-(void)getJiGouDataWithYeTaiValue:(NSString *)yeTaiValue
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"/base/org/queryAll"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"busiTypeId":yeTaiValue};
    
    
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
        
        self.jiGouPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.jiGouArray];
        self.jiGouPopView.delegate = self;
        self.jiGouPopView.tag = 300;

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

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
                NSString *yeTaiValue = [dict objectForKey:@"value"];
                [self.yeTaiArray addObject:yeTaiName];
                [self.yeTaiValueArray addObject:yeTaiValue];
            }
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
    
}


-(void)getYuanYinData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/parameter/item/business/queryValid?type=BP_TRANSFERREASON"];
    
    AFHTTPRequestOperationManager *mag = [AFHTTPRequestOperationManager manager];
    
    [mag GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *Name = [dict objectForKey:@"name"];
                NSString *Value = [dict objectForKey:@"value"];
                [self.yuanYinNameArray addObject:Name];
                [self.yuanYinValueArray addObject:Value];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}

-(void)getHeadNameDataWithJiGouId:(NSString *)jiGouId
{
    NSString *headNameUrl = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/employee/queryValid"];
    
    NSDictionary *dict = @{@"orgId":jiGouId};
    
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
                
                [self.headNameArray addObject:headName];
                [self.headIdArray addObject:headId];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}


-(void)initTurnToView
{
    NSArray  *titleArray = @[@"客户名称",@"委托原因",@"归属业态",@"归属机构",@"负责人"];
    
    for (int i = 0; i < titleArray.count; i++) {
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 50*i, 70, 50)];
        
        titleLabel.textColor = [UIColor grayColor];

        titleLabel.tag = 40 + i;
        
        if (titleLabel.tag != 40) {
            
            titleLabel.textColor = [UIColor redColor];
        }
        titleLabel.text = [titleArray objectAtIndex:i];
        titleLabel.font = [UIFont systemFontOfSize:14];
        
        titleLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:titleLabel];
        
        CALayer *henglayer = [[CALayer alloc] init];
        henglayer.backgroundColor = RGB(0, 195, 236).CGColor;
        henglayer.frame = CGRectMake(0, 49.5*(i+1), PHONE_UISCREEN_WIDTH, 0.5);
        [self.layer addSublayer:henglayer];

        
        if (i == 0) {
            
            UILabel *cuslabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame), 50*i, PHONE_UISCREEN_WIDTH - 90, 50)];
            cuslabel.textAlignment = NSTextAlignmentCenter;
            cuslabel.font = [UIFont systemFontOfSize:14];
            self.cusLabel = cuslabel;
            cuslabel.textColor = [UIColor blackColor];
            [self addSubview:cuslabel];
        } else {
        
            UIButton *chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
            chooseButton.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame), 50*i, PHONE_UISCREEN_WIDTH-90, 50);
            [chooseButton setTitle:@"必选项" forState:UIControlStateNormal];
            chooseButton.titleLabel.font = [UIFont systemFontOfSize:14];
            [chooseButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            chooseButton.tag = 10+i;
            [chooseButton addTarget:self action:@selector(weiTuoButton:) forControlEvents:UIControlEventTouchUpInside];
            chooseButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            [self addSubview:chooseButton];
        
            switch (i) {
                case 1:
                    self.yuanYinButton = chooseButton;
                    break;
                case 2:
                    self.yeiTaiButton = chooseButton;
                    break;
                case 3:
                    self.jiGouButton = chooseButton;
                    break;
                case 4:
                    self.headNameButton = chooseButton;
                default:
                    break;
            }
        }
    }
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 50*5+20, PHONE_UISCREEN_WIDTH-20, 200)];
    textView.delegate = self;
    self.shuoMingText = textView;
    textView.backgroundColor = [UIColor whiteColor];
    [self addSubview:textView];
    
    self.placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, PHONE_UISCREEN_WIDTH-30, 30)];
    self.placeholderLabel.textColor = [UIColor grayColor];
    self.placeholderLabel.font = [UIFont systemFontOfSize:14];
    self.placeholderLabel.text = @"请简要描述您的说明内容(500字内)";
    self.placeholderLabel.textColor = [UIColor grayColor];
    self.placeholderLabel.hidden = NO;
    self.placeholderLabel.enabled = NO; //label必须设置为不可用
    [textView addSubview:self.placeholderLabel];
    
}


#pragma mark  UItextViewDelegate 这个可以用
-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        
        self.placeholderLabel.text = @"请简要描述您的说明内容(500字内)";
        
    }else{
        
        self.placeholderLabel.text = @"";
        
        if ([textView.text length] > 100) {
            
            textView.text = [textView.text substringToIndex:100];
            [self endEditing:YES];
            [[Session sharedSession].tpView presectLoadingTips:@"超出最大限制"];
        }
    }
}

#pragma mark -- textview点击右下角按钮收起键盘
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

-(void)weiTuoButton:(UIButton *)button
{
    if (button.tag == 11) {
        
        [self.yuanYinPopView showAlert];
        
    }else if (button.tag == 12) {
    
        
        [self.yeTaiPopView showAlert];

    
    }else if (button.tag == 13) {
    
        
        if (self.yeTaiValue.length > 1) {
            
            [self.jiGouPopView showAlert];
            
        }else {
            
            [[Session sharedSession].tpView presentMessageTips:@"请先选择业态"];
            
        }

        
    }else if (button.tag == 14) {
    
        
        if (self.jiGouId.length > 1) {
            
            if (self.headNameArray.count == 0) {
                
                [[Session sharedSession].tpView presentMessageTips:@"该机构下没有负责人"];
            }else{
                
                [self.headPopView showAlert];
                
            }
        }else {
            
            [[Session sharedSession].tpView presentMessageTips:@"请先选择机构"];
        }

    }

}


-(void)selectWhichButtonWithTag:(NSInteger)tag popView:(PopupView *)popview
{
    if (popview.tag == 100) {
        
        [self.yuanYinButton setTitle:[self.yuanYinNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.yuanYinButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.yuanYinValue = [self.yuanYinValueArray objectAtIndex:tag - 100];
        
        UILabel *label = (UILabel *)[self viewWithTag:41];
        label.textColor = [UIColor grayColor];

        
    }else if (popview.tag == 200) {
    
        [self.yeiTaiButton setTitle:[self.yeTaiArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.yeiTaiButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        self.yeTaiValue = [self.yeTaiValueArray objectAtIndex:tag - 100];
        
        UILabel *label = (UILabel *)[self viewWithTag:42];
        label.textColor = [UIColor grayColor];

        
        // 归属机构
        if (self.yeTaiValue.length > 1) {
            
            [self getJiGouDataWithYeTaiValue:self.yeTaiValue];
            
        }

    }else if (popview.tag == 300) {
    
        [self.jiGouButton setTitle:[self.jiGouArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.jiGouButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        self.jiGouId = [self.jiGouIdArray objectAtIndex:tag - 100];
        
        UILabel *label = (UILabel *)[self viewWithTag:43];
        label.textColor = [UIColor grayColor];

        
        if (self.jiGouId.length > 1) {
            // 获取负责人
            [self getHeadNameDataWithJiGouId:self.jiGouId];
        }
    
    }else if (popview.tag == 400) {
    
        [self.headNameButton setTitle:[self.headNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.headNameButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        self.headId = [self.headIdArray objectAtIndex:tag - 100];
        
        UILabel *label = (UILabel *)[self viewWithTag:44];
        label.textColor = [UIColor grayColor];

    }

}

@end
