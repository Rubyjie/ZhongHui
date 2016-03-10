//
//  CaseController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CaseController.h"
#import "JieAnCell.h"

@interface CaseController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *jieAnTable;

@end

@implementation CaseController

-(UITableView *)jieAnTable
{
    if (!_jieAnTable) {
        
        _jieAnTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64-40)];
        _jieAnTable.dataSource = self;
        _jieAnTable.delegate = self;
        _jieAnTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _jieAnTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"已结案";
    
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.jieAnTable];
    self.jieAnTable.backgroundColor = [UIColor clearColor];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"ProcesCellIdtenfier";
    
    JieAnCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[JieAnCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
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


@end
