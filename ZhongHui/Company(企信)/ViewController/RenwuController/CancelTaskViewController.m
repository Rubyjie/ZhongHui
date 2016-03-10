//
//  CancelTaskViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/18.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CancelTaskViewController.h"
#import "NextTaskCell.h"

@interface CancelTaskViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *cancelTable;

@end

@implementation CancelTaskViewController

-(UITableView *)cancelTable
{
    if (!_cancelTable) {
        
        _cancelTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40)];
        _cancelTable.dataSource = self;
        _cancelTable.delegate = self;
    }
    return _cancelTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:self.cancelTable];
    
//    CALayer *quanlayer = [[CALayer alloc] init];
//    quanlayer.frame = CGRectMake(20, 20, PHONE_UISCREEN_WIDTH-40, 40);
//    quanlayer.cornerRadius = 5;
//    quanlayer.backgroundColor = [UIColor whiteColor].CGColor;
//    quanlayer.borderColor = [UIColor blackColor].CGColor;
//    quanlayer.borderWidth = 1.0;
//    [self.view.layer addSublayer:quanlayer];


}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"CancelCellIdtenfier";
    
    NextTaskCell *CancelCell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!CancelCell) {
        
        CancelCell = [[NextTaskCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return CancelCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}




@end
