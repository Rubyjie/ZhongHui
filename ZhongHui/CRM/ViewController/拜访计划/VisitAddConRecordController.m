//
//  VisitAddConRecordController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/21.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "VisitAddConRecordController.h"
#import "AddConRecord.h"

#import "AFNetworking.h"
#import "UserDefault.h"

@interface VisitAddConRecordController ()<addConRecordButtonDelegate>

@property (nonatomic, strong)AddConRecord *visitAddRecord;


@end

@implementation VisitAddConRecordController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"添加联络纪录";
    
    self.view.backgroundColor = RGB(227, 227, 227);
    

    self.visitAddRecord = [[AddConRecord alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64)];
    self.visitAddRecord.delegate = self;
    [self.view addSubview:self.visitAddRecord];
    
}

#pragma mark - 点击button添加联络纪录
-(void)swithButtonAddConRecord
{
    
    if ([self.visitAddRecord.genJinTime.currentTitle isEqualToString:@"必选项"]) {
        
        [[Session sharedSession].tpView presentMessageTips:@"时间不能为空"];
        
    }else if ([self.visitAddRecord.resultButton.currentTitle isEqualToString:@"必选项"]){
        
        [[Session sharedSession].tpView presentMessageTips:@"结果不能为空"];
        
    }else if ([self.visitAddRecord.yuYueTime.currentTitle isEqualToString:@"必选项"]){
        
        [[Session sharedSession].tpView presentMessageTips:@"请选择时间"];
        
    }else {
        
        NSLog(@"%@",self.visitAddRecord.genJinDateStr);
        
        NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"customer/contactRecords/save"];
        
        NSString *userId = [UserDefault getDataObjectForKey:@"managerID"];
        NSString *userName = [UserDefault getDataObjectForKey:@"logInName"];
        
#pragma mark - 有时候崩是字段有空的
        NSDictionary *dict = @{@"cusId":self.cusId,
                               @"cusFullname":self.cusName,
                               //                           @"conId":self.contactIdStr,
                               //                           @"conName":self.contactNameStr,
                               @"ownerId":userId, // 登录人ID
                               @"ownerName":userName,
                               //                           @"visTitle":self.visitTitleStr,
                               @"relBusiType":@"SLL_VISITPLAN",
                               @"status":@"ACTIVE",
                               @"relBusiId":self.planId,
                               @"relBusiName":self.cusName,
                               @"contactTime":self.visitAddRecord.genJinDateStr,
                               @"contactResult":self.visitAddRecord.resultValue,
                               @"resultReason":self.visitAddRecord.yuanYinText.text,
                               @"contactContent":self.visitAddRecord.contentText.text,
                               @"appointTime":self.visitAddRecord.yuYueDataStr,
                               };
        
        AFHTTPRequestOperationManager *mag = [AFHTTPRequestOperationManager manager];
        
        [mag POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSLog(@"----%@",[responseObject JSONString]);
            
            if ([responseObject objectForKey:@"success"]) {
                
                [[NSNotificationCenter defaultCenter]postNotificationName:@"VISITPLANADDRECORD" object:nil];
                
                [[Session sharedSession].tpView presentMessageTips:@"添加成功"];
                
                [self.navigationController popViewControllerAnimated:YES];
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"%@",error);
        }];
    }
}



@end
