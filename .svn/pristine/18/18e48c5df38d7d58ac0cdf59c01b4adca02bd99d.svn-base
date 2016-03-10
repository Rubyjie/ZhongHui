//
//  ToSubmitController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ToSubmitController.h"
#import "ApplicantCell.h"


@interface ToSubmitController () <UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong)UITableView *approvertable;

@end

@implementation ToSubmitController

-(UITableView *)approvertable
{
    if (!_approvertable) {
        
        _approvertable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64)];
        _approvertable.dataSource = self;
        _approvertable.delegate = self;
        _approvertable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _approvertable;

}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.approvertable];
    self.approvertable.backgroundColor = [UIColor clearColor];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"ToSubCellIdtenfier";
    
    ApplicantCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[ApplicantCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
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
