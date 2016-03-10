//
//  RecordViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/23.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "RecordViewController.h"
#import "MeRecordCell.h"

@interface RecordViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *recordTable;

@end

@implementation RecordViewController

-(UITableView *)recordTable
{
    if (!_recordTable) {
        
        _recordTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64)];
        _recordTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _recordTable.dataSource = self;
        _recordTable.delegate = self;
    }
    return _recordTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"处理记录";
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.recordTable];
    self.recordTable.backgroundColor = [UIColor clearColor];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"ProcesCellIdtenfier";
    
    MeRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[MeRecordCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
