//
//  AddContractController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/25.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "AddContractController.h"
#import "ChooseCustomerController.h"

#import "AddContractView.h"

#import "AFNetworking.h"

@interface AddContractController ()<addContractButtonDelegate,popCustomerViewDelegate>

@property (nonatomic, strong)AddContractView *addView;

@property (nonatomic, strong)UIScrollView *scrollView;

@property (nonatomic, strong)NSArray *textArray;
@end

@implementation AddContractController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.title = @"添加联系人";
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStyleDone target:self action:@selector(Add)];
    self.addView = [[AddContractView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 23*50+60)];
    
    [self.addView.customerButton setTitle:self.cusName forState:UIControlStateNormal];
    [self.addView.customerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.addView.delegate = self;
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
    self.scrollView.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, 23*50+60);
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.addView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    

}


//#pragma mark 键盘将要出来
-(void)keyboardWillShow:(NSNotification*)notification{
    
    NSDictionary *info=[notification userInfo];
    //获取键盘高度
    CGSize kbSize=[[info objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue].size;
    [UIView animateWithDuration:0.25f animations:^{
        self.scrollView.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-kbSize.height - 64);
        self.scrollView.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, 24*50-60);
    }completion:^(BOOL finished) {
        
    }];
}



#pragma mark 键盘将要隐藏
-(void)keyboardWillHidden:(NSNotification*)notification{
    [UIView animateWithDuration:0.25f animations:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.scrollView.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT);
            self.scrollView.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, 24*50+5);
        });
    }completion:^(BOOL finished) {
        
    }];
}


-(void)Add {

    if (self.addView.contentText1.text.length < 1) {
        
        [[Session sharedSession].tpView presentMessageTips:@"姓名不能为空"];
        
    }else if ([self.addView.customerButton.currentTitle isEqualToString:@""]) {
    
        [[Session sharedSession].tpView presentMessageTips:@"客户不能为空"];

    }else if (self.addView.statusValue.length < 1) {
        
        [[Session sharedSession].tpView presentMessageTips:@"状态不能为空"];

        
    }else if (self.addView.contentText10.text.length < 1){
        
        [[Session sharedSession].tpView presentMessageTips:@"手机号不能为空"];
        
    }else{
        
        
        if (![CommonUtils objectIsValid:self.addView.contentText2.text]) {
            
            self.addView.contentText2.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.addView.contentText3.text]) {
            
            self.addView.contentText3.text = @"";
        }

        if (![CommonUtils objectIsValid:self.addView.contentText4.text]) {
            
            self.addView.contentText4.text = @"";
        }

        if (![CommonUtils objectIsValid:self.addView.contentText6.text]) {
            
            self.addView.contentText6.text = @"";
        }
        
        
        if (![CommonUtils objectIsValid:self.addView.contentText7.text]) {
            
            self.addView.contentText7.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.addView.contentText8.text]) {
            
            self.addView.contentText8.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.addView.contentText9.text]) {
            
            self.addView.contentText9.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.addView.contentText11.text]) {
            
            self.addView.contentText11.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.addView.contentText12.text]) {
            
            self.addView.contentText12.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.addView.contentText13.text]) {
            
            self.addView.contentText13.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.addView.contentText14.text]) {
            
            self.addView.contentText14.text = @"";
        }
        

        if (![CommonUtils objectIsValid:self.addView.contentText15.text]) {
            
            self.addView.contentText15.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.addView.contentText16.text]) {
            
            self.addView.contentText16.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.addView.relatValue]) {
            
            self.addView.relatValue = @"";
        }
        
        if (![CommonUtils objectIsValid:self.addView.qinMiValue]) {
            
            self.addView.qinMiValue = @"";
        }

        if (![CommonUtils objectIsValid:self.addView.beiZhuText.text]) {
            
            self.addView.beiZhuText.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.addView.addressText.text]) {
            
            self.addView.addressText.text = @"";
        }
    
        if (![CommonUtils objectIsValid:self.addView.sexValue]) {
            
            self.addView.sexValue = @"";
        }
        
        [[Session sharedSession].loadView StartLoading];
        NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,ADDCONTRACT];
        NSDictionary *dict = @{@"conName":self.addView.contentText1.text,
                               @"postionCode":self.addView.contentText2.text,
                               @"departmentId":self.addView.contentText3.text,
                               @"parentPart":self.addView.contentText4.text,
                               @"cusName":self.addView.customerButton.titleLabel.text,
                               @"customerId":self.cusId,
                               @"inchargeofBusi":self.addView.contentText6.text,
                               @"offtelNumber":self.addView.contentText7.text,
                               @"offtelAreaCode":self.addView.contentText8.text,
                               @"offtelExtension":self.addView.contentText9.text,
                               @"mobile":self.addView.contentText10.text,
                               @"email":self.addView.contentText11.text,
                               @"faxNumber":self.addView.contentText12.text,
                               @"faxAreacode":self.addView.contentText13.text,
                               @"faxExtension":self.addView.contentText14.text,
                               @"qq":self.addView.contentText15.text,
                               @"wechatNumber":self.addView.contentText16.text,
                               @"contRoleType":self.addView.relatValue,
                               @"imtimateDegree":self.addView.qinMiValue,
                               @"sexCode":self.addView.sexValue,
                               @"description":self.addView.beiZhuText.text,
                               @"regionAddr":self.addView.addressText.text,
                               @"status":self.addView.statusValue,
                               @"ownerName":self.addView.headButton.titleLabel.text,
                               };
        NSLog(@"---%@",dict);
        

        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            [[Session sharedSession].loadView StopLoading];
            
            [[Session sharedSession].tpView presentMessageTips:@"新增成功"];
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"ADDCONTRACT" object:nil];
            
            [self.navigationController popViewControllerAnimated:YES];          
            
            NSLog(@"-----%@",[responseObject JSONString]);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            [[Session sharedSession].loadView StopLoading];

            NSLog(@"%@",error);
        }];
    }
}


#pragma mark - addContractButtonDelegate选择客户的代理
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
    [self.addView.customerButton setTitle:name forState:UIControlStateNormal];
    [self.addView.customerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.cusId = cusId;
}

@end
