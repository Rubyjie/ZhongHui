//
//  AddContractView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/25.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "AddContractView.h"
#import "AFNetworking.h"
#import "PopupView.h"

#import "UserDefault.h"

@interface AddContractView () <PopviewDelegate,UITextViewDelegate,UITextFieldDelegate>

@property (nonatomic, strong)PopupView *statusPopView;
@property (nonatomic, strong)NSMutableArray *statusNameArray;
@property (nonatomic, strong)NSMutableArray *statusValueArray;

@property (nonatomic, strong)PopupView *headPopView;


@property (nonatomic, strong)PopupView *sexPopView;
@property (nonatomic, strong)NSMutableArray *sexArray;
@property (nonatomic, strong)NSMutableArray *sexValueArray;

#pragma mark - 角色关系
@property (nonatomic, strong)PopupView *relationPopView;
@property (nonatomic, strong)NSMutableArray *relatNameArray;
@property (nonatomic, strong)NSMutableArray *relatValueArray;

#pragma mark - 亲密程度
@property (nonatomic, strong)PopupView *qinMiSizePopView;
@property (nonatomic, strong)NSMutableArray *qinMiNameArray;
@property (nonatomic, strong)NSMutableArray *qinMiValueArray;


@end

@implementation AddContractView
-(PopupView *)qinMiSizePopView
{
    if (!_qinMiSizePopView) {
        
        _qinMiSizePopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.qinMiNameArray];
        _qinMiSizePopView.delegate = self;
        _qinMiSizePopView.tag = 500;
    }
    return _qinMiSizePopView;
}

-(NSMutableArray *)qinMiNameArray
{
    if (!_qinMiNameArray) {
        
        _qinMiNameArray = [NSMutableArray array];
    }
    return _qinMiNameArray;
}

-(NSMutableArray *)qinMiValueArray
{
    if (!_qinMiValueArray) {
        
        _qinMiValueArray = [NSMutableArray array];
    }
    return _qinMiValueArray;
}




-(PopupView *)relationPopView
{
    if (!_relationPopView) {
        
        _relationPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.relatNameArray];
        _relationPopView.delegate = self;
        _relationPopView.tag = 400;
    }
    return _relationPopView;
}

-(NSMutableArray *)relatNameArray
{
    if (!_relatNameArray) {
        
        _relatNameArray = [NSMutableArray array];
    }
    return _relatNameArray;
}

-(NSMutableArray *)relatValueArray
{
    if (!_relatValueArray) {
        
        _relatValueArray = [NSMutableArray array];
    }
    return _relatValueArray;
}



-(PopupView *)sexPopView
{
    if (!_sexPopView) {
        
        _sexPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.sexArray];
        _sexPopView.delegate = self;
        _sexPopView.tag = 300;
    }
    return _sexPopView;
}

-(NSMutableArray *)sexArray
{
    if (!_sexArray) {
        
        _sexArray = [NSMutableArray array];
    }
    return _sexArray;
}

-(NSMutableArray *)sexValueArray
{
    if (!_sexValueArray) {
        
        _sexValueArray = [NSMutableArray array];
    }
    return _sexValueArray;
}


-(PopupView *)statusPopView
{
    if (!_statusPopView) {
        
        _statusPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.statusNameArray];
        _statusPopView.delegate = self;
        _statusPopView.tag = 100;
    }
    return _statusPopView;
}

-(NSMutableArray *)statusNameArray
{
    if (!_statusNameArray) {
        
        _statusNameArray = [NSMutableArray array];
    }
    return _statusNameArray;
}

-(NSMutableArray *)statusValueArray
{
    if (!_statusValueArray) {
        
        _statusValueArray = [NSMutableArray array];
    }
    return _statusValueArray;
}


-(PopupView *)headPopView
{
    if (!_headPopView) {
        
        _headPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:[Session sharedSession].headNameArray];
        _headPopView.delegate = self;
        _headPopView.tag = 200;
    }
    return _headPopView;
}


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initAddContractView];
        
        
        // 获取联系人状态数据
        [self getContractStatusData];
        
        
        // 获取性别数据
        [self getSexData];
        
        // 获取角色关系
        [self getRelationshipData];
        
        // 获取亲密程度
        [self getQinMiSizeData];

        
    }
    return self;
}

-(void)getQinMiSizeData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/parameter/item/business/queryValid?type=BP_INTIMATE_DEGREE"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *qinMiName = [dict objectForKey:@"name"];
                NSString *qinMiValue = [dict objectForKey:@"value"];
                [self.qinMiNameArray addObject:qinMiName];
                [self.qinMiValueArray addObject:qinMiValue];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];


}


