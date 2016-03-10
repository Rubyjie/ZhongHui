//
//  ContractSearchView.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/4.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "ContractSearchView.h"
#import "PopupView.h"

#import "AFNetworking.h"
#import "UserDefault.h"


@interface ContractSearchView () <PopviewDelegate,UITextFieldDelegate>

@property (nonatomic, strong)PopupView *headPopView;

@property (nonatomic, strong)PopupView *statusPopVIew;
@property (nonatomic, strong)NSMutableArray *statusArray;
@property (nonatomic, strong)NSMutableArray *statusValueArray;


@property (nonatomic, strong)PopupView *contactWayPopView;
@property (nonatomic, strong)NSMutableArray *contactWayArray;
@property (nonatomic, strong)NSMutableArray *contactValueArray;


@property (nonatomic, strong)PopupView *sexPopView;
@property (nonatomic, strong)NSMutableArray *sexArray;
@property (nonatomic, strong)NSMutableArray *sexValueArray;




@end

@implementation ContractSearchView
-(PopupView *)sexPopView
{
    if (!_sexPopView) {
        
        _sexPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.sexArray];
        _sexPopView.delegate = self;
        _sexPopView.tag = 700;
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





-(PopupView *)contactWayPopView
{
    if (!_contactWayPopView) {
        
        _contactWayPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.contactWayArray];
        _contactWayPopView.delegate = self;
        _contactWayPopView.tag = 600;
    }
    return _contactWayPopView;
}

-(NSMutableArray *)contactWayArray
{
    if (!_contactWayArray) {
        
        _contactWayArray = [NSMutableArray array];
    }
    return _contactWayArray;
}

-(NSMutableArray *)contactValueArray
{
    if (!_contactValueArray) {
        
        _contactValueArray = [NSMutableArray array];
    }
    return _contactValueArray;
}


-(NSMutableArray *)statusArray {

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

-(PopupView *)statusPopVIew
{
    if (!_statusPopVIew) {
        
        _statusPopVIew = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.statusArray];
        _statusPopVIew.delegate = self;
        _statusPopVIew.tag = 500;
    }
    return _statusPopVIew;
}


-(void)getStateData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"/base/parameter/item/system/queryValid?type=SP_CON_STATUS"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *stateName = [dict objectForKey:@"name"];
                NSString *stateValue = [dict objectForKey:@"value"];
                [self.statusArray addObject:stateName];
                [self.statusValueArray addObject:stateValue];
            }
            
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
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
        
        [self initContractSearchViews];
        
        self.cusStr = @"";
        
        [self getStateData];
        
        // 获取联络方式的数据
        [self getContractWayData];
        
        // 获取性别
        [self getSexData];
    }
    return self;
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



-(void)getContractWayData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"/base/parameter/item/business/queryValid?type=BP_CONTACTMAN"];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"---%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *wayName = [dict objectForKey:@"name"];
                NSString *wayValue = [dict objectForKey:@"value"];
                [self.contactWayArray addObject:wayName];
                [self.contactValueArray addObject:wayValue];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];


}

