//
//  VisitViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "VisitViewController.h"
#import "VisitCell.h"

@interface VisitViewController () <UITableViewDataSource,UITableViewDelegate>

{
    NSArray *visitArray;
}

@property (nonatomic, strong)UITableView *visitTable;
@end

@implementation VisitViewController

-(UITableView *)visitTable
{
    if (!_visitTable) {
        
        _visitTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40)];
        _visitTable.dataSource = self;
        _visitTable.delegate = self;
    }
    return _visitTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"拜访";
    
    visitArray = @[@"拜访方式",@"拜访时间",@"地址/号码",@"结果",@"原因",@"内容",@"预约"];

    self.view.backgroundColor = RGB(227, 227, 227);
    self.visitTable.backgroundColor = [UIColor clearColor];

    [self.view addSubview:self.visitTable];
    
    UIButton *determineButton = [UIButton buttonWithType:UIButtonTypeCustom];
    determineButton.backgroundColor = RGB(0, 195, 236);
    determineButton.frame = CGRectMake(20, 440, PHONE_UISCREEN_WIDTH - 20-20, 30);
    [determineButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.view addSubview: determineButton];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return visitArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"workCellIdtenfier";
    
    VisitCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    
    if (!cell) {
        
        cell = [[VisitCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.visitLabel.text = visitArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