-(void)getRelationshipData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/parameter/item/business/queryValid?type=BP_CONT_ROLE_TYPE"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *relatName = [dict objectForKey:@"name"];
                NSString *relatValue = [dict objectForKey:@"value"];
                [self.relatNameArray addObject:relatName];
                [self.relatValueArray addObject:relatValue];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}

-(void)getSexData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/parameter/item/business/queryValid?type=BP_SEX"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *sexName = [dict objectForKey:@"name"];
                NSString *sexValue = [dict objectForKey:@"value"];
                
                [self.sexArray addObject:sexName];
                [self.sexValueArray addObject:sexValue];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}




-(void)getContractStatusData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/parameter/item/system/queryValid?type=SP_CON_STATUS"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"---%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *statusName = [dict objectForKey:@"name"];
                NSString *statusValue = [dict objectForKey:@"value"];
                [self.statusNameArray addObject:statusName];
                [self.statusValueArray addObject:statusValue];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}


-(void)initAddContractView
{
    
    NSArray *textArray = @[@"姓名",@"职位",@"部门",@"直属上级",@"所属客户",@"负责业务",@"办公电话",@"电话区号",@"电话分机号",@"手机",@"Email",@"传真",@"传真区号",@"传真分机号",@"QQ",@"微信",@"角色关系",@"亲密程度",@"性别",@"备注",@"地址",@"状态",@"负责人"];

    for (int i = 0; i < textArray.count; i++) {
        
        
        UILabel *firstLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, (50*i), 80, 50)];
        firstLabel.textColor = [UIColor grayColor];
        firstLabel.textAlignment = NSTextAlignmentRight;
        firstLabel.font = [UIFont systemFontOfSize:14];
        firstLabel.tag = 1000 + i;
        if (firstLabel.tag == 1000 || firstLabel.tag == 1004 || firstLabel.tag == 1009 || firstLabel.tag == 1021) {
            
            firstLabel.textColor = [UIColor redColor];
        }
        
        firstLabel.text = [textArray objectAtIndex:i];
        [self addSubview:firstLabel];
    
        
        CALayer *henglayer = [[CALayer alloc] init];
        henglayer.backgroundColor = RGB(0, 195, 236).CGColor;
        henglayer.frame = CGRectMake(0, 49.5*(i+1), PHONE_UISCREEN_WIDTH, 0.5);
        [self.layer addSublayer:henglayer];

        if (i == 4 || i == 16 || i == 17 || i == 18 || i == 21 || i == 22) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(CGRectGetMaxX(firstLabel.frame)+20, (50*i), PHONE_UISCREEN_WIDTH-100, 50);
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [button addTarget:self action:@selector(chooseButtonClcik:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:@"请选择" forState:UIControlStateNormal];
            button.tag = 10+i;
            [self addSubview:button];
            
            switch (i) {
                case 4:
                    self.customerButton = button;
                    break;
                    
                case 16:
                    self.relatButton = button;
                    break;
                case 17:
                    self.qinMiButton = button;
                    break;
                case 18:
                    self.sexButton = button;
                    break;
                case 21:
                    self.statusButton = button;
                    break;
                case 22:
                    self.headButton = button;
                    [self.headButton setTitle:[UserDefault getDataObjectForKey:@"logInName"] forState:UIControlStateNormal];
                    [self.headButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    break;
                default:
                    break;
            }
            
        }else if (i == 19 || i == 20) {
        
            UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(firstLabel.frame)+20, (50*i), PHONE_UISCREEN_WIDTH - 100, 40)];
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
                case 19:
                    self.beiZhuText = textView;
                    break;
                case 20:
                    self.addressText = textView;
                    break;
                default:
                    break;
            }
        
        
        } else {
        
            UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(firstLabel.frame)+20, (50*i), PHONE_UISCREEN_WIDTH-100, 50)];
            textField.tag = 110+i;
            textField.delegate = self;
            [textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

            textField.textColor = [UIColor blackColor];
            textField.placeholder = @"请输入";
            textField.font = [UIFont systemFontOfSize:14];
            [self addSubview:textField];

            switch (i) {
                case 0:
                    textField.placeholder = @"必填项";
                    self.contentText1 = textField;
                    
                    break;
                case 1:
                    self.contentText2 = textField;
                    break;
                case 2:
                    self.contentText3 = textField;
                    break;
                case 3:
                    self.contentText4 = textField;
                    break;

                case 5:
                    self.contentText6 = textField;
                    break;
                case 6:
                    self.contentText7 = textField;
                    textField.placeholder = @"请输入(最大8位)";
                    textField.keyboardType = UIKeyboardTypeNumberPad;
                    break;
                case 7:
                    self.contentText8 = textField;
                    textField.placeholder = @"请输入(最大4位)";
                    textField.keyboardType = UIKeyboardTypeNumberPad;

                    break;
                case 8:
                    self.contentText9 = textField;
                    textField.placeholder = @"请输入(最大4位)";
                    textField.keyboardType = UIKeyboardTypeNumberPad;

                    break;
                case 9:
                    textField.placeholder = @"必填项";
                    self.contentText10 = textField;
                    textField.keyboardType = UIKeyboardTypeNumberPad;
                    break;
                    
                case 10:
                    self.contentText11 = textField;
                    self.contentText11.keyboardType = UIKeyboardTypeEmailAddress;
                    break;
                case 11:
                    textField.placeholder = @"请输入(最大8位)";
                    self.contentText12 = textField;
                    textField.keyboardType = UIKeyboardTypeNumberPad;
                    break;
                    
                case 12:
                    textField.placeholder = @"请输入(最大4位)";
                    self.contentText13 = textField;
                    textField.keyboardType = UIKeyboardTypeNumberPad;
                    break;
                    
                case 13:
                    textField.placeholder = @"请输入(最大4位)";
                    self.contentText14 = textField;
                    textField.keyboardType = UIKeyboardTypeNumberPad;

                    break;
                case 14:
                    self.contentText15 = textField;
                    break;
                case 15:
                    self.contentText16 = textField;
                    break;
                default:
                    break;
            }
        }
    }
}

