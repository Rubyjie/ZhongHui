//
//  AddressViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "AddressViewController.h"
#import "AddressBookCell.h"

@interface AddressViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *addressTable;

@end

@implementation AddressViewController

-(UITableView *)addressTable
{
    if (!_addressTable) {
        
        _addressTable =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64-40)];
        _addressTable.dataSource = self;
        _addressTable.delegate = self;
    }
    return _addressTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"通讯录";
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.addressTable];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"contractCellIdtenfier";
    
    AddressBookCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    
    if (!cell) {
        
        cell = [[AddressBookCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


@end
