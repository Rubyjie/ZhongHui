//
//  AddPlanViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/22.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "AddPlanViewController.h"
#import "ChooseCustomerController.h"
#import "AddView.h"

#import "UserDefault.h"
#import "AFNetworking.h"

@interface AddPlanViewController () <addPlanButtonDelegate,popCustomerViewDelegate>

@property (nonatomic, strong)AddView *addView;

@end

@implementation AddPlanViewController



#pragma mark - 选择客户返回后代理传值
-(void)popCustomerAddCluesWithName:(NSString *)name cusId:(NSString *)cusId cusLevel:(NSString *)cusLevel type:(NSString *)type jiTuan:(NSString *)jiTuan userXZ:(NSString *)userXZ address:(NSString *)address jyXZ:(NSString *)jyXZ postCode:(NSString *)postCode openTime:(NSString *)openTime
{
    [self.addView.customerButton setTitle:name forState:UIControlStateNormal];
    [self.addView.customerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.addView.customerId = cusId;
    
}




- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"添加计划";
    
    self.addView = [[AddView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 17*50+64)];
//    self.addView.customerId = self.cusId;
    
    self.addView.delegate = self;
    
    if ([self.cluesAddPlan isEqualToString:@"线索添加计划"]) {
        
        [self.addView.ywButton setTitle:self.yeWuType forState:UIControlStateNormal];
        [self.addView.ywButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        self.addView.ywButton.userInteractionEnabled = NO;
        
        [self.addView.businessButton setTitle:self.xgYeWu forState:UIControlStateNormal];
        [self.addView.businessButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.addView.businessButton.userInteractionEnabled = NO;
        
        [self.addView.customerButton setTitle:self.cusName forState:UIControlStateNormal];
        [self.addView.customerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.addView.customerButton.userInteractionEnabled = NO;
        
        self.addView.customerId = self.cusId;
    }

    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
    
    scrollView.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH,17*50+64);
    
    [self.view addSubview:scrollView];
    
    [scrollView addSubview:self.addView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

-(void)swithButtonChooseCustomerWithTag:(NSInteger)tag
{
    if (tag == 509) {
        
        ChooseCustomerController *chooseCustomer = [[ChooseCustomerController alloc]init];
        chooseCustomer.delegate = self;
        [self.navigationController pushViewController:chooseCustomer animated:YES];
    }

}


#pragma mark - 点击确定按钮添加计划
-(void)ciclkButtonAddPlan
{
    if (self.addView.titleField.text.length < 1) {
        
        [[Session sharedSession].tpView presentMessageTips:@"标题不能为空"];
        
    }else if ([self.addView.startTimeButton.currentTitle isEqualToString:@"必选项"]){
        
        [[Session sharedSession].tpView presentMessageTips:@"开始时间不能为空"];
        
    }else if ([self.addView.endTimeButton.currentTitle isEqualToString:@"必选项"]){
        
        [[Session sharedSession].tpView presentMessageTips:@"结束时间不能为空"];
        
    }else if ([self.addView.customerButton.currentTitle isEqualToString:@"必选项"]){
    
        [[Session sharedSession].tpView presentMessageTips:@"客户不能为空"];
    
    }else if ([self.addView.headButton.currentTitle isEqualToString:@"请选择"]){
    
        [[Session sharedSession].tpView presentMessageTips:@"负责人不能为空"];

    }else if ([self.addView.stateButton.currentTitle isEqualToString:@"请选择"]){
    
        [[Session sharedSession].tpView presentMessageTips:@"状态不能为空"];

    }else if ([self.addView.contractButton.currentTitle isEqualToString:@"必选项"]){
    
        [[Session sharedSession].tpView presentMessageTips:@"联系人不能为空"];

    }else{
    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,ADDVISITPLAN];
        
    NSString *startStr = self.addView.statrDateStr;
    if (startStr) {
        startStr = [startStr stringByReplacingOccurrencesOfString:@"年" withString:@"-"];
        startStr = [startStr stringByReplacingOccurrencesOfString:@"月" withString:@"-"];
        startStr = [startStr stringByReplacingOccurrencesOfString:@"日" withString:@""];
    }
    
    NSString *endStr = self.addView.endDataStr;
    if (endStr) {
        endStr = [endStr stringByReplacingOccurrencesOfString:@"年" withString:@"-"];
        endStr = [endStr stringByReplacingOccurrencesOfString:@"月" withString:@"-"];
        endStr = [endStr stringByReplacingOccurrencesOfString:@"日" withString:@""];
    }
        
        
    NSString *tiXingStr = self.addView.tiXingButton.titleLabel.text;
    if (tiXingStr) {
        
        tiXingStr = [tiXingStr stringByReplacingOccurrencesOfString:@"年" withString:@"-"];
        tiXingStr = [tiXingStr stringByReplacingOccurrencesOfString:@"月" withString:@"-"];
        tiXingStr = [tiXingStr stringByReplacingOccurrencesOfString:@"日" withString:@""];
    }

        
    //判断如果默认是当前登录人（负责人），那id就是当前登录人的id
    if ([self.addView.headButton.titleLabel.text isEqualToString:[UserDefault getDataObjectForKey:@"logInName"]]) {
        
        self.addView.headId = [UserDefault getDataObjectForKey:@"managerID"];
    }
    
        
        if (![CommonUtils objectIsValid:self.addView.sxValue]) {
            self.addView.sxValue = @"";
        }

        if (![CommonUtils objectIsValid:self.addView.contentField.text]) {
            self.addView.contentField.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.addView.canYuButton.currentTitle]) {
            self.addView.canYuButton.titleLabel.text = @"";
        }

        if (![CommonUtils objectIsValid:self.addView.canYuId]) {
            self.addView.canYuId = @"";
        }

        if (![CommonUtils objectIsValid:self.addView.zyxValue]) {
            self.addView.zyxValue = @"";
        }
        
        if (![CommonUtils objectIsValid:self.addView.visitValue]) {
            self.addView.visitValue = @"";
        }

        if (![CommonUtils objectIsValid:tiXingStr]) {
            
            tiXingStr = @"";
        }
        
        
        if (![CommonUtils objectIsValid:self.addView.businessId]) {
            
            self.addView.businessId = @"";
        }
        
        // 如果是在线索里添加计划需要传这俩字段
        if ([self.cluesAddPlan isEqualToString:@"线索添加计划"]) {
            
            self.addView.ywValue = @"RELBUSIN_XS";
            self.addView.businessId = self.cluesId;
        }
        
        
#pragma mark - 添加提醒时间和是否提醒字段
        NSDictionary *dict = @{@"plaTitle":self.addView.titleField.text,
                       @"busiType":self.addView.sxValue,
                       @"contactType":self.addView.visitValue,
                       @"starttime":startStr,
                       @"endtime":endStr,
                       @"plaContent":self.addView.contentField.text,
                       @"ownerName":self.addView.headButton.titleLabel.text,
                       @"ownerId":self.addView.headId,
                       @"empName":self.addView.canYuButton.titleLabel.text,
                       @"empId":self.addView.canYuId,
                       @"cusFullname":self.addView.customerButton.titleLabel.text,
                        @"contactContent":self.addView.addressPhone.text,
                       @"cusId":self.addView.customerId,
                       @"importanceLev":self.addView.zyxValue,
                       @"status":@"PLANSTATUS_WAIT",
//                           @"status":self.addView.stateValue,
                       @"conId":self.addView.contractId,
                       @"conName":self.addView.contractButton.titleLabel.text,
                       @"relBusiType":self.addView.ywValue,
                       @"relBusiId":self.addView.businessId,
                       @"relBusiName":self.addView.busineStr,
                       @"needRemind":[NSNumber numberWithBool:self.addView.isTiXing.selected],
                        @"remindTime":tiXingStr,
                        @"orgId":self.addView.headJiGouId,
                    };
        
    NSLog(@"0-----%@",dict);
                               
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"------%@",[responseObject JSONString]);
        
        
        if ([responseObject objectForKey:@"success"]) {
            
            [[Session sharedSession].tpView presentMessageTips:@"添加成功"];
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"ADDPLAN" object:nil];
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    }
}


@end
