//
//  ProcesTaskController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/23.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ProcesTaskController.h"
#import "ProcesTaskView.h"

@interface ProcesTaskController ()

@end

@implementation ProcesTaskController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"任务处理";
    ProcesTaskView *procesTask = [[ProcesTaskView alloc]initWithFrame:self.view.bounds];
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:procesTask];

}


@end
