//
//  CancelPlanController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CancelPlanController.h"
#import "PlanCancelView.h"

#import "AFNetworking.h"

@interface CancelPlanController () <planCancelQueDingDelegate>

@property (nonatomic, strong)PlanCancelView *cancelView;

@end

@implementation CancelPlanController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"取消计划";
    
    self.cancelView = [[PlanCancelView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
    
    self.cancelView.delegate = self;
    
    [self.view addSubview:self.cancelView];
    
    self.view.backgroundColor = RGB(227, 227, 227);
}

-(void)selectedButtonQueDingCancel
{
    
    if (self.cancelView.YuanYinType.length < 1) {
        
        [[Session sharedSession].tpView presentMessageTips:@"请选择原因"];
        
    }else{
    
        [[Session sharedSession].loadView StartLoading];

        NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,VISITCANCEL];
        
        NSDictionary *dict = @{@"ids":self.cancelPlanID,@"opeReason":self.cancelView.YuanYinType,@"opeContent":self.cancelView.conText.text};
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
         if (![CommonUtils objectIsValid:self.cancelView.conText.text]) {
            
             self.cancelView.conText.text = @"";
        }
        
        [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            [[Session sharedSession].loadView StopLoading];
            
            NSLog(@"----%@",[responseObject JSONString]);
            
            [[Session sharedSession].tpView presentMessageTips:@"已取消"];
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"CANCELPLAN" object:nil];
            
            [self.navigationController popViewControllerAnimated:YES];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            [[Session sharedSession].loadView StopLoading];
            
            NSLog(@"---%@",error);
        }];
    }
}


@end
