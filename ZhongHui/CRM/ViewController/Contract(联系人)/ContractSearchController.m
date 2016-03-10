//
//  ContractSearchController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/4.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "ContractSearchController.h"
#import "ChooseCustomerController.h"
#import "ContractSearchView.h"

#import "TPKeyboardAvoidingScrollView.h"

#import "AFNetworking.h"

#import "contractBaseClass.h"
#import "contractData.h"
#import "contractDatalist.h"


@interface ContractSearchController () <contracrtSearchDelegate,popCustomerViewDelegate>

@property (nonatomic, strong)ContractSearchView *searchView;

@property (nonatomic, strong)NSMutableArray *searchContactArray;

@property (nonatomic, strong)UIScrollView *scrollView;

@property (nonatomic, strong)NSString *customerId;

@end

@implementation ContractSearchController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[Session sharedSession].loadView StopLoading];
}

-(NSMutableArray *)searchContactArray
{
    if (!_searchContactArray) {
        
        _searchContactArray = [NSMutableArray array];
    }
    return _searchContactArray;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"联系人搜索";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"搜索" style:UIBarButtonItemStyleDone target:self action:@selector(ciclkSearchContract)];
    
    self.searchView = [[ContractSearchView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 50*20)];
    self.searchView.delegate = self;
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
    self.scrollView.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, 50*20+60);
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.searchView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark 键盘将要出来
-(void)keyboardWillShow:(NSNotification*)notification{
    
    NSDictionary *info=[notification userInfo];
    //获取键盘高度
    CGSize kbSize=[[info objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue].size;
    
    [UIView animateWithDuration:0.25f animations:^{
        
        self.scrollView.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-kbSize.height-64);
        
        self.scrollView.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, 50*20);
        
    }completion:^(BOOL finished) {
        
    }];
}

#pragma mark 键盘将要隐藏
-(void)keyboardWillHidden:(NSNotification*)notification{
    [UIView animateWithDuration:0.25f animations:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            self.scrollView.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT);
            
            self.scrollView.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, 50*20+64);

        });
    }completion:^(BOOL finished) {
        
    }];
}



-(void)ciclkSearchContract
{
    [[Session sharedSession].loadView StartLoading];
    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,CONTRACTSEARCH];
    
    if (![CommonUtils objectIsValid:self.searchView.nameText.text]) {
        
        self.searchView.nameText.text = @"";
    }
    
    
    if (![CommonUtils objectIsValid:self.searchView.zhiWeiText.text]) {
        
        self.searchView.zhiWeiText.text = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.buMenText.text]) {
        
        self.searchView.buMenText.text = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.superiorText.text]) {
        
        self.searchView.superiorText.text = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.cusStr]) {
        
        self.searchView.cusStr = @"";
    }
    
    if (![CommonUtils objectIsValid:self.customerId]) {
        
        self.customerId = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.contactWayValue]) {
        
        self.searchView.contactWayValue = @"";
    }


    if (![CommonUtils objectIsValid:self.searchView.statusValues]) {
        
        self.searchView.statusValues = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.phoneNum.text]) {
        
        self.searchView.phoneNum.text = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.phoneAreaNum.text]) {
        
        self.searchView.phoneAreaNum.text = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.phoneExtensionNum.text]) {
        
        self.searchView.phoneExtensionNum.text = @"";
    }
    
    if (![CommonUtils objectIsValid:self.searchView.mobile.text]) {
        
        self.searchView.mobile.text = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.email.text]) {
        
        self.searchView.email.text = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.qqText.text]) {
        
        self.searchView.qqText.text = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.weatchText.text]) {
        
        self.searchView.weatchText.text = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.faxNum.text]) {
        
        self.searchView.faxNum.text = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.faxAreaNum.text]) {
        
        self.searchView.faxAreaNum.text = @"";
    }
    
    if (![CommonUtils objectIsValid:self.searchView.faxExtensionNum.text]) {
        
        self.searchView.faxExtensionNum.text = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.sexValue]) {
        
        self.searchView.sexValue = @"";
    }
    
    if (![CommonUtils objectIsValid:self.searchView.headId]) {
        
        self.searchView.headId = @"";
    }

    NSLog(@"%@\n",self.searchView.customerButton.titleLabel.text);
    
    NSDictionary *dict = @{
                           @"conName":self.searchView.nameText.text,
                           @"postionCode":self.searchView.zhiWeiText.text,
                           @"departmentId":self.searchView.buMenText.text,
                           @"parentPart":self.searchView.superiorText.text,
                           @"cusName":self.searchView.cusStr,
                           @"recordsType":self.searchView.contactWayValue,
                           @"status":self.searchView.statusValues,
                           @"ownerId":self.searchView.headId,
                           @"offtelNumber":self.searchView.phoneNum.text,
                           @"offtelAreaCode":self.searchView.phoneAreaNum.text,
                           @"offtelExtension":self.searchView.phoneExtensionNum.text,
                           @"mobile":self.searchView.mobile.text,
                           @"email":self.searchView.email.text,
                           @"qq":self.searchView.qqText.text,
                           @"wechatNumber":self.searchView.weatchText.text,
                           @"faxNumber":self.searchView.faxNum.text,
                           @"faxAreacode":self.searchView.faxAreaNum.text,
                           @"faxExtension":self.searchView.faxExtensionNum.text,
                           @"sexCode":self.searchView.sexValue,
                           @"regionAddr":self.searchView.addressText.text,
                           };
    
    NSLog(@"---%@",dict);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [[Session sharedSession].loadView StopLoading];
        
        NSLog(@"------%@",[responseObject JSONString]);
        
        contractBaseClass *baseModel = [[contractBaseClass alloc]initWithDictionary:responseObject];
        
        if (baseModel.success) {
            
            for (int i = 0; i < baseModel.data.datalist.count; i++) {
                
                [self.searchContactArray addObject:[baseModel.data.datalist objectAtIndex:i]];
                
            }
            
            [self.delegate ciclkSearchPopContractListWithArray:self.searchContactArray];
            
            if (self.searchContactArray.count == 0) {
                
                [[Session sharedSession].tpView presentMessageTips:@"没有数据"];
            }
        }
        
        [self.navigationController popViewControllerAnimated:YES];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [[Session sharedSession].loadView StopLoading];

        NSLog(@"%@",error);
    }];

}

-(void)selectedButtonChooseCustomerNameWithTag:(NSInteger)tag
{
    if (tag == 14) {
        
        ChooseCustomerController *customer = [[ChooseCustomerController alloc]init];
        customer.delegate = self;
        [self.navigationController pushViewController:customer animated:YES];
    }

}

-(void)popCustomerAddCluesWithName:(NSString *)name cusId:(NSString *)cusId cusLevel:(NSString *)cusLevel type:(NSString *)type jiTuan:(NSString *)jiTuan userXZ:(NSString *)userXZ address:(NSString *)address jyXZ:(NSString *)jyXZ postCode:(NSString *)postCode openTime:(NSString *)openTime
{
    [self.searchView.customerButton setTitle:name forState:UIControlStateNormal];
    [self.searchView.customerButton setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    self.customerId = cusId;
    self.searchView.cusStr = name;
}


@end
