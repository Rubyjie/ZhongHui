//
//  CloseView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/22.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CloseView.h"
#import "PopupView.h"
#import "DefaultCell.h"


#import "AFNetworking.h"

@interface CloseView () <UITextViewDelegate,PopviewDelegate,DefaultDataPickerDelegate>

@property (nonatomic, strong)UILabel *placeholderLabel;

//结果的弹框
@property (nonatomic, strong)PopupView *resultPopView;

//原因的弹框
@property (nonatomic, strong)PopupView *yuanYinPopView;

@property (nonatomic, strong)NSMutableArray *resultNameArray;
@property (nonatomic, strong)NSMutableArray *resultValueArray;

@property (nonatomic, strong)NSMutableArray *yuanYinNameArray;
@property (nonatomic, strong)NSMutableArray *yuanYinValueArray;




@property(nonatomic,strong)DefaultCell *endDatePickerCell;

@end

@implementation CloseView

-(DefaultCell*)endDatePickerCell{
    
    if (!_endDatePickerCell) {
        _endDatePickerCell = [[DefaultCell alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        _endDatePickerCell.delegate = self;
        _endDatePickerCell.whichCell = 1;
    }
    
    return _endDatePickerCell;
}


-(NSMutableArray *)resultNameArray
{
    if (!_resultNameArray) {
        
        _resultNameArray = [NSMutableArray array];
    }
    return _resultNameArray;
}

-(NSMutableArray *)resultValueArray
{
    if (!_resultValueArray) {
        
        _resultValueArray = [NSMutableArray array];
    }
    return _resultValueArray;
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

-(PopupView*)resultPopView
{
    if (!_resultPopView) {
        _resultPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.resultNameArray];
        [_resultPopView setTag:700];
        _resultPopView.delegate = self;
    }
    
    return _resultPopView;
}


-(PopupView*)yuanYinPopView
{
    if (!_yuanYinPopView) {
        _yuanYinPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.yuanYinNameArray];
        [_yuanYinPopView setTag:800];
        _yuanYinPopView.delegate = self;
    }
    
    return _yuanYinPopView;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
    
        
        [self initCloseView];
        // 获取结果数据
        [self getResultsData];
        
        // 获取原因数据
        [self getYuanYinData];
    }
    return self;
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
                [pickerFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
                NSString *dateString = [pickerFormatter stringFromDate:datenow];
                
                [self.chooseButton3 setTitle:dateString forState:UIControlStateNormal];
                [self.chooseButton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.endDateStr = timeSp;
                UILabel *label = (UILabel *)[self viewWithTag:103];
                label.textColor = [UIColor grayColor];
                
                if (self.resultStr.length > 1 && self.yuanYinStr.length > 1 && self.endDateStr.length > 1) {
                    
                    UIButton *button = (UIButton *)[self viewWithTag:50];
                    button.userInteractionEnabled = YES;
                    button.alpha = 1;
                    
                }

            }else{
                
                [self.chooseButton3 setTitle:timestr forState:UIControlStateNormal];
                [self.chooseButton3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.endDateStr = shijianchuo;
                UILabel *label = (UILabel *)[self viewWithTag:103];
                label.textColor = [UIColor grayColor];
              
                if (self.resultStr.length > 1 && self.yuanYinStr.length > 1 && self.endDateStr.length > 1) {
                    
                    UIButton *button = (UIButton *)[self viewWithTag:50];
                    button.userInteractionEnabled = YES;
                    button.alpha = 1;
                    
                }
                
            }
            
            break;
        default:
            break;
    }
}




-(void)getResultsData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/parameter/item/business/queryValid?type=BP_FOLLOWUPRESULT"];
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    
    [manger GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"---%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dataDict = [dataArray objectAtIndex:i];
                
                NSString *resultName = [dataDict objectForKey:@"name"];
                NSString *resultValue = [dataDict objectForKey:@"value"];
                
                [self.resultNameArray addObject:resultName];
                [self.resultValueArray addObject:resultValue];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}


-(void)getYuanYinData
{
    NSString *yuanYinUrl = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/parameter/item/business/queryValid?type=BP_CLOSERESULT"];
    
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    
    [manger GET:yuanYinUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *yuanYinArray = [responseObject objectForKey:@"data"];
            
            for (int i = 0; i < yuanYinArray.count; i++) {
                
                NSDictionary *dataDict = [yuanYinArray objectAtIndex:i];
                
                NSString *yuanYinName = [dataDict objectForKey:@"name"];
                NSString *yuanYinValue = [dataDict objectForKey:@"value"];
                
                [self.yuanYinNameArray addObject:yuanYinName];
                [self.yuanYinValueArray addObject:yuanYinValue];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

-(void)initCloseView
{
    NSArray *buttonArray = @[@"客户",@"结果",@"原因",@"关闭时间"];

    for (int i = 0; i< buttonArray.count; i++) {
        
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 50*i, 70, 50)];
        titleLabel.text = [buttonArray objectAtIndex:i];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.tag = 100 + i;
        titleLabel.textColor = [UIColor grayColor];

        if (titleLabel.tag == 101 || titleLabel.tag == 102 || titleLabel.tag == 103) {
            
            titleLabel.textColor = [UIColor redColor];
        }
        
        
        titleLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:titleLabel];
        
        CALayer *henglayer = [[CALayer alloc] init];
        henglayer.backgroundColor = RGB(0, 195, 236).CGColor;
        henglayer.frame = CGRectMake(0, 49.5*(i+1), PHONE_UISCREEN_WIDTH, 0.5);
        [self.layer addSublayer:henglayer];

        if (i == 0) {
            UILabel *cusLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame), 50*i, PHONE_UISCREEN_WIDTH - 90, 50)];
            cusLabel.textColor = [UIColor blackColor];
            cusLabel.textAlignment = NSTextAlignmentCenter;
            cusLabel.font = [UIFont systemFontOfSize:14];
            [self addSubview:cusLabel];
            self.cusName = cusLabel;
            
        }else {
        
            UIButton *chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
            chooseButton.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame), 50*i, PHONE_UISCREEN_WIDTH-90, 50);
            [chooseButton setTitle:@"必选项" forState:UIControlStateNormal];
            chooseButton.titleLabel.font = [UIFont systemFontOfSize:14];
            [chooseButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            chooseButton.tag = 10+i;
            [chooseButton addTarget:self action:@selector(chooseButton:) forControlEvents:UIControlEventTouchUpInside];
            chooseButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            [self addSubview:chooseButton];
            
            switch (i) {
                case 1:
                    self.chooseButton1 = chooseButton;
                    break;
                case 2:
                    self.chooseButton2 = chooseButton;
                    break;
                case 3:
                    self.chooseButton3 = chooseButton;
                default:
                    break;
            }

        }
    
    }
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.chooseButton3.frame)+20, PHONE_UISCREEN_WIDTH - 20, 200)];
    textView.backgroundColor = [UIColor whiteColor];
    textView.delegate = self;
    self.contentText = textView;
    [self addSubview:textView];
    
    self.placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 200, 30)];
    self.placeholderLabel.textColor = [UIColor grayColor];
    self.placeholderLabel.font = [UIFont systemFontOfSize:14];
    self.placeholderLabel.text = @"请简要描述您的说明内容";
    self.placeholderLabel.textColor = [UIColor grayColor];
    self.placeholderLabel.hidden = NO;
    self.placeholderLabel.enabled = NO; //label必须设置为不可用
    [textView addSubview:self.placeholderLabel];
    
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(10, CGRectGetMaxY(textView.frame)+40, PHONE_UISCREEN_WIDTH-20, 30);
    [butt addTarget:self action:@selector(clcikQueDingButton:) forControlEvents:UIControlEventTouchUpInside];
    butt.userInteractionEnabled = NO;
    butt.alpha = 0.5;
    butt.tag = 50;
    butt.backgroundColor = RGB(0, 195, 236);
    [butt setTitle:@"确定" forState:UIControlStateNormal];
    [self addSubview:butt];
    
}


