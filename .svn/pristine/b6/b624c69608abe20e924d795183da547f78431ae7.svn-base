//
//  DocumentController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/13.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "DocumentController.h"
#import "DocumentView.h"
#import "DocumentCell.h"


#import "AFNetworking.h"

@interface DocumentController () <UITableViewDataSource,UITableViewDelegate,downLoadButtonDelegate,UIWebViewDelegate>

@property (nonatomic, strong)UITableView *documentTable;

@property (nonatomic, strong)NSDictionary *dict;

@property (nonatomic, strong)NSArray *dataArray;

@end

@implementation DocumentController

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[Session sharedSession].loadView StopLoading];
}


-(UITableView *)documentTable
{
    if (!_documentTable) {
        
        _documentTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        _documentTable.dataSource = self;
        _documentTable.delegate = self;
        
    }
    return _documentTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(227, 227, 227);
    
    self.title = @"文档";
    
    DocumentView *documentView = [[DocumentView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 40)];
    documentView.backgroundColor = RGB(227, 227, 227);
    
    self.documentTable.tableHeaderView = documentView;
    [self.view addSubview:self.documentTable];
    
#pragma mark - 获取客户文档数据
    [self getCustomerDocumentData];

}


-(void)getCustomerDocumentData
{
    NSString *cusUrl = [NSString stringWithFormat:@"%@%@",MAINURL,@"customer/customerDocument/pageQuery"];
    
    NSDictionary *dict = @{@"customerId":self.cusId};
    
    AFHTTPRequestOperationManager *mag = [AFHTTPRequestOperationManager manager];
    
    [mag POST:cusUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"---%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dataDict = [responseObject objectForKey:@"data"];
            
            NSArray *dataArray = [dataDict objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i++) {
                
                self.dict = [dataArray objectAtIndex:i];
                
#pragma mark - 获取附件信息
                [self getAttachmentDataWithId:[self.dict objectForKey:@"id"]];
                
            }
        }
        
        [self.documentTable reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}


-(void)getAttachmentDataWithId:(NSString *)idStr
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"attachment/query"];
    
    NSDictionary *dict = @{@"bid":idStr};
    
    AFHTTPRequestOperationManager *mag = [AFHTTPRequestOperationManager manager];
    
    [mag GET:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            self.dataArray = [responseObject objectForKey:@"data"];
            
        }
        
        [self.documentTable reloadData];
     
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"----%@",error);
    }];
    
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"documentCellId";
    
    DocumentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[DocumentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.delegate = self;
    
    NSDictionary *dict = self.dataArray[indexPath.row];
    
    cell.documentId = [dict objectForKey:@"id"];
    
    cell.nameLabel.text = [self.dict objectForKey:@"docName"];
    cell.typeLabel.text = [self.dict objectForKey:@"docTypeName"];
    [cell.downButton setTitle:[dict objectForKey:@"fileName"] forState:UIControlStateNormal];
    
    return cell;
}

-(void)swithButtonDownLoadAttachmentWithDocumentId:(NSString *)documentId
{
    NSString *url = [NSString stringWithFormat:@"%@%@%@",MAINURL,@"attachment/download?id=",documentId];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
    
//    web.scalesPageToFit = YES;

    web.delegate = self;
    [web sizeToFit];

//    [web goForward]; //前进
//    [web goBack];    //后退
    [self.view addSubview:web];
    
    
    [web loadRequest:request];
    
    UIScrollView *scollview=(UIScrollView *)[[web subviews]objectAtIndex:0];
    scollview.bounces=NO;

//    NSLog(@"-----%@",url);
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//
//    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSLog(@"----%@",[responseObject JSONString]);
//        
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        NSLog(@"%@",error);
//    }];
    
}


#pragma mark - webView开始加载时
- (void) webViewDidStartLoad:(UIWebView *)webView
{

    [[Session sharedSession].loadView StartLoading];
}

#pragma mark - webView加载成功时
- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    
    [[Session sharedSession].loadView StopLoading];
}

#pragma mark - webView加载失败时
- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [[Session sharedSession].loadView StopLoading];
}

//1.隐藏上下滚动时出边界的后面的黑色的阴影
- (void) hideGradientBackground:(UIView*)theView
{
    for (UIView * subview in theView.subviews)
    {
        if ([subview isKindOfClass:[UIImageView class]])
            subview.hidden = YES;
        
        [self hideGradientBackground:subview];
    }
}

//2. 禁用拖拽时的反弹效果
//[(UIScrollView *)[[webView subviews] objectAtIndex:0] setBounces:NO];


@end
