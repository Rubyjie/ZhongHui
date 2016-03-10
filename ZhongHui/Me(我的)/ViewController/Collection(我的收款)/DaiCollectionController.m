//
//  DaiCollectionController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "DaiCollectionController.h"
#import "ApplyViewController.h"
#import "FapiaoChangeController.h"

#import "CollectionCell.h"


@interface DaiCollectionController () <UITableViewDataSource,UITableViewDelegate,CollectionCellButtonDelegate>

@property (nonatomic, strong)UITableView *daiCollectiocTable;

@end

@implementation DaiCollectionController

-(UITableView *)daiCollectiocTable
{
    if (!_daiCollectiocTable) {
        
        _daiCollectiocTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40)];
        _daiCollectiocTable.dataSource = self;
        _daiCollectiocTable.delegate = self;
        _daiCollectiocTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _daiCollectiocTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.daiCollectiocTable];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"ColletcionCellIdtenfier";
    
    CollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[CollectionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.delegate = self;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - 80申请发票  81变更
-(void)selectedButtonWithTag:(NSInteger)tag
{
    if (tag == 80) {
        
        NSLog(@"发票申请");
        ApplyViewController *applyVC = [[ApplyViewController alloc]init];
        [self.navigationController pushViewController:applyVC animated:YES];
        
    }else if (tag == 81){
        
        FapiaoChangeController *fapiaoChange = [[FapiaoChangeController alloc]init];
        [self.navigationController pushViewController:fapiaoChange animated:YES];
        
    }

}



@end
