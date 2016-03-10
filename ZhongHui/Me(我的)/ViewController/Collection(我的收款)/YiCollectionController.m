//
//  YiCollectionController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "YiCollectionController.h"
#import "CollectQueryController.h" //收款查询
#import "YiColletcionCell.h"
#import "YCSearchBar.h"

@interface YiCollectionController () <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic, strong)UITableView *YiCollectionTable;
@end

@implementation YiCollectionController

-(UITableView *)YiCollectionTable
{
    if (!_YiCollectionTable) {
        _YiCollectionTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40)];
        _YiCollectionTable.dataSource = self;
        _YiCollectionTable.delegate = self;
        _YiCollectionTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _YiCollectionTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.YiCollectionTable];
    self.YiCollectionTable.backgroundColor = [UIColor clearColor];
    YCSearchBar *search = [YCSearchBar searchBar];
    search.placeholder = @"收款记录查询";
    search.delegate = self;
    search.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 30);
    self.YiCollectionTable.tableHeaderView = search;
    
}

#pragma mark - 点击textField push出页面
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    CollectQueryController *collectQuery = [[CollectQueryController alloc]init];
    [self.navigationController pushViewController:collectQuery animated:YES];
    
    return NO;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"YiColletcionCellIdtenfier";
    
    YiColletcionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[YiColletcionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}



@end
