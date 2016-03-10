//
//  PlanFollowView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/22.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "PlanFollowView.h"
#import "AFNetworking.h"
#import "PopupView.h"
#import "DefaultCell.h"

@interface PlanFollowView () <UITextViewDelegate,PopviewDelegate,DefaultDataPickerDelegate>

@property (nonatomic, strong)UILabel *placeholderLabel;

@property (nonatomic, strong)NSMutableArray *resutluArray;
@property (nonatomic, strong)NSMutableArray *resultValueArray;

@property (nonatomic, strong)PopupView *resutluPopView;

@property (nonatomic, strong)DefaultCell *timePickerCell;

@property (nonatomic, strong)DefaultCell *TiXingTimeCell;



@end

@implementation PlanFollowView


-(DefaultCell*)timePickerCell{
    
    if (!_timePickerCell) {
        _timePickerCell = [[DefaultCell alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        _timePickerCell.delegate = self;
        _timePickerCell.whichCell = 1;
    }
    
    return _timePickerCell;
}


-(DefaultCell*)TiXingTimeCell{
    
    if (!_TiXingTimeCell) {
        _TiXingTimeCell = [[DefaultCell alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        _TiXingTimeCell.delegate = self;
        _TiXingTimeCell.whichCell = 2;
    }
    
    return _TiXingTimeCell;
}


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

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        NSArray *titleArray = @[@"结果",@"原因",@"跟进时间",@"预约"];
        
        for (int i = 0; i < titleArray.count; i++) {
           
            
            CALayer *linelayer = [[CALayer alloc]init];
            linelayer.backgroundColor = [[UIColor whiteColor]CGColor];
            linelayer.frame = CGRectMake(0 ,10 + 50*i,PHONE_UISCREEN_WIDTH, 50);
            [self.layer addSublayer:linelayer];
            
            
            UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10+(50*i), 60, 50)];
            titleLabel.tag = 100 + i;
            titleLabel.textAlignment = NSTextAlignmentRight;
            titleLabel.textColor = [UIColor grayColor];

            titleLabel.text = [titleArray objectAtIndex:i];
            if (titleLabel.tag == 100 || titleLabel.tag == 101 || titleLabel.tag == 102) {
                
                titleLabel.textColor = [UIColor redColor];
            }
            
            
            titleLabel.font = [UIFont systemFontOfSize:14];
            [self addSubview:titleLabel];
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame)+10, 10 + (50 * i), PHONE_UISCREEN_WIDTH-100, 50);
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            [btn setTitleColor:RGB(210, 210, 214) forState:UIControlStateNormal];
            btn.titleLabel.textAlignment = NSTextAlignmentLeft;
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [btn addTarget:self action:@selector(swithButtonChoose:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = 1200 + i;
            [self addSubview:btn];
            
            switch (i) {
                case 0:
                    self.resutlusButton = btn;
                    [self.resutlusButton setTitle:@"请选择" forState:UIControlStateNormal];
                    break;
                case 2:
                    self.startTimeButton = btn;
                    [self.startTimeButton setTitle:@"请选择时间" forState:UIControlStateNormal];
                    

                    break;
                case 3:
                    self.tiXingButton = btn;
                    self.tiXingButton.userInteractionEnabled = NO;

                    
                    break;
                default:
                    break;
            }
            
            
            if (i == 1) {
                
                UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame)+10, 10+(50*i), PHONE_UISCREEN_WIDTH-100, 50)];
                [textfield addTarget:self action:@selector(textContentChange:) forControlEvents:UIControlEventEditingChanged];
                textfield.font = [UIFont systemFontOfSize:14];
                self.yuanYinContent = textfield;
                textfield.placeholder = @"请输入";
                [self addSubview:textfield];
                
            }else if (i == 3) {
            
                UIButton *checkBox = [UIButton buttonWithType:UIButtonTypeCustom];
                checkBox.selected = NO;  // 默认勾选分享按钮
                [checkBox setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                checkBox.frame = CGRectMake(0, 25+(50*i), 20, 20);
                [checkBox setImage:[UIImage imageWithName:@"new_feature_share_false"] forState:UIControlStateNormal];
                [checkBox setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateSelected];
                [checkBox addTarget:self action:@selector(checkClcik:) forControlEvents:UIControlEventTouchUpInside];
                self.statusButton = checkBox;
                [self addSubview:checkBox];
            
            }
            
            if (i < 4) {
                
                CALayer *linelayer = [[CALayer alloc]init];
                linelayer.backgroundColor = LINE_COLOR.CGColor;
                linelayer.frame = CGRectMake(0 ,10 + 49.5*i,PHONE_UISCREEN_WIDTH, 0.5);
                [self.layer addSublayer:linelayer];
                
            }
        }
        
        UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0,50*4+20, PHONE_UISCREEN_WIDTH, 150)];
        textView.delegate = self;
        textView.scrollEnabled = YES;    //当文字超过视图的边框时是否允许滑动，默认为“YES”
        textView.backgroundColor = [UIColor whiteColor];
        [self addSubview:textView];
        self.textVIew = textView;

        
        self.placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(5,0, 200, 30)];
        self.placeholderLabel.textColor = [UIColor grayColor];
        self.placeholderLabel.font = [UIFont systemFontOfSize:14];
        self.placeholderLabel.text = @"请简要描述您的说明内容";
        self.placeholderLabel.textColor = [UIColor grayColor];
        self.placeholderLabel.hidden = NO;
        self.placeholderLabel.enabled = NO; //label必须设置为不可用
        [textView addSubview:self.placeholderLabel];

        
        UIButton *postButton = [UIButton buttonWithType:UIButtonTypeCustom];
        postButton.backgroundColor = NAV_COLOR;
        [postButton setTitle:@"确定" forState:UIControlStateNormal];
        postButton.frame = CGRectMake(0, CGRectGetMaxY(textView.frame)+20, PHONE_UISCREEN_WIDTH, 30);
        [postButton addTarget:self action:@selector(ciclkButtonFollowPlan:) forControlEvents:UIControlEventTouchUpInside];
        postButton.alpha = 0.5;
        postButton.tag = 1;
        postButton.userInteractionEnabled = NO;
        [self addSubview:postButton];
        
        // 获取结果数据
        [self getReustusData];
    }
    return self;
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