-(void)chooseButtonClcik:(UIButton *)button
{
    [self endEditing:YES];
    
    if (button.tag == 14) {
        
        [self.delegate selectedButtonChooseCustomerWithTag:button.tag];
        
        UILabel *label = (UILabel *)[self viewWithTag:1004];
        label.textColor = [UIColor grayColor];
        
    }else if (button.tag == 27) {
    
        [self.qinMiSizePopView showAlert];
        
    }else if (button.tag == 31) {
    
        [self.statusPopView showAlert];
        
    }else if (button.tag == 26) {
    
        [self.relationPopView showAlert];
    
    }else if (button.tag == 28) {
    
        [self.sexPopView showAlert];
        
    }else if (button.tag == 32) {
    
        [self.headPopView showAlert];
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


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


-(void)textFieldDidChange:(UITextField *)textField
{

    if (textField.tag == 110) {
        
        if (textField.text.length > 1) {
            
            UILabel *label = (UILabel *)[self viewWithTag:1000];
            label.textColor = [UIColor grayColor];

        }else{
            
            UILabel *label = (UILabel *)[self viewWithTag:1000];
            label.textColor = [UIColor redColor];
        }
    }
    
    if (textField.tag == 119) {
        
        if (textField.text.length > 1) {
            
            // 手机号
            UILabel *label1 = (UILabel *)[self viewWithTag:1009];
            label1.textColor = [UIColor grayColor];
        }else{
        
            // 手机号
            UILabel *label1 = (UILabel *)[self viewWithTag:1009];
            label1.textColor = [UIColor redColor];

        }
        
        
        if (textField.text.length > 11) {
            
            [[Session sharedSession].tpView presentMessageTips:@"已超过最大限制"];
            
            textField.text = [textField.text substringToIndex:11];
            
        }
    }
    
    if (textField.tag == 116 || textField.tag == 121) {
        
        if (textField.text.length > 8) {
            
            [[Session sharedSession].tpView presentMessageTips:@"已超过最大限制"];

            textField.text = [textField.text substringToIndex:8];
        }
        
    }else if (textField.tag == 117 || textField.tag == 118 || textField.tag == 122 || textField.tag == 123) {
        
        if (textField.text.length > 4) {
            
            [[Session sharedSession].tpView presentMessageTips:@"已超过最大限制"];
            
            textField.text = [textField.text substringToIndex:4];
        }

    }
}


#pragma mark - PopviewDelegate
-(void)selectWhichButtonWithTag:(NSInteger)tag popView:(PopupView *)popview
{
    if (popview.tag == 100) {
        
        [self.statusButton setTitle:[self.statusNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.statusButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.statusValue = [self.statusValueArray objectAtIndex:tag - 100];
        
        UILabel *label = (UILabel *)[self viewWithTag:1021];
        label.textColor = [UIColor grayColor];
        
    }else if (popview.tag == 200) {
    
        [self.headButton setTitle:[[Session sharedSession].headNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.headButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    }else if (popview.tag == 300) {
    
        [self.sexButton setTitle:[self.sexArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.sexButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.sexValue = [self.sexValueArray objectAtIndex:tag - 100];

    
    }else if (popview.tag == 400) {
    
        [self.relatButton setTitle:[self.relatNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.relatButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.relatValue = [self.relatValueArray objectAtIndex:tag - 100];

    
    }else if (popview.tag == 500) {
    
        
        [self.qinMiButton setTitle:[self.qinMiNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.qinMiButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.qinMiValue = [self.qinMiValueArray objectAtIndex:tag - 100];

    }

}

@end
