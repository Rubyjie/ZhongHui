//
//  CustomerController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CustomerController.h"
#import "CustomerSearchController.h"  // 客户搜索
#import "CustomerCell.h"
#import "YCSearchBar.h"

#import "AFNetworking.h"


@interface CustomerController () <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (nonatomic, strong)UITableView *customerTable;


@end

@implementation CustomerController

-(UITableView *)customerTable
{
    if (!_customerTable) {
        
        _customerTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64)];
        _customerTable.dataSource = self;
        _customerTable.delegate = self;
        _customerTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _customerTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"客户";
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.customerTable];
    self.customerTable.backgroundColor = [UIColor clearColor];
    
    YCSearchBar *search = [[YCSearchBar alloc]initWithFrame:CGRectMake(10, 0, PHONE_UISCREEN_WIDTH-20, 35)];
    search.placeholder = @"搜索";
    search.delegate = self;
    self.customerTable.tableHeaderView = search;
    
    // 获取客户数据
    [self getCustomerData];
    
}

-(void)getCustomerData
{
    NSString *urls = [NSString stringWithFormat:@"%@%@",MAINURL,CustomerListData];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:urls parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"---%@",[responseObject JSONString]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
        NSLog(@"==== %@",[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
    }];

}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"contractCellIdtenfier";
    
    CustomerCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    
    if (!cell) {
        
        cell = [[CustomerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}




- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    CustomerSearchController *customerSearch = [[CustomerSearchController alloc]init];
    [self.navigationController pushViewController:customerSearch animated:YES];
    
    return NO;
}

@end
