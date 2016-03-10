//
//  AddConRecordController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/14.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "AddConRecordController.h"
#import "AddConRecord.h"

#import "UserDefault.h"
#import "AFNetworking.h"

@interface AddConRecordController () <addConRecordButtonDelegate>

@property (nonatomic, strong)AddConRecord *addRecord;

@end

@implementation AddConRecordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"添加联络纪录";
    
    self.view.backgroundColor = RGB(227, 227, 227);
    
    self.addRecord = [[AddConRecord alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64)];
    self.addRecord.delegate = self;
    [self.view addSubview:self.addRecord];
    
    
}



#pragma mark - 点击button添加联络纪录
-(void)swithButtonAddConRecord
{
   
#pragma mark - 现在是添加时弄了俩控制器，一个控制器就这样判断
//    if ([self.addRcordType isEqualToString:@"线索"]) {
//        
//        [[Session sharedSession].tpView presentMessageTips:@"线索添加联络记录"];
//        
//    }else if ([self.addRcordType isEqualToString:@"计划"]) {
//        
//        [[Session sharedSession].tpView presentMessageTips:@"计划添加联络记录"];
//    }
    
    if ([self.addRecord.genJinTime.currentTitle isEqualToString:@"必选项"]) {
        [[Session sharedSession].tpView presentMessageTips:@"时间不能为空"];
        
    }else if ([self.addRecord.resultButton.currentTitle isEqualToString:@"必选项"]){
        
        [[Session sharedSession].tpView presentMessageTips:@"结果不能为空"];
        
    }else if ([self.addRecord.yuYueTime.currentTitle isEqualToString:@"必选项"]){
        
        [[Session sharedSession].tpView presentMessageTips:@"请选择时间"];
        
    }else {
    
        NSLog(@"%@",self.addRecord.genJinDateStr);

        NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"customer/contactRecords/save"];
        
        NSString *userId = [UserDefault getDataObjectForKey:@"managerID"];
        NSString *userName = [UserDefault getDataObjectForKey:@"logInName"];
        
    #pragma mark - 有时候崩是字段有空的
        NSDictionary *dict = @{@"cusId":self.customerIDStr,
                               @"cusFullname":self.customerNameStr,
    //                           @"conId":self.contactIdStr,
    //                           @"conName":self.contactNameStr,
                               @"ownerId":userId, // 登录人ID
                               @"ownerName":userName,
    //                           @"visTitle":self.visitTitleStr,
                               @"relBusiType":@"SLL_CLUE",
                               @"status":@"ACTIVE",
                               @"relBusiId":self.cluesIdStr,
                               @"relBusiName":self.customerNameStr,
                               @"contactTime":self.addRecord.genJinDateStr,
                               @"contactResult":self.addRecord.resultValue,
                               @"resultReason":self.addRecord.yuanYinText.text,
                               @"contactContent":self.addRecord.contentText.text,
                               @"appointTime":self.addRecord.yuYueDataStr,
                               };

        AFHTTPRequestOperationManager *mag = [AFHTTPRequestOperationManager manager];
        
        [mag POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSLog(@"----%@",[responseObject JSONString]);
            
            if ([responseObject objectForKey:@"success"]) {
                
                [[NSNotificationCenter defaultCenter]postNotificationName:@"ADDCONRECORD" object:nil];
                
                [[Session sharedSession].tpView presentMessageTips:@"添加成功"];
                
                [self.navigationController popViewControllerAnimated:YES];
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"%@",error);
        }];
    }
}


@end
