//
//  LogInViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/17.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "LogInViewController.h"
#import "ZHTabBarController.h"
#import "RegisterViewController.h"
#import "LogInView.h"

#import "HttpTool.h"
#import "JSONKit.h"
#import "UserDefault.h"
#import "DES.h"
#import "NSString+Addition.h"


@interface LogInViewController () <logButtonDelegate>

@property (nonatomic, strong)LogInView *logView;

@property (nonatomic, strong)NSString *passWD;

@end

@implementation LogInViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    LogInView *logView = [[LogInView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
    logView.mdelegate = self;
    self.logView = logView;
    [self.view addSubview:logView];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1"]]];
    
    
    //路径
    NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)lastObject];
    
    NSLog(@"libarary 目录是:%@",libraryPath);
    
    //初始化数据
    [self initDataByUserDefault];
    
}


-(void)initDataByUserDefault{
    
    //获取全局的NSUserDefault对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    //取出来数据，方便登录成功后存储信息
    NSString *numberStr = [defaults objectForKey:@"number"];
    NSString *passwordStr = [defaults objectForKey:@"password"];
    
    if (numberStr) {
        
        self.logView.userName.text = numberStr;
    }
    if (passwordStr) {
        
        self.logView.password.text = passwordStr;
    }
    
}


#pragma mark - 登录
-(void)swithButtonLogInWithUserName:(NSString *)userName passWord:(NSString *)password
{
    [[Session sharedSession].loadView StartLoading];
    
    if (self.logView.userName.text.length < 1 ) {
        
        //提示工号不能为空
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"工号不能为空" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [[Session sharedSession].loadView StopLoading];

        [alert show];
        
        return;
    
    }/*else if (![self.logView.password.text isEqualToString:[UserDefault getDataObjectForKey:@"password"]]){
        
        [[Session sharedSession].loadView StopLoading];

        //提示密码错误
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"密码错误" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        return;
    }*/

    
    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,LogInURL];
    
    self.passWD = [[NSString stringWithFormat:@"%@",password]md5String];
    
    NSDictionary *dict = @{@"username":userName,@"password":self.passWD,@"code":@"上海优创"};
    
#warning 自己封装的post请求
    [HttpTool postWithUrl:url params:dict success:^(id json) {
        
        if ([json objectForKey:@"success"]) {
            
            [[Session sharedSession].loadView StopLoading];
            
#pragma mark --- 登录成功后保存账号密码
            [self seveLoginPassWd];
            
            NSDictionary *namedict = [json objectForKey:@"data"];
            //保存登录人的id
            NSString *idStr = [namedict objectForKey:@"id"];
            [UserDefault setDataObject:idStr forKey:@"managerID"];
            
            // 修改密码时的userId
            NSString *userId = [namedict objectForKey:@"userId"];
            [UserDefault setDataObject:userId forKey:@"userIdStr"];
            
            // 保存登录人的姓名
            //            NSString *name = [namedict objectForKey:@"modifierName"];
            NSString *name = [namedict objectForKey:@"employeeName"];
            [UserDefault setDataObject:name forKey:@"logInName"];
            
            // 机构id
            NSString *jiGouId = [namedict objectForKey:@"orgId"];
            [UserDefault setDataObject:jiGouId forKey:@"jiGouIdStr"];
            
            // 业态
            NSString *yeTai = [namedict objectForKey:@"yeTai"];
            [UserDefault setDataObject:yeTai forKey:@"yeTaiStr"];
            
            ZHTabBarController *tabBar = [[ZHTabBarController alloc]init];
            [self presentViewController:tabBar animated:YES completion:nil];
            
        }
    } failure:^(NSError *error) {
        
        NSLog(@"%@",error);
    }];
}

#pragma mark - 保存账号密码
-(void)seveLoginPassWd
{
    //4. 在触发方法中去保存你要保存的数据
    //使用defaults来保存用户数据的名字/年龄文本;存数据
    //使用封装的方法来存值
    [UserDefault setDataObject:self.logView.userName.text forKey:@"number"];
    [UserDefault setDataObject:self.logView.password.text forKey:@"password"];
    
    //调服务器接口   如果登陆成功了保存登录成功返回的key
    [[Session sharedSession] saveLoginKey];
}



@end
