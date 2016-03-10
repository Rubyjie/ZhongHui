//
//  GongGaoViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/19.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "GongGaoViewController.h"
#import "GongGaoCell.h"

@interface GongGaoViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *gongGaoTable;

@end

@implementation GongGaoViewController

-(UITableView *)gongGaoTable
{
    if (!_gongGaoTable) {
        
        _gongGaoTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40)];
        _gongGaoTable.dataSource = self;
        _gongGaoTable.delegate = self;
        _gongGaoTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _gongGaoTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.gongGaoTable.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.gongGaoTable];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"gongGaoCellIdtenfier";
    
    GongGaoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[GongGaoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}





@end
