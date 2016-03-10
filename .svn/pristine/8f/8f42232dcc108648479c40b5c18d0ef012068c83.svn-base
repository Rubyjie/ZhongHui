//
//  ChangeConController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/8.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "ChangeConController.h"
#import "ChooseCustomerController.h"
#import "TPKeyboardAvoidingScrollView.h"


#import "AddContractView.h"

#import "AFNetworking.h"

#import "myContractBaseClass.h"
#import "myContractData.h"


@interface ChangeConController () <addContractButtonDelegate,popCustomerViewDelegate>

@property (nonatomic, strong)UIScrollView *scroll;
@property (nonatomic, strong)myContractBaseClass *conDeails;

@property (nonatomic, strong)AddContractView *changeConVIew;

@end

@implementation ChangeConController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)selectedButtonChooseCustomerWithTag:(NSInteger)tag
{
    if (tag == 14) {
        
        ChooseCustomerController *chooseCusName = [[ChooseCustomerController alloc]init];
        chooseCusName.delegate = self;
        [self.navigationController pushViewController:chooseCusName animated:YES];
    }
}

#pragma mark - popCustomerViewDelegate选好客户后返回的代理
-(void)popCustomerAddCluesWithName:(NSString *)name cusId:(NSString *)cusId cusLevel:(NSString *)cusLevel type:(NSString *)type jiTuan:(NSString *)jiTuan userXZ:(NSString *)userXZ address:(NSString *)address jyXZ:(NSString *)jyXZ postCode:(NSString *)postCode openTime:(NSString *)openTime
{
    [self.changeConVIew.customerButton setTitle:name forState:UIControlStateNormal];
    [self.changeConVIew.customerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    
    self.title = @"修改联系人";
    self.view.backgroundColor = [UIColor whiteColor];
    self.changeConVIew = [[AddContractView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 23*50+64)];
    
    
    UILabel *label1 = (UILabel *)[self.changeConVIew viewWithTag:1000];
    label1.textColor = [UIColor grayColor];
    
    UILabel *label2 = (UILabel *)[self.changeConVIew viewWithTag:1004];
    label2.textColor = [UIColor grayColor];
    
    UILabel *label3 = (UILabel *)[self.changeConVIew viewWithTag:1009];
    label3.textColor = [UIColor grayColor];
    
    UILabel *label4 = (UILabel *)[self.changeConVIew viewWithTag:1021];
    label4.textColor = [UIColor grayColor];


    
    self.changeConVIew.delegate = self;
    
    self.scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH,PHONE_UISCREEN_HEIGHT)];
    self.scroll.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, 23*50+64);
    [self.view addSubview:self.scroll];
    [self.scroll addSubview:self.changeConVIew];
    
    [self getContractDeailsData];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(changeSaveCon)];
}


#pragma mark 键盘将要出来
-(void)keyboardWillShow:(NSNotification*)notification{
    
    NSDictionary *info=[notification userInfo];
    //获取键盘高度
    CGSize kbSize=[[info objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue].size;
    
    [UIView animateWithDuration:0.25f animations:^{
        
        self.scroll.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-kbSize.height-64);
        self.scroll.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, 23*50);
        
    }completion:^(BOOL finished) {
        
    }];
}

#pragma mark 键盘将要隐藏
-(void)keyboardWillHidden:(NSNotification*)notification{
    [UIView animateWithDuration:0.25f animations:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            self.scroll.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT);
            self.scroll.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, 23*50+64);

        });
    }completion:^(BOOL finished) {
        
    }];
}