-(void)textContentChange:(UITextField *)textField
{
    
    
    if (textField.text.length > 1) {
        
        UILabel *label = (UILabel *)[self viewWithTag:101];
        label.textColor = [UIColor grayColor];
        
        if (self.resultValue.length > 1 && self.startTimeStr.length > 1 && self.yuanYinContent.text.length > 1) {
            
            UIButton *button = (UIButton *)[self viewWithTag:1];
            button.userInteractionEnabled = YES;
            button.alpha = 1;
        }
        
    }else {
        
        UILabel *label = (UILabel *)[self viewWithTag:101];
        label.textColor = [UIColor redColor];
        
        UIButton *button = (UIButton *)[self viewWithTag:1];
        button.userInteractionEnabled = NO;
        button.alpha = 0.5;
        
    }

}


#pragma mark  UItextViewDelegate 这个可以用
-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        
        self.placeholderLabel.text = @"请简要描述您的说明内容";
        
    }else{
        
        self.placeholderLabel.text = @"";
        
        if ([textView.text length] > 500) {
            
            textView.text = [textView.text substringToIndex:500];
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



-(void)swithButtonChoose:(UIButton *)button
{
    [self endEditing:YES];
    
    if (button.tag == 1200) {
        
        [self.resutluPopView showAlert];
        
    }else if (button.tag == 1202){
    
        [self.timePickerCell showDatapicker];
        
    }else{
    
        [self.TiXingTimeCell showDatapicker];
    }
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
                
                [self.startTimeButton setTitle:dateString forState:UIControlStateNormal];
                [self.startTimeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.startTimeStr = timeSp;
                
                if (self.resultValue.length > 1 && self.startTimeStr.length > 1 && self.yuanYinContent.text.length > 1) {
                    
                    UIButton *button = (UIButton *)[self viewWithTag:1];
                    button.userInteractionEnabled = YES;
                    button.alpha = 1;
                }
                
                if (self.startTimeStr.length > 1) {
                    
                    UILabel *label = (UILabel *)[self viewWithTag:102];
                    label.textColor = [UIColor grayColor];
                }else{
                    
                    UILabel *label = (UILabel *)[self viewWithTag:102];
                    label.textColor = [UIColor redColor];
                }
                
            }else{
                
                
                if (self.resultValue.length > 1 && self.startTimeStr.length > 1 && self.yuanYinContent.text.length > 1) {
                    
                    UIButton *button = (UIButton *)[self viewWithTag:1];
                    button.userInteractionEnabled = YES;
                    button.alpha = 1;
                }
                
                [self.startTimeButton setTitle:timestr forState:UIControlStateNormal];
                [self.startTimeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.startTimeStr = shijianchuo;
                
                if (self.startTimeStr.length > 1) {
                    
                    UILabel *label = (UILabel *)[self viewWithTag:102];
                    label.textColor = [UIColor grayColor];
                }else{
                    
                    UILabel *label = (UILabel *)[self viewWithTag:102];
                    label.textColor = [UIColor redColor];
                }
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
                
                [self.tiXingButton setTitle:dateString forState:UIControlStateNormal];
                [self.tiXingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.tiXingTimeStr = timeSp;
                
            }else{
                
                [self.tiXingButton setTitle:timestr forState:UIControlStateNormal];
                [self.tiXingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                self.tiXingTimeStr = shijianchuo;
            }
            
            break;

        default:
            break;
    }
}



- (void)selectWhichButtonWithTag:(NSInteger )tag popView:(PopupView *)popview
{
    if (popview.tag == 110) {
        
        [self.resutlusButton setTitle:[self.resutluArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.resutlusButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.resultValue = [self.resultValueArray objectAtIndex:tag - 100];
        
        UILabel *label = (UILabel *)[self viewWithTag:100];
        label.textColor = [UIColor grayColor];
        
        if (self.resultValue.length > 1 && self.startTimeStr.length > 1 && self.yuanYinContent.text.length > 1) {
            
            UIButton *button = (UIButton *)[self viewWithTag:1];
            button.userInteractionEnabled = YES;
            button.alpha = 1;
        }

    }

}

-(void)ciclkButtonFollowPlan:(UIButton *)button
{
    [self.delegate swithButtonFollowPlan];
}

-(void)checkClcik:(UIButton *)button
{
    button.selected =! button.isSelected;
    
    if (button.selected == YES) {
        
        [self.tiXingButton setTitle:@"请选择提醒时间" forState:UIControlStateNormal];
        
        self.tiXingButton.userInteractionEnabled = YES;

    }else {
    
        self.tiXingButton.userInteractionEnabled = NO;
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
    return YES;
}

@end
