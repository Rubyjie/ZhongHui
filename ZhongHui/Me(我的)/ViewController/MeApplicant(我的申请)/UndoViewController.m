//
//  UndoViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/23.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "UndoViewController.h"
#import "UndoView.h"

@interface UndoViewController ()

@end

@implementation UndoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"撤销";
    self.view.backgroundColor = RGB(227, 227, 227);
    
    UndoView *unDo = [[UndoView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:unDo];
}


@end
