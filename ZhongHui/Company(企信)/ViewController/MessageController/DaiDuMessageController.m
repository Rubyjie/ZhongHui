//
//  DaiDuMessageController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/19.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "DaiDuMessageController.h"
#import "ReplyMessageController.h"  //回复
#import "MessagCell.h"

@interface DaiDuMessageController () <UITableViewDataSource,UITableViewDelegate,replyButtonDelegate>

@property (nonatomic, strong)UITableView *messageTable;
@end

@implementation DaiDuMessageController

-(UITableView *)messageTable
{
    if (!_messageTable) {
        
        _messageTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40)];
        _messageTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _messageTable.dataSource = self;
        _messageTable.delegate = self;
//        _messageTable.tableFooterView = nil;
    }
    return _messageTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"待读消息";
    self.messageTable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.messageTable];
    self.view.backgroundColor = RGB(227, 227, 227);
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *yiDuCellID = @"YiDuMessageCellId";
    
    MessagCell *cell = [tableView dequeueReusableCellWithIdentifier:yiDuCellID];
    
    if (!cell) {
        
        cell = [[MessagCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:yiDuCellID];
    }
    cell.delegate = self;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(void)swithButtonReplyMessage
{
    ReplyMessageController *reply = [[ReplyMessageController alloc]init];
    [self.navigationController pushViewController:reply animated:YES];
}

@end
