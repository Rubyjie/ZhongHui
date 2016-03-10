//
//  RecordController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "RecordController.h"
#import "RecordCell.h"

@interface RecordController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *recordTable;
@end

@implementation RecordController

-(UITableView *)recordTable
{
    if (!_recordTable) {
        
        _recordTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64)];
        _recordTable.dataSource = self;
        _recordTable.delegate = self;
        _recordTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _recordTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"处理记录";
    
    self.recordTable.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.recordTable];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"approvalCellID";
    
    RecordCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        
        cell = [[RecordCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}




@end