-(void)initContractSearchViews
{
    NSArray *SearchTitleArray = @[@"姓名",@"职位",@"部门",@"直属上级",@"所属客户",@"状态",@"负责人",@"联络方式",@"性别",@"办公电话",@"电话区号",@"电话分机号",@"手机",@"email",@"传真",@"传真区号",@"传真分机号",@"QQ",@"微信",@"地址"];
    
    for (int i = 0; i < SearchTitleArray.count; i++) {
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 50*i, 80, 50)];
        titleLabel.text = [SearchTitleArray objectAtIndex:i];
        titleLabel.textColor = [UIColor grayColor];
        titleLabel.textAlignment = NSTextAlignmentRight;
        titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:titleLabel];
        
        CALayer *linelayer = [[CALayer alloc]init];
        linelayer.backgroundColor = LINE_COLOR.CGColor;
        linelayer.frame = CGRectMake(0 ,49.5*(i+1),PHONE_UISCREEN_WIDTH, 0.5);
        [self.layer addSublayer:linelayer];

        
        if (i == 0 || i == 1 || i == 2 || i == 3 || i == 9 || i == 10 || i == 11 || i == 12 || i == 13 || i == 14 || i == 15 || i == 16 || i == 17 || i == 18 || i == 19)  {
            

            UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame)+10, 50*i, PHONE_UISCREEN_WIDTH-100, 50)];
            textField.delegate = self;
            textField.tag = 200+i;
            [textField addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
            textField.placeholder = @"请输入";
            textField.font = [UIFont systemFontOfSize:15];
            [self addSubview:textField];

            
            switch (i) {
                case 0:
                    self.nameText = textField;
                    break;
                case 1:
                    self.zhiWeiText = textField;
                    break;
                case 2:
                    self.buMenText = textField;
                    break;
                case 3:
                    self.superiorText = textField;
                    break;
                case 9:
                    self.phoneNum = textField;
                    self.phoneNum.placeholder = @"请输入电话(最大8位)";
                    self.phoneNum.keyboardType = UIKeyboardTypeNumberPad;
                    break;
                case 10:
                    self.phoneAreaNum = textField;
                    self.phoneAreaNum.placeholder = @"请输入区号(最大4位)";
                    self.phoneAreaNum.keyboardType = UIKeyboardTypeNumberPad;

                    break;
                case 11:
                    self.phoneExtensionNum = textField;
                    self.phoneExtensionNum.placeholder = @"请输入分机号(最大4位)";
                    self.phoneExtensionNum.keyboardType = UIKeyboardTypeNumberPad;

                    break;
                case 12:
                    self.mobile = textField;
                    self.mobile.placeholder = @"请输入手机号(最大11位)";
                    self.mobile.keyboardType = UIKeyboardTypeNumberPad;

                    break;
                case 13:
                    self.email = textField;
                    self.email.keyboardType = UIKeyboardTypeEmailAddress;
                    break;
                case 14:
                    self.faxNum = textField;
                    self.faxNum.placeholder = @"请输入传真号(最大8位)";
                    self.faxNum.keyboardType = UIKeyboardTypeNumberPad;

                    break;
                    
                case 15:
                    self.faxAreaNum = textField;
                    self.faxAreaNum.placeholder = @"请输入传真区号(最大4位)";
                    self.faxAreaNum.keyboardType = UIKeyboardTypeNumberPad;

                    break;
                case 16:
                    self.faxExtensionNum = textField;
                    self.faxExtensionNum.placeholder = @"请输入传真分机号(最大4位)";
                    self.faxExtensionNum.keyboardType = UIKeyboardTypeNumberPad;

                    break;
                    
                case 17:
                    self.qqText = textField;
                    break;
                case 18:
                    self.weatchText = textField;
                    break;
                case 19:
                    self.addressText = textField;
                    break;

                default:
                    break;
            }

        }else if (i == 4 || i == 5 || i == 6 || i == 7 || i == 8) {
        
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame)+10, 50*i, PHONE_UISCREEN_WIDTH-100, 50);
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            button.tag = 10+i;
            [button addTarget:self action:@selector(chooseButton:) forControlEvents:UIControlEventTouchUpInside];
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [button setTitle:@"请选择" forState:UIControlStateNormal];
            [self addSubview:button];
            switch (i) {
                case 4:
                    self.customerButton = button;
                    break;
                case 5:
                    self.statusButton = button;
                    break;
                case 6:
                    self.headButton = button;
                    break;
                case 7:
                    self.contactWayButton = button;
                    break;
                case 8:
                    self.sexButton = button;
                    break;
                default:
                    break;
            }
        
        }
    
    }
}

-(void)textChange:(UITextField *)textField
{
    if (textField.tag == 209 || textField.tag == 214) {
        
        if (textField.text.length > 8) {
            
            [[Session sharedSession].tpView presentMessageTips:@"已超过最大限制"];
            textField.text = [textField.text substringToIndex:8];

        }
    }else if (textField.tag == 210 || textField.tag == 211 || textField.tag == 215 || textField.tag == 216) {
    
        if (textField.text.length > 4) {
            
            [[Session sharedSession].tpView presentMessageTips:@"已超过最大限制"];
            textField.text = [textField.text substringToIndex:4];

        }
    
    }else if (textField.tag == 212) {
        
        if (textField.text.length > 11) {
            
            [[Session sharedSession].tpView presentMessageTips:@"已超过最大限制"];
            textField.text = [textField.text substringToIndex:11];
        }
    
    }

}

-(void)chooseButton:(UIButton *)button
{
    [self endEditing:YES];
    
    if (button.tag == 14) {

        [self.delegate selectedButtonChooseCustomerNameWithTag:button.tag];
        
    }else if (button.tag == 16) {
    
        [self.headPopView showAlert];
        
    }else if (button.tag == 15) {
    
        [self.statusPopVIew showAlert];
        
    }else if (button.tag == 17) {
    
        [self.contactWayPopView showAlert];
        
    }else if (button.tag == 18) {
    
        [self.sexPopView showAlert];
    }

}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)selectWhichButtonWithTag:(NSInteger )tag popView:(PopupView *)popview
{
    if (popview.tag == 400) {
        
        [self.headButton setTitle:[[Session sharedSession].headNameArray objectAtIndex:tag- 100] forState:UIControlStateNormal];
        [self.headButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        self.headId = [[Session sharedSession].headIdArray objectAtIndex:tag - 100];
        
    }else if (popview.tag == 500) {
    
        [self.statusButton setTitle:[self.statusArray objectAtIndex:tag- 100] forState:UIControlStateNormal];
        [self.statusButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
        self.statusValues = [self.statusValueArray objectAtIndex:tag - 100];
        
    }else if (popview.tag == 600) {
    
        [self.contactWayButton setTitle:[self.contactWayArray objectAtIndex:tag- 100] forState:UIControlStateNormal];
        [self.contactWayButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.contactWayValue = [self.contactValueArray objectAtIndex:tag - 100];
        
    
    }else if (popview.tag == 700) {
    
        [self.sexButton setTitle:[self.sexArray objectAtIndex:tag- 100] forState:UIControlStateNormal];
        [self.sexButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.sexValue = [self.sexValueArray objectAtIndex:tag - 100];
    
    }

}

@end
