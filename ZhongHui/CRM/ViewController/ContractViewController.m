//
//  ContractViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ContractViewController.h"
#import "ContractCell.h"

@interface ContractViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *contractTable;
@end

@implementation ContractViewController

-(UITableView *)contractTable
{
    if (!_contractTable) {
        _contractTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64)];
        _contractTable.dataSource = self;
        _contractTable.delegate = self;
        _contractTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _contractTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(227, 227, 227);
    self.title = @"联系人";
    self.contractTable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.contractTable];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"contractCellIdtenfier";
    
    ContractCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    
    if (!cell) {
        
        cell = [[ContractCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}




@end
