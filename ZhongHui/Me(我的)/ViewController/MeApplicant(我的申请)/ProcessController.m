//
//  ProcessController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ProcessController.h"
#import "CuiDanViewController.h" //催单
#import "RecordViewController.h" //记录
#import "MeCaseViewController.h" //结案
#import "UndoViewController.h"   //撤销
#import "ProcesCell.h"

@interface ProcessController () <UITableViewDelegate,UITableViewDataSource,ProcesCellDelegate>

@property (nonatomic, strong)UITableView *processTable;

@end

@implementation ProcessController

-(UITableView *)processTable
{
    if (!_processTable) {
        
        _processTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64-40)];
        _processTable.dataSource = self;
        _processTable.delegate = self;
        _processTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _processTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.processTable];
    self.processTable.backgroundColor = [UIColor clearColor];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"ProcesCellIdtenfier";
    
     ProcesCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[ProcesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
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


#pragma mark - 1200催单  1201记录  1202结案  1203撤销
-(void)swithProcesCellButtonWithTag:(NSInteger)tag
{
    if (tag == 1200) {
        
        CuiDanViewController *cuidan = [[CuiDanViewController alloc]init];
        [self.navigationController pushViewController:cuidan animated:YES];
        
    }else if (tag == 1201){
    
        RecordViewController *record = [[RecordViewController alloc]init];
        [self.navigationController pushViewController:record animated:YES];
    
    }else if (tag == 1202){
    
        MeCaseViewController *meCase = [[MeCaseViewController alloc]init];
        [self.navigationController pushViewController:meCase animated:YES];
    
    }else if (tag == 1203){
    
        UndoViewController *unDo = [[UndoViewController alloc]init];
        [self.navigationController pushViewController:unDo animated:YES];
    
    }

}



@end