#pragma mark  UItextViewDelegate 这个可以用
-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        
        self.placeholderLabel.text = @"请简要描述您的说明内容";
        
    }else{
        
        self.placeholderLabel.text = @"";
        
        if ([textView.text length] > 100) {
            
            textView.text = [textView.text substringToIndex:100];
            [self endEditing:YES];
            [[Session sharedSession].tpView presectLoadingTips:@"超出最大限制"];
        }
    }
}

#pragma mark -- textView点击右下角按钮收起键盘
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

-(void)chooseButton:(UIButton *)button
{
    if (button.tag == 11) {
        
        [self.resultPopView showAlert];
        
        
    }else if (button.tag == 12){
    
        [self.yuanYinPopView showAlert];
       
        
    }else if (button.tag == 13) {
    
        [self.endDatePickerCell showDatapicker];
        
 //        if (self.resultStr.length > 1 && self.yuanYinStr.length > 1 && self.endDateStr.length > 1) {
//            
//            UIButton *button = (UIButton *)[self viewWithTag:50];
//            button.userInteractionEnabled = YES;
//           button.alpha = 1;
//
//        }
    }

}

#pragma mark popViewDelegate
- (void)selectWhichButtonWithTag:(NSInteger)tag popView:(PopupView *)popview
{
    
    
    if (popview.tag == 700) {
        
        [self.chooseButton1 setTitle:[self.resultNameArray objectAtIndex:tag-100] forState:UIControlStateNormal];
        [self.chooseButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.resultStr = [self.resultValueArray objectAtIndex:tag -100];
        UILabel *label = (UILabel *)[self viewWithTag:101];
        label.textColor = [UIColor grayColor];
        
        if (self.resultStr.length > 1 && self.yuanYinStr.length > 1 && self.endDateStr.length > 1) {
            
            UIButton *button = (UIButton *)[self viewWithTag:50];
            button.userInteractionEnabled = YES;
            button.alpha = 1;
            
        }
        
    }else if (popview.tag == 800) {
    
        [self.chooseButton2 setTitle:[self.yuanYinNameArray objectAtIndex:tag-100] forState:UIControlStateNormal];
        [self.chooseButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.yuanYinStr = [self.yuanYinValueArray objectAtIndex:tag -100];
        UILabel *label = (UILabel *)[self viewWithTag:102];
        label.textColor = [UIColor grayColor];

        
        if (self.resultStr.length > 1 && self.yuanYinStr.length > 1 && self.endDateStr.length > 1) {
            
            UIButton *button = (UIButton *)[self viewWithTag:50];
            button.userInteractionEnabled = YES;
            button.alpha = 1;
            
        }
    }
}

-(void)clcikQueDingButton:(UIButton *)button
{
    
    [self.delegate swithButtonCloseClues];
}
@end
