//
//  AddConRecord.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/14.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "AddConRecord.h"
#import "AFNetworking.h"
#import "PopupView.h"
#import "UserDefault.h"
#import "DefaultCell.h"



@interface AddConRecord () <PopviewDelegate,DefaultDataPickerDelegate,UITextFieldDelegate>

@property (nonatomic, strong)NSMutableArray *resutluArray;
@property (nonatomic, strong)NSMutableArray *resultValueArray;
@property (nonatomic, strong)PopupView *resutluPopView;


@property(nonatomic,strong)DefaultCell *genJinPickerCell;
@property(nonatomic,strong)DefaultCell *yuYuePickerCell;

@end

@implementation AddConRecord


-(PopupView *)resutluPopView
{
    if (!_resutluPopView) {
        
        _resutluPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.resutluArray];
        _resutluPopView.delegate = self;
        _resutluPopView.tag = 110;
    }
    return _resutluPopView;
}

-(NSMutableArray *)resutluArray
{
    if (!_resutluArray) {
        
        _resutluArray = [NSMutableArray array];
    }
    return _resutluArray;
}

-(NSMutableArray *)resultValueArray
{
    if (!_resultValueArray) {
        
        _resultValueArray = [NSMutableArray array];
    }
    return _resultValueArray;
}



-(DefaultCell*)genJinPickerCell{
    
    if (!_genJinPickerCell) {
        _genJinPickerCell = [[DefaultCell alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        _genJinPickerCell.delegate = self;
        _genJinPickerCell.whichCell = 1;
    }
    
    return _genJinPickerCell;
}


-(DefaultCell*)yuYuePickerCell{
    
    if (!_yuYuePickerCell) {
        _yuYuePickerCell = [[DefaultCell alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        _yuYuePickerCell.delegate = self;
        _yuYuePickerCell.whichCell = 2;
    }
    
    return _yuYuePickerCell;
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
                
                [self.genJinTime setTitle:dateString forState:UIControlStateNormal];
                [self.genJinTime setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.genJinDateStr = timeSp;
                
                UILabel *label = (UILabel *)[self viewWithTag:10];
                label.textColor = [UIColor blackColor];
                
            }else{
                
                [self.genJinTime setTitle:timestr forState:UIControlStateNormal];
                [self.genJinTime setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.genJinDateStr = shijianchuo;
                UILabel *label = (UILabel *)[self viewWithTag:10];
                label.textColor = [UIColor blackColor];

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
                
                [self.yuYueTime setTitle:dateString forState:UIControlStateNormal];
                [self.yuYueTime setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.yuYueDataStr = timeSp;
                UILabel *label = (UILabel *)[self viewWithTag:13];
                label.textColor = [UIColor blackColor];

                
            }else{
                
                [self.yuYueTime setTitle:timestr forState:UIControlStateNormal];
                [self.yuYueTime setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.yuYueDataStr = shijianchuo;
                UILabel *label = (UILabel *)[self viewWithTag:13];
                label.textColor = [UIColor blackColor];

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
        
        [self initConRecordView];
    }
    return self;
}

-(void)initConRecordView
{
    NSArray *titleArray = @[@"跟进时间",@"结果",@"原因",@"预约时间",@"内容"];
    
    for (int i = 0; i < titleArray.count; i++) {
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 50*i, 60, 50)];
        titleLabel.text = [titleArray objectAtIndex:i];
        titleLabel.tag = 10 + i;
        titleLabel.textColor = [UIColor blackColor];
        if (titleLabel.tag == 10 || titleLabel.tag == 11 || titleLabel.tag == 13) {
            
            titleLabel.textColor = [UIColor redColor];
        }
        titleLabel.textAlignment = NSTextAlignmentRight;
        titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:titleLabel];
        
        CALayer *henglayer = [[CALayer alloc] init];
        henglayer.backgroundColor = RGB(0, 195, 236).CGColor;
        henglayer.frame = CGRectMake(0, 49.5*(i+1), PHONE_UISCREEN_WIDTH, 0.5);
        [self.layer addSublayer:henglayer];

        
        if (i == 0 || i == 1 || i == 3) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame)+20, 50*i, PHONE_UISCREEN_WIDTH-80, 50);
            [button setTitle:@"必选项" forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            button.tag = 100 + i;
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [button addTarget:self action:@selector(clcikButtonChoose:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [self addSubview:button];
            
            switch (i) {
                case 0:
                    self.genJinTime = button;
                    break;
                case 1:
                    self.resultButton = button;
                    break;
                case 3:
                    self.yuYueTime = button;
                    break;
                default:
                    break;
            }
            
        }else if (i == 2 || i == 4) {
        
            UITextField *textView = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame)+20, 50*i, PHONE_UISCREEN_WIDTH-80, 50)];
            textView.delegate = self;
            textView.placeholder = @"请输入内容";
            textView.font = [UIFont systemFontOfSize:14];
            [self addSubview:textView];
            
            switch (i) {
                case 2:
                    self.yuanYinText = textView;
                    break;
                case 4:
                    self.contentText = textView;
                    break;
                default:
                    break;
            }
        }
    }
    
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(20, 5*50+20, PHONE_UISCREEN_WIDTH-40, 30);
    butt.backgroundColor = RGB(0, 195, 236);
    [butt addTarget:self action:@selector(clcikButtonAddRecord:) forControlEvents:UIControlEventTouchUpInside];
    [butt setTitle:@"确定" forState:UIControlStateNormal];
    [self addSubview:butt];

    // 获取结果数据
    [self getReustusData];

}


// 获取结果数据
-(void)getReustusData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/parameter/item/business/queryValid?type=BP_CONTACT_RESULT"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *name = [dict objectForKey:@"name"];
                NSString *value = [dict objectForKey:@"value"];
                [self.resutluArray addObject:name];
                [self.resultValueArray addObject:value];
                
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}


-(void)clcikButtonChoose:(UIButton *)button
{
    [self endEditing:YES];
    
    if (button.tag == 100) {
        
        [self.genJinPickerCell showDatapicker];
        
    }else if (button.tag == 103) {
    
        [self.yuYuePickerCell showDatapicker];
        
    }else if(button.tag == 101) {
    
        [self.resutluPopView showAlert];
        
    }

}

- (void)selectWhichButtonWithTag:(NSInteger )tag popView:(PopupView *)popview
{
    if (popview.tag == 110) {
        
        [self.resultButton setTitle:[self.resutluArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.resultButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.resultValue = [self.resultValueArray objectAtIndex:tag - 100];
        UILabel *label = (UILabel *)[self viewWithTag:11];
        label.textColor = [UIColor blackColor];

    }
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)clcikButtonAddRecord:(UIButton *)button
{
    [self.delegate swithButtonAddConRecord];
}


@end
