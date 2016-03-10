//
//  AppDelegate.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/15.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "AppDelegate.h"
#import "ZHTabBarController.h"
#import "LogInViewController.h"
#import "SDWebImageManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //去掉导航栏返回按钮的字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    //按钮的颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangeRootController:) name:CHANGEROOTCONTROLLER object:nil];

    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[LogInViewController alloc]init];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)ChangeRootController:(NSNotification *)noti
{
    
    BOOL islogin = [[Session sharedSession] checkUserLoginStatus];
    
    if (islogin == YES) {
        
        [[Session sharedSession] saveLoginKey];
        
        ZHTabBarController *tabBarVC = [[ZHTabBarController alloc]init];
        self.window.rootViewController = tabBarVC;
        
    }else{
        
        LogInViewController *loginvc = [[LogInViewController alloc]init];
        self.window.rootViewController = loginvc;
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}


#pragma mark - app进入后台会调用这个方法
- (void)applicationDidEnterBackground:(UIApplication *)application {

    // 在后台开启任务让程序持续运行状态（能持续运行的时间是不确定的，比方有好几个程序都在后台）
    [application beginBackgroundTaskWithExpirationHandler:^{
        
        NSLog(@"过期了");
        
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#warning 清除缓存的方法
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    // 停止下载所有图片
    [[SDWebImageManager sharedManager] cancelAll];
    
    // 清除内存中的图片
    [[SDWebImageManager sharedManager].imageCache clearMemory];
    
}


@end
