//
//  PlanArchiveController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "PlanArchiveController.h"
#import "PlanArchiveView.h"

#import "AFNetworking.h"

@interface PlanArchiveController () <PlanArchiveDelegate>

@property (nonatomic, strong)PlanArchiveView *planArchive;

@end

@implementation PlanArchiveController



- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"计划归档";
    self.planArchive = [[PlanArchiveView alloc]initWithFrame:self.view.bounds];
    self.planArchive.delegate = self;
    [self.view addSubview:self.planArchive];
    self.view.backgroundColor = RGB(227, 227, 227);
}


-(void)clcikButtonArchive
{
    [[Session sharedSession].loadView StartLoading];
    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,VISITARCHIVE];
    
    NSDictionary *dict = @{@"ids":self.visitId,@"description":self.planArchive.textStr,@"status":@"PLANSTATUS_FINISH"};
    
    NSLog(@"------%@",dict);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [[Session sharedSession].loadView StopLoading];
        
        NSLog(@"------%@",[responseObject JSONString]);
        
        [[Session sharedSession].tpView presentMessageTips:@"已归档"];
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"CHOOSEPLANSTATUS" object:nil];
        
        [self.navigationController popViewControllerAnimated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [[Session sharedSession].loadView StopLoading];

        NSLog(@"------%@",error);
    }];
}

@end
