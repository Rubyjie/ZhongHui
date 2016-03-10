//
//  WorkViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/19.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "WorkViewController.h"
#import "VisitViewController.h"   //拜访
#import "InvitedViewController.h" //邀请
#import "WorkTiXingController.h"  //提醒
#import "WorkCell.h"

@interface WorkViewController () <UITableViewDelegate,UITableViewDataSource,workButtonDelegate>

@property (nonatomic, strong)UITableView *workTable;

@end

@implementation WorkViewController

-(UITableView *)workTable
{
    if (!_workTable) {
        
        _workTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64)];
        _workTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _workTable.dataSource = self;
        _workTable.delegate = self;
    }
    return _workTable;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"工作提醒";
    self.workTable.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.workTable];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"workCellIdtenfier";
    
    WorkCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    
    if (!cell) {
        
        cell = [[WorkCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.delegate = self;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

#pragma  mark - 500拜访 501邀请 502提醒
-(void)swithButtonWithTag:(NSInteger)tag
{
    NSLog(@"工作提醒里面的button点击了");
    
    if (tag == 500) {
        
        VisitViewController *visit = [[VisitViewController alloc]init];
        [self.navigationController pushViewController:visit animated:YES];
        
    }else if (tag == 501){
    
        InvitedViewController *invited = [[InvitedViewController alloc]init];
        [self.navigationController pushViewController:invited animated:YES];
    
    }else if (tag == 502){
    
        WorkTiXingController *tiXing = [[WorkTiXingController alloc]init];
        [self.navigationController pushViewController:tiXing animated:YES];

    }

}


@end
