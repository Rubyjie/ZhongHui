//
//  FollowController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "FollowController.h"
#import "PlanFollowView.h"
#import "AFNetworking.h"

#import "TPKeyboardAvoidingScrollView.h"

#import "UserDefault.h"

@interface FollowController () <followButtonDelegate>

@property (nonatomic, strong)PlanFollowView *followView ;

@property (nonatomic, strong)TPKeyboardAvoidingScrollView *followScroll;

@end

@implementation FollowController

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"计划跟进";
    
    self.followView = [[PlanFollowView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
    self.followView.delegate = self;
    
    self.followScroll = [[TPKeyboardAvoidingScrollView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
    self.followScroll.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT);
    
    [self.view addSubview:self.followScroll];
    [self.followScroll addSubview:self.followView];
    
    self.view.backgroundColor = RGB(227, 227, 227);
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    
}

#pragma mark 键盘将要出来
-(void)keyboardWillShow:(NSNotification*)notification{
    
    NSDictionary *info=[notification userInfo];
    //获取键盘高度
    CGSize kbSize=[[info objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue].size;
    [UIView animateWithDuration:0.25f animations:^{
        
        self.followScroll.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-kbSize.height - 64);
        self.followScroll.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64);
   
        
    }completion:^(BOOL finished) {
        
    }];
}



#pragma mark 键盘将要隐藏
-(void)keyboardWillHidden:(NSNotification*)notification{
    [UIView animateWithDuration:0.25f animations:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            self.followScroll.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT);
        });
    }completion:^(BOOL finished) {
        
    }];
}


#pragma mark - 点击确定按钮
-(void)swithButtonFollowPlan
{
    if ([self.followView.resutlusButton.currentTitle isEqualToString:@"请选择"]) {
        [[Session sharedSession].tpView presentMessageTips:@"结果不能为空"];
        
    }else if (self.followView.yuanYinContent.text.length < 1){
        
        [[Session sharedSession].tpView presentMessageTips:@"原因不能为空"];

    }else if ([self.followView.startTimeButton.currentTitle isEqualToString:@"请选择时间"]){
    
        [[Session sharedSession].tpView presentMessageTips:@"请选择时间"];

    }else {
    
        NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"customer/contactRecords/save"];
        
        if (![CommonUtils objectIsValid:self.customerNameStr]) {
        
            self.customerNameStr = @"";
        }
        
        if (![CommonUtils objectIsValid:self.followView.textVIew.text]) {
            
            self.followView.textVIew.text = @"";
            
        }
        
        if (![CommonUtils objectIsValid:self.followView.tiXingTimeStr]) {
            
            self.followView.tiXingTimeStr = @"";
        }
        
        NSString *userId = [UserDefault getDataObjectForKey:@"managerID"];
        
    #pragma mark - 有时候崩是字段有空的
        NSDictionary *dict = @{@"cusId":self.customerIDStr,
                               @"cusFullname":self.customerNameStr,
                               @"conId":self.contactIdStr,
                               @"conName":self.contactNameStr,
                               @"ownerId":userId, // 登录人ID
                               @"ownerName":self.ownerNameStr,
                               @"visTitle":self.visitTitleStr,
                               @"relBusiType":@"SLL_VISITPLAN",
                               @"status":@"ACTIVE",
                               @"relBusiId":self.relBusiIdStr,
                               @"relBusiName":self.customerNameStr,
                               @"contactTime":self.followView.startTimeStr,
                               @"contactResult":self.followView.resultValue,
                               @"resultReason":self.followView.yuanYinContent.text,
                               @"contactContent":self.followView.textVIew.text,
                               @"needAppoint":[NSNumber numberWithBool:self.followView.statusButton.selected],
                               @"appointTime":self.followView.tiXingTimeStr,
                               };
        
        NSLog(@"------%@",dict);
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            [[Session sharedSession].tpView presentMessageTips:@"成功"];
            
            // 点击跟进调归档的接口
            [self getArchive];
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"UPLOADFOLLOWSTATUS" object:nil];
            
            [self.navigationController popViewControllerAnimated:YES];
            
            NSLog(@"%@",[responseObject JSONString]);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"%@",error);
        }];
    }
}

-(void)getArchive
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,VISITARCHIVE];
    
    NSDictionary *dict = @{@"ids":self.relBusiIdStr,@"status":@"PLANSTATUS_FOLLOW"};
    
    NSLog(@"------%@",dict);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [[Session sharedSession].loadView StopLoading];
        
        NSLog(@"------%@",[responseObject JSONString]);
       
        [self.navigationController popViewControllerAnimated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [[Session sharedSession].loadView StopLoading];
        
        NSLog(@"------%@",error);
    }];


}

@end
