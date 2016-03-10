//
//  CluesViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CluesViewController.h"
#import "CluesCell.h"
#import "YCSearchBar.h"

@interface CluesViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *cluesTable;
@end

@implementation CluesViewController

-(UITableView *)cluesTable
{
    if (!_cluesTable) {
        
        _cluesTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64)];
        _cluesTable.dataSource = self;
        _cluesTable.delegate = self;
        _cluesTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _cluesTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"线索";
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.cluesTable];
    self.cluesTable.backgroundColor = [UIColor clearColor];
    
    YCSearchBar *search = [[YCSearchBar alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 35)];
    search.placeholder = @"搜索";
    self.cluesTable.tableHeaderView = search;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cluesCellIdtenfier";
    
    CluesCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    
    if (!cell) {
        
        cell = [[CluesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}



@end
