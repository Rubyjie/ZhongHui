//
//  CRMViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/15.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CRMViewController.h"
#import "VisitPlanViewController.h"  //拜访计划
#import "ContractViewController.h"   //联系人
#import "CustomerController.h"       // 客户
#import "CluesViewController.h"      // 线索
#import "CRMView.h"

#import "AFNetworking.h"

@interface CRMViewController () <CRMButtonDelegate>

@end

@implementation CRMViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(227, 227, 227);
    
    CRMView *crmView = [[CRMView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH - 20, PHONE_UISCREEN_HEIGHT - 64 - 49 - 20)];
    
//    crmView.backgroundColor = [UIColor whiteColor];
    
    crmView.delegate = self;
    
    [self.view addSubview:crmView];
    
    [self getHeadNameData];
    
    // 获取省
    [self getProvinceData];
    
}

-(void)getProvinceData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/region/query"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"type":@"1"};
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dictData = [responseObject objectForKey:@"data"];
            NSArray *dataArray = [dictData objectForKey:@"data"];
            for (int i = 0 ; i < dataArray.count; i ++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                
                NSString *nameStr = [dict objectForKey:@"name"];
                NSString *idStr = [dict objectForKey:@"id"];
                [[Session sharedSession].provinceNameArray addObject:nameStr];
                [[Session sharedSession].provinceIdArray addObject:idStr];
                
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"-----%@",error);
    }];
    
}


-(void)getCityDataWithId:(NSString *)provinceid
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/region/query"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"parentId":provinceid};
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dataDict = [responseObject objectForKey:@"data"];
            
            NSArray *dataArray = [dataDict objectForKey:@"data"];
            
            for (int i = 0 ; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                
                NSString *cityName = [dict objectForKey:@"name"];
                NSString *cityId = [dict objectForKey:@"id"];
                
                [[Session sharedSession].cityNameArray addObject:cityName];
                [[Session sharedSession].cityIdArray addObject:cityId];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
}

-(void)getAreaDataWithCityId:(NSString *)cityId
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/region/query"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"parentId":cityId};
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
#pragma mark - 数据不对
        NSLog(@"------%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dictData = [responseObject objectForKey:@"data"];
            
            NSArray *dataArray = [dictData objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i ++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                
                NSString *areaName = [dict objectForKey:@"name"];
                NSString *areaId = [dict objectForKey:@"id"];
                [[Session sharedSession].areaNameArray addObject:areaName];
                [[Session sharedSession].areaIdArray addObject:areaId];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}



-(void)getHeadNameData
{
    NSString *headNameUrl = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/employee/queryValid"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:headNameUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"---%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dataDict = [responseObject objectForKey:@"data"];
            NSArray *dataArray = [dataDict objectForKey:@"data"];
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *headName = [dict objectForKey:@"employeeName"];
                NSString *headId = [dict objectForKey:@"id"];
                
                [[Session sharedSession].headNameArray addObject:headName];
                [[Session sharedSession].headIdArray addObject:headId];
            }
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}



#pragma mark - 200拜访计划  201客户 202联系人 203线索  204机会 205合同 206产品 207线索
-(void)clcikCrmButtonWithTag:(NSInteger)tag
{
    if (tag == 200) {
        
        VisitPlanViewController *visitPlan = [[VisitPlanViewController alloc]init];
        visitPlan.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:visitPlan animated:YES];
        
    }else if (tag == 201){
    
        CustomerController *customer = [[CustomerController alloc]init];
        customer.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:customer animated:YES];
        
    }else if (tag == 202){
    
        ContractViewController *contract = [[ContractViewController alloc]init];
        contract.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:contract animated:YES];

    
    }else if (tag == 203){
    
    
        CluesViewController *clues = [[CluesViewController alloc]init];
        clues.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:clues animated:YES];

    }else if (tag == 204){
    
    
    }else if (tag == 205){
    
//        CustomerController *customer = [[CustomerController alloc]init];
//        customer.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:customer animated:YES];
        
    }else if (tag == 206){
        
        
    
        
    }else if (tag == 207){
        
        
    }

}


@end
