//
//  MessageViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/19.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "MessageViewController.h"
#import "YiDuMessageCell.h"

@interface MessageViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *messageTable;
@end

@implementation MessageViewController

-(UITableView *)messageTable
{
    if (!_messageTable) {
        
        _messageTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40)];
        _messageTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _messageTable.dataSource = self;
        _messageTable.delegate = self;
    }
    return _messageTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"已读消息";
    
    self.messageTable.backgroundColor = [UIColor clearColor];

    self.view.backgroundColor = RGB(227, 227, 227);
    [self.view addSubview:self.messageTable];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"messageCellIdtenfier";
    
    YiDuMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[YiDuMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}




@end
