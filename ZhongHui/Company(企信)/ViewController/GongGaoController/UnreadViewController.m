//
//  UnreadViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/19.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "UnreadViewController.h"
#import "ReadGongGaoCell.h"
#import "YCSearchBar.h"

@interface UnreadViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *readTable;

@end

@implementation UnreadViewController

-(UITableView *)readTable
{
    if (!_readTable) {
        _readTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64- 40)];
        _readTable.dataSource = self;
        _readTable.delegate = self;
        _readTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _readTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"已读公告";
    YCSearchBar *searchBar = [YCSearchBar searchBar];
    searchBar.frame = CGRectMake(100, 0, PHONE_UISCREEN_WIDTH-60, 30);
    self.readTable.tableHeaderView = searchBar;
    self.readTable.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.readTable];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"gongGaoCellIdtenfier";
    
    ReadGongGaoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[ReadGongGaoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end