-(void)getContractDeailsData
{
    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"customer/contactMan/get"];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *dict = @{@"id":self.conId};
    
    [manager GET:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        self.conDeails = [[myContractBaseClass alloc]initWithDictionary:responseObject];
        

        if (self.conDeails.success) {
            
            self.changeConVIew.contentText1.text = self.conDeails.data.conName;
            self.changeConVIew.contentText2.text = self.conDeails.data.postionCode;
            self.changeConVIew.contentText3.text = self.conDeails.data.departmentId;
            self.changeConVIew.contentText4.text = self.conDeails.data.parentPart;
            [self.changeConVIew.customerButton setTitle:self.conDeails.data.cusName forState:UIControlStateNormal];
            [self.changeConVIew.customerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            self.changeConVIew.contentText6.text = self.conDeails.data.inchargeofBusi;
            self.changeConVIew.contentText7.text = self.conDeails.data.offtelNumber;
            self.changeConVIew.contentText8.text = self.conDeails.data.offtelAreaCode;
            self.changeConVIew.contentText9.text = self.conDeails.data.offtelExtension;
            self.changeConVIew.contentText10.text = self.conDeails.data.mobile;
            self.changeConVIew.contentText11.text = self.conDeails.data.email;
            self.changeConVIew.contentText12.text = self.conDeails.data.offtelNumber;
            self.changeConVIew.contentText13.text = self.conDeails.data.faxAreacode;
            self.changeConVIew.contentText14.text = self.conDeails.data.faxExtension;
            self.changeConVIew.contentText15.text = self.conDeails.data.qq;
            self.changeConVIew.contentText16.text = self.conDeails.data.wechatNumber;
            self.changeConVIew.beiZhuText.text = self.conDeails.data.dataDescription;
            self.changeConVIew.addressText.text = self.conDeails.data.regionAddr;
            [self.changeConVIew.relatButton setTitle:self.conDeails.data.contRoleTypeName forState:UIControlStateNormal];
            [self.changeConVIew.qinMiButton setTitle:self.conDeails.data.imtimateDegreeName forState:UIControlStateNormal];
            [self.changeConVIew.sexButton setTitle:self.conDeails.data.sexCodeName forState:UIControlStateNormal];
            [self.changeConVIew.sexButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

            [self.changeConVIew.statusButton setTitle:self.conDeails.data.statusName forState:UIControlStateNormal];
            [self.changeConVIew.statusButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            
            if ([self.changeConVIew.relatButton.currentTitle isEqualToString:self.conDeails.data.contRoleTypeName]) {
                
                [self.changeConVIew.relatButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                
            }else {
                
                [self.changeConVIew.relatButton setTitle:@"请选择" forState:UIControlStateNormal];
            }
            
            if ([self.changeConVIew.qinMiButton.currentTitle isEqualToString:self.conDeails.data.imtimateDegreeName]) {
                
                [self.changeConVIew.qinMiButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                
            }else {
                
                [self.changeConVIew.qinMiButton setTitle:@"请选择" forState:UIControlStateNormal];
            }
            
            if ([self.changeConVIew.sexButton.currentTitle isEqualToString:self.conDeails.data.sexCodeName]) {
                
                [self.changeConVIew.sexButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                
            }else {
                
                [self.changeConVIew.sexButton setTitle:@"请选择" forState:UIControlStateNormal];
            }
            
            
            if ([self.changeConVIew.statusButton.currentTitle isEqualToString:self.conDeails.data.statusName]) {
                
                [self.changeConVIew.statusButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                
            }else {
                
                [self.changeConVIew.statusButton setTitle:@"请选择" forState:UIControlStateNormal];
            }
            
            
            if ([self.changeConVIew.customerButton.currentTitle isEqualToString:self.conDeails.data.cusName]) {
                
                [self.changeConVIew.customerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

            }else {
            
                [self.changeConVIew.customerButton setTitle:@"请选择" forState:UIControlStateNormal];
                [self.changeConVIew.customerButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

            }

        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];


}


-(void)changeSaveCon
{
    if (self.changeConVIew.contentText1.text.length < 1) {
        
        [[Session sharedSession].tpView presentMessageTips:@"姓名不能为空"];
        
    }else if ([self.changeConVIew.customerButton.currentTitle isEqualToString:@"请选择客户"]) {
        
        [[Session sharedSession].tpView presentMessageTips:@"客户不能为空"];
        
    }else if (self.changeConVIew.contentText10.text.length < 1) {
    
        [[Session sharedSession].tpView presentMessageTips:@"手机不能为空"];

    } else {
        
        
        [[Session sharedSession].loadView StartLoading];
        
        if (![CommonUtils objectIsValid:self.changeConVIew.contentText1.text]) {
            
            self.changeConVIew.contentText1.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.changeConVIew.contentText2.text]) {
            
            self.changeConVIew.contentText2.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.changeConVIew.contentText3.text]) {
            
            self.changeConVIew.contentText3.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.changeConVIew.contentText4.text]) {
            
            self.changeConVIew.contentText4.text = @"";
        }

        if (![CommonUtils objectIsValid:self.changeConVIew.contentText6.text]) {
            
            self.changeConVIew.contentText6.text = @"";
        }

        if (![CommonUtils objectIsValid:self.changeConVIew.contentText7.text]) {
            
            self.changeConVIew.contentText7.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.changeConVIew.contentText8.text]) {
            
            self.changeConVIew.contentText8.text = @"";
        }

        if (![CommonUtils objectIsValid:self.changeConVIew.contentText9.text]) {
            
            self.changeConVIew.contentText9.text = @"";
        }

        if (![CommonUtils objectIsValid:self.changeConVIew.contentText12.text]) {
            
            self.changeConVIew.contentText12.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.changeConVIew.contentText13.text]) {
            
            self.changeConVIew.contentText13.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.changeConVIew.contentText14.text]) {
            
            self.changeConVIew.contentText14.text = @"";
        }

        if (![CommonUtils objectIsValid:self.changeConVIew.contentText15.text]) {
            
            self.changeConVIew.contentText15.text = @"";
        }

        if (![CommonUtils objectIsValid:self.changeConVIew.contentText16.text]) {
            
            self.changeConVIew.contentText16.text = @"";
        }

        if (![CommonUtils objectIsValid:self.changeConVIew.sexValue]) {
            
            self.changeConVIew.sexValue = @"";
        }
        
        if (![CommonUtils objectIsValid:self.changeConVIew.beiZhuText.text]) {
            
            self.changeConVIew.beiZhuText.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.changeConVIew.addressText.text]) {
            
            self.changeConVIew.addressText.text = @"";
        }

        if (![CommonUtils objectIsValid:self.changeConVIew.contentText11.text]) {
            
            self.changeConVIew.contentText11.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.changeConVIew.statusValue]) {
            
            self.changeConVIew.statusValue = @"";
        }

        if (![CommonUtils objectIsValid:self.changeConVIew.relatValue]) {
            
            self.changeConVIew.relatValue = @"";
        }
        
        if (![CommonUtils objectIsValid:self.changeConVIew.qinMiValue]) {
            
            self.changeConVIew.qinMiValue = @"";
        }
        
        if ([self.changeConVIew.relatButton.currentTitle isEqualToString:self.conDeails.data.contRoleTypeName]) {
            
            self.changeConVIew.relatValue = self.conDeails.data.contRoleType;
        }

        if ([self.changeConVIew.qinMiButton.currentTitle isEqualToString:self.conDeails.data.imtimateDegreeName]) {
            
            self.changeConVIew.qinMiValue = self.conDeails.data.imtimateDegree;
        }
        
        if ([self.changeConVIew.statusButton.currentTitle isEqualToString:self.conDeails.data.statusName]) {
            
            self.changeConVIew.statusValue = self.conDeails.data.status;
        }

        if ([self.changeConVIew.sexButton.currentTitle isEqualToString:self.conDeails.data.sexCodeName]) {
            
            self.changeConVIew.sexValue = self.conDeails.data.sexCode;
        }


        
        NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,CONTRACTCHANGE];
        NSDictionary *dict = @{@"conName":self.changeConVIew.contentText1.text,
                               @"postionCode":self.changeConVIew.contentText2.text,
                               @"departmentId":self.changeConVIew.contentText3.text,
                               @"parentPart":self.changeConVIew.contentText4.text,
                               @"cusName":self.changeConVIew.customerButton.titleLabel.text,
                               @"inchargeofBusi":self.changeConVIew.contentText6.text,
                               @"offtelNumber":self.changeConVIew.contentText7.text,
                               @"offtelAreaCode":self.changeConVIew.contentText8.text,
                               @"offtelExtension":self.changeConVIew.contentText9.text,
                               @"mobile":self.changeConVIew.contentText10.text,
                               @"email":self.changeConVIew.contentText11.text,
                               @"faxNumber":self.changeConVIew.contentText12.text,
                               @"faxAreacode":self.changeConVIew.contentText13.text,
                               @"faxExtension":self.changeConVIew.contentText14.text,
                               @"qq":self.changeConVIew.contentText15.text,
                               @"wechatNumber":self.changeConVIew.contentText16.text,
                               @"contRoleType":self.changeConVIew.relatValue,
                               @"imtimateDegree":self.changeConVIew.qinMiValue,
                               @"sexCode":self.changeConVIew.sexValue,
                               @"description":self.changeConVIew.beiZhuText.text,
                               @"regionAddr":self.changeConVIew.addressText.text,
                               @"status":self.changeConVIew.statusValue,
                               @"ownerName":self.changeConVIew.headButton.titleLabel.text,
                               @"id":self.conId
                               };
        NSLog(@"---%@",dict);
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            [[Session sharedSession].loadView StopLoading];
            
            if ([responseObject objectForKey:@"success"]) {
                
                [[Session sharedSession].tpView presentMessageTips:@"修改成功"];
                
                [[NSNotificationCenter defaultCenter]postNotificationName:@"CHANGECONUPDATE" object:nil];
                
                [self.navigationController popViewControllerAnimated:YES];
                
                NSLog(@"-----%@",[responseObject JSONString]);

            }
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            [[Session sharedSession].loadView StopLoading];
            
            NSLog(@"%@",error);
        }];
    }
}

@end
