//
//  RegisterViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/17.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"

#import "DES.h"
#import "NSString+Addition.h"
#import "UserDefault.h"
#import "AFNetworking.h"

@interface RegisterViewController () <registeredButtonDelegate>

@property (nonatomic, strong)RegisterView *registe;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    
    self.title = @"修改密码";
    [super viewDidLoad];
    self.view.backgroundColor = RGB(227, 227, 227);
    self.registe = [[RegisterView alloc]initWithFrame:self.view.bounds];
    self.registe.delegate = self;
    [self.view addSubview:self.registe];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[Session sharedSession].loadView StopLoading];

}


-(void)selectedButtonRegister
{
    [[Session sharedSession].loadView StartLoading];
    
#pragma mark - 先校验密码
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/user/check-pwd"];
    NSString *userId = [UserDefault getDataObjectForKey:@"userIdStr"];

    NSString *passWord = [[NSString stringWithFormat:@"%@",self.registe.passText.text]md5String];

    NSDictionary *dict = @{@"id":userId,@"password":passWord};
    
    NSLog(@"---%@",dict);
    
    AFHTTPRequestOperationManager *mag = [AFHTTPRequestOperationManager manager];
    
    [mag POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        [[Session sharedSession].loadView StopLoading];
        
        if ([responseObject objectForKey:@"success"]) {
            
            BOOL isCorrect = [[responseObject objectForKey:@"data"]boolValue];
            
            if (isCorrect) {
                
#pragma mark - 校验成功后修改密码
                [self upDataPassWord];

            } else {
                
                [[Session sharedSession].tpView presentMessageTips:@"原密码错误"];
                
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [[Session sharedSession].loadView StopLoading];
        
        NSLog(@"%@",error);
    }];
    
}

-(void)upDataPassWord
{
    if (![self.registe.PWd.text isEqualToString:self.registe.confirmPassWd.text]) {
        
        [[Session sharedSession].tpView presentMessageTips:@"俩次输入的新密码不一致"];
        
        return;
    }
    
    NSString *surl = [NSString stringWithFormat:@"%@%@",MAINURL,ChangePassWord];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    NSString *userId = [UserDefault getDataObjectForKey:@"userIdStr"];

    
    // 修改密码后加密
    NSString *passWord = [[NSString stringWithFormat:@"%@",self.registe.confirmPassWd.text]md5String];

    NSDictionary *dict = @{@"id":userId,@"password":passWord};

    [manager POST:surl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {

        if ([responseObject objectForKey:@"success"]) {
            
            [[Session sharedSession].loadView StopLoading];
            
            [self.navigationController popViewControllerAnimated:YES];
            
            [[Session sharedSession].tpView presentMessageTips:@"修改成功"];

        }
        
#pragma mark - 修改成功后还根据这个key替换密码
         [UserDefault setDataObject:self.registe.confirmPassWd.text forKey:@"password"];
        
        
        NSLog(@"----%@",self.registe.confirmPassWd.text);
        
        NSLog(@"%@",[responseObject JSONString]);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

        [[Session sharedSession].loadView StopLoading];

        NSLog(@"%@",error);
    }];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
