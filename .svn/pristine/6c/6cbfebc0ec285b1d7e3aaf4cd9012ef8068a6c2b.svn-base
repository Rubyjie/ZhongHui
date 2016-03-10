//
//  ChooseFileController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/1.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "ChooseFileController.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "ChooseFileView.h"

#import "UserDefault.h"
#import "AFNetworking.h"

#import "PersonBaseClass.h"
#import "PersonData.h"

@interface ChooseFileController ()

@property (nonatomic, strong)PersonBaseClass *baseModel;

@property (nonatomic, strong)TPKeyboardAvoidingScrollView *scrollView;

@end

@implementation ChooseFileController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"修改档案";
    self.view.backgroundColor = [UIColor whiteColor];
    self.chooseView = [[ChooseFileView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 50*12+64)];
    
    self.chooseView.iconImage.image = self.imageView.image;
    
    self.scrollView = [[TPKeyboardAvoidingScrollView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
    self.scrollView.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, 12*50+64);
    [self.view addSubview:self.scrollView];
    //是否显示scrollView右边的滑动条NO为不显示
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.scrollView addSubview:self.chooseView];

    
    // 传过来个人档案信息
    [self getPersonFileData];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(saveFile)];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
}


#pragma mark 键盘将要出来
-(void)keyboardWillShow:(NSNotification*)notification{
    
    NSDictionary *info=[notification userInfo];
    //获取键盘高度
    CGSize kbSize=[[info objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue].size;
    [UIView animateWithDuration:0.25f animations:^{
        self.scrollView.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-kbSize.height - 64);
    }completion:^(BOOL finished) {
        
    }];
}



#pragma mark 键盘将要隐藏
-(void)keyboardWillHidden:(NSNotification*)notification{
    [UIView animateWithDuration:0.25f animations:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            self.scrollView.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT);
        });
    }completion:^(BOOL finished) {
        
    }];
}


-(void)saveFile
{
    NSLog(@"-----%@ ----%@",self.chooseView.positionText.text,self.chooseView.beizhuText.text);
    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/employee/update"];
    
    NSString *userId = [UserDefault getDataObjectForKey:@"managerID"];
    
    if ([self.chooseView.jiGouButton.titleLabel.text isEqualToString:self.chooseView.jiGouButton.currentTitle]) {
        
        self.chooseView.jiGouId = [UserDefault getDataObjectForKey:@"jiGouIdStr"];
    }
    
    if ([self.chooseView.shiyeButton.titleLabel.text isEqualToString:self.chooseView.shiyeButton.currentTitle]) {
        
        self.chooseView.shiyeValue = [UserDefault getDataObjectForKey:@"yeTaiStr"];
    }
    
    NSDictionary *dict = @{@"employeeName":self.chooseView.nameText.text,
                           @"employeeCode":self.chooseView.numberText.text,
                           @"orgId":self.chooseView.jiGouId,
                           @"gender":self.chooseView.sexButton.titleLabel.text,
                           @"organizationName":self.chooseView.jiGouButton.titleLabel.text,
                           @"organizationId":self.chooseView.jiGouId,
                           @"mobile":self.chooseView.phoneText.text,
                           @"email":self.chooseView.emailText.text,
                           @"duty":self.chooseView.zhiwuText.text,
                           @"position":self.chooseView.positionText.text, // 职位
                           @"yeTai":self.chooseView.shiyeValue,
                           @"description":self.chooseView.beizhuText.text,
                           @"status":self.chooseView.statusButton.titleLabel.text,
                           @"id":userId
                           };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager PUT:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSLog(@"----%@",[responseObject JSONString]);

        [[NSNotificationCenter defaultCenter] postNotificationName:@"CHANGEFILE" object:nil];
        [[Session sharedSession].tpView presentMessageTips:@"修改完成"];

        [self.navigationController popViewControllerAnimated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}


-(void)getPersonFileData
{
    self.chooseView.nameText.text = self.name;
    self.chooseView.numberText.text = self.number;
    [self.chooseView.sexButton setTitle:self.sex forState:UIControlStateNormal];
    [self.chooseView.jiGouButton setTitle:self.jiGou forState:UIControlStateNormal];
    self.chooseView.phoneText.text = self.phone;
    self.chooseView.emailText.text = self.email;
    self.chooseView.zhiwuText.text = self.zhiWu;
    self.chooseView.positionText.text = self.position;
    [self.chooseView.shiyeButton setTitle:self.shiYe forState:UIControlStateNormal];
    self.chooseView.beizhuText.text = self.beiZhu;
    [self.chooseView.statusButton setTitle:self.status forState:UIControlStateNormal];

}





@end
