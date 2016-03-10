//
//  ZHTabBarController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/15.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ZHTabBarController.h"
#import "MeViewController.h"
#import "CRMViewController.h"
#import "CompanyViewController.h"
#import "YCTabBar.h"

@interface ZHTabBarController () <YCTabBarDelegate>

#pragma mark - 自定义的tabbar
@property (nonatomic,weak)YCTabBar *customTabBar;

@end

@implementation ZHTabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //初始化tabbar
    [self setupTabbar];

    // 初始化所有的子控制器
    [self setupAllChildViewController];
    
    
#warning 设置后台图标上显示的数字
    [UIApplication sharedApplication].applicationIconBadgeNumber = 10;

}

#pragma mark - view即将显示的时候调用
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"%@",self.tabBar.subviews);
    
#pragma mark - 删除系统的tabBar，tabBar继承UIControl
    for (UIView *child in self.tabBar.subviews) {
        
        if ([child isKindOfClass:[UIControl class]]) {
            
            [child removeFromSuperview];
        }
    }
}



-(void)setupTabbar
{
#pragma mark - 自定义的tabBar盖住了系统的tabbar
    YCTabBar *customTabBar = [[YCTabBar alloc]init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

// from原来选中的  to新选中的
-(void)tabbar:(YCTabBar *)tabbar didSelectedButtonForm:(NSInteger)from to:(NSInteger)to
{
//    NSLog(@"----%ld ---%ld",from,to);
    
    // 新选中的
    self.selectedIndex = to;
}


-(void)setupAllChildViewController
{
    CompanyViewController *company = [[CompanyViewController alloc]init];
    [self setupViewController:company imageName:@"企信1" selectedImageName:@"企信Select" title:@"企信"];
//    company.tabBarItem.badgeValue = @"100";
    
    CRMViewController *crm = [[CRMViewController alloc]init];
    [self setupViewController:crm imageName:@"CRM" selectedImageName:@"CRMSelect" title:@"CRM"];
    
    MeViewController *me = [[MeViewController alloc]init];
    [self setupViewController:me imageName:@"我的" selectedImageName:@"我的Select" title:@"我的"];

}


-(void)setupViewController:(UIViewController *)ChildVC imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName title:(NSString *)title
{
    // 1 设置控制器的属性
    ChildVC.title = title;
    //tabBarItem是模型，不是view
    ChildVC.tabBarItem.image = [UIImage imageWithName:imageName];
    //选中的图片
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    if (iOS7) {
        //图片不要渲染（imageWithRenderingMode），因为7默认会渲染成蓝色
        ChildVC.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    }else{
        //ios6里没有渲染的方法
        ChildVC.tabBarItem.selectedImage = selectedImage;
    }
    // 2.包装一个导航控制器
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:ChildVC];
    navi.navigationBar.barTintColor = NAV_COLOR;
    navi.navigationBar.translucent = NO; //导航栏不透明
    navi.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self addChildViewController:navi];
    
    // 3.添加tabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:ChildVC.tabBarItem];

}


@end
