//
//  CustomerSearchController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CustomerSearchController.h"
#import "ChooseCustomerController.h"

#import "CustomerSearchView.h"

#import "CustomerBaseClass.h"
#import "CustomerData.h"
#import "CustomerDatalist.h"

#import "AFNetworking.h"

@interface CustomerSearchController () <customerButtonDelegate,popCustomerViewDelegate>

@property (nonatomic, strong)NSMutableArray *dataArray;

@property (nonatomic, strong)CustomerSearchView *searchView;

@property (nonatomic, strong)NSString *jiTuanId;
@end

@implementation CustomerSearchController

-(void)popCustomerAddCluesWithName:(NSString *)name cusId:(NSString *)cusId cusLevel:(NSString *)cusLevel type:(NSString *)type jiTuan:(NSString *)jiTuan userXZ:(NSString *)userXZ address:(NSString *)address jyXZ:(NSString *)jyXZ postCode:(NSString *)postCode openTime:(NSString *)openTime
{
    [self.searchView.jiTuanButton setTitle:name forState:UIControlStateNormal];
    [self.searchView.jiTuanButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.jiTuanId = cusId;
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        
        _dataArray =[NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"客户搜索";
    
#pragma mark - 原来搜索的内容多，后期还要加
    self.searchView = [[CustomerSearchView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 50*16)];
    self.searchView.delegate = self;
    
    UIScrollView *scrollVIew = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
    
    scrollVIew.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, 50*16+64);
    [self.view addSubview:scrollVIew];
    
    [scrollVIew addSubview:self.searchView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"搜索" style:UIBarButtonItemStyleDone target:self action:@selector(clcikSearch)];
}

-(void)swithButtonChooseJiGouDataWithTag:(NSInteger)tag
{
    if (tag == 102) {
        
        ChooseCustomerController *jiGou = [[ChooseCustomerController alloc]init];
        jiGou.delegate = self;
        [self.navigationController pushViewController:jiGou animated:YES];
    }

}


-(void)clcikSearch
{

    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,CUSTOMERQUERY];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    if (![CommonUtils objectIsValid:self.searchView.cusText.text]) {
        
        self.searchView.cusText.text = @"";
    }
    
    if (![CommonUtils objectIsValid:self.searchView.cusCodeText.text]) {
        self.searchView.cusCodeText.text = @"";
    }
    
    if (![CommonUtils objectIsValid:self.searchView.provinceId]) {
        self.searchView.provinceId = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.provinceButton.currentTitle]) {
        self.searchView.provinceButton.titleLabel.text = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.cityId]) {
        self.searchView.cityId = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.areaId]) {
        self.searchView.areaId = @"";
    }
    if (![CommonUtils objectIsValid:self.searchView.typeValue]) {
        self.searchView.typeValue = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.levelValue]) {
        self.searchView.levelValue = @"";
    }
    
    if (![CommonUtils objectIsValid:self.searchView.jyXzValue]) {
        self.searchView.jyXzValue = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.managerValue]) {
        self.searchView.managerValue = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.statusValue]) {
        self.searchView.statusValue = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.openStartStr]) {
        self.searchView.openStartStr = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.openEndStr]) {
        self.searchView.openEndStr = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.decorateStartStr]) {
        self.searchView.decorateStartStr = @"";
    }
    
    if (![CommonUtils objectIsValid:self.searchView.decorateEndStr]) {
        self.searchView.decorateEndStr = @"";
    }

    if (![CommonUtils objectIsValid:self.searchView.assetsOwnerValue]) {
        self.searchView.assetsOwnerValue = @"";
    }

    if (![CommonUtils objectIsValid:self.jiTuanId]) {
        self.jiTuanId = @"";
    }

    
    NSDictionary *dict = @{@"cusFullName":self.searchView.cusText.text,
                           @"cusCode":self.searchView.cusCodeText.text,
#pragma mark - 传省、市、区就搜不到数据
                           @"parentId":self.searchView.provinceId,
//                           @"province":self.searchView.provinceButton.titleLabel.text,
                           @"city":self.searchView.cityId,
                           @"district":self.searchView.areaId,
                           @"cusType":self.searchView.typeValue,
                           @"startLevel":self.searchView.levelValue,
                           @"bustNature":self.searchView.jyXzValue,
                           @"managerParty":self.searchView.managerValue,
                           @"status":self.searchView.statusValue,
                           @"openDate":self.searchView.openStartStr,
                           @"openDate1":self.searchView.openEndStr,
                           @"startRedecDateLast":self.searchView.decorateStartStr,
                           @"endRedecDateLast":self.searchView.decorateEndStr,
                           @"assetsOwner":self.searchView.assetsOwnerValue,
                           @"ownerGroupId":self.jiTuanId,
                           
                           };
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"----%@",[responseObject JSONString]);
        
        CustomerBaseClass *baseModel = [[CustomerBaseClass alloc]initWithDictionary:responseObject];
        
        if (baseModel.success) {
            
            for (int i =0 ; i < baseModel.data.datalist.count; i++) {
                
                [self.dataArray addObject:[baseModel.data.datalist objectAtIndex:i]];
            }
            [self.delegate swithButtonPopViewWithArray:self.dataArray];
            
            if (self.dataArray.count == 0) {
                
                [[Session sharedSession].tpView presentMessageTips:@"没有数据"];
            }
            
        }
        [self.navigationController popViewControllerAnimated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}






@end
