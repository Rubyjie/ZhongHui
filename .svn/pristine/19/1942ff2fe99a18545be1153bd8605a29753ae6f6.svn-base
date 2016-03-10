//
//  CustomerSearchController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CustomerSearchController.h"
#import "CustomerSearchView.h"

@interface CustomerSearchController ()

@end

@implementation CustomerSearchController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"客户搜索";
    CustomerSearchView *searchView = [[CustomerSearchView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 550)];
    UIScrollView *scrollVIew = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
    scrollVIew.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, 600);
    [self.view addSubview:scrollVIew];
    [scrollVIew addSubview:searchView];
    self.view.backgroundColor = RGB(227, 227, 227);
}


@end
