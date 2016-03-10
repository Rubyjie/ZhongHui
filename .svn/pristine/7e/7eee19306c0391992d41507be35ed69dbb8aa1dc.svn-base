//
//  ChooseCustomerController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/28.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ChooseCustomerController.h"
#import "YCSearchBar.h"

#import "UserDefault.h"
#import "AFNetworking.h"
#import "MJRefresh.h"

#import "CustomerBaseClass.h"
#import "CustomerData.h"
#import "CustomerDatalist.h"



@interface ChooseCustomerController () <UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

{
    __block NSInteger page;
}

@property (nonatomic, strong)UITableView *chooseTable;
@property (nonatomic, strong)NSMutableArray *customerArray;

// 存放搜索客户的数组
@property (nonatomic, strong)NSMutableArray *searchCusNameArray;

@property (nonatomic, strong)UISearchBar *knowledgeSearchBar;


@end

@implementation ChooseCustomerController

-(NSMutableArray *)searchCusNameArray
{
    if (!_searchCusNameArray) {
        
        _searchCusNameArray = [NSMutableArray array];
    }
    return _searchCusNameArray;
}

-(NSMutableArray *)customerArray
{
    if (!_customerArray) {
        
        _customerArray = [NSMutableArray array];
    }
    return _customerArray;
}

-(UITableView *)chooseTable
{
    if (!_chooseTable) {
        
        _chooseTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64)];
        _chooseTable.dataSource = self;
        _chooseTable.delegate = self;
    }
    return _chooseTable;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"选择客户";
    
    [self.view addSubview:self.chooseTable];
    
    self.knowledgeSearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, PHONE_UISCREEN_WIDTH, 50)];
    self.knowledgeSearchBar.delegate = self;
    self.knowledgeSearchBar.layer.cornerRadius = 2.0;
    self.knowledgeSearchBar.layer.masksToBounds = YES;
    self.knowledgeSearchBar.barStyle = UIBarStyleDefault;
    self.knowledgeSearchBar.placeholder = @"请输入客户名称";
    self.chooseTable.tableHeaderView = self.knowledgeSearchBar;

    
//    // 获取客户名称，获取后拿客户的id获取联系人
//    [self getCustomerNameData];
    
    [self setupRefresh];

}


#pragma mark -- 点击键盘右下角的搜索调这个方法
-(void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [searchBar resignFirstResponder];
    
    self.knowledgeSearchBar.text = searchBar.text;
    
#pragma mark - 再次搜索时把原来的数组清空
    [self.searchCusNameArray removeAllObjects];
    
    // 搜索客户
    [self getSearchCustomerNameData];
    
}


-(void)getSearchCustomerNameData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,CUSTOMERQUERY];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *dict = @{@"cusFullName":self.knowledgeSearchBar.text,@"cusCode":@""};
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"----%@",[responseObject JSONString]);
        
        
        CustomerBaseClass *baseModel = [[CustomerBaseClass alloc]initWithDictionary:responseObject];
        
        if (baseModel.success) {
            
            for (int i =0 ; i < baseModel.data.datalist.count; i++) {
                
                [self.searchCusNameArray addObject:[baseModel.data.datalist objectAtIndex:i]];
            }
            
#pragma mark -- 搜索出数据后删除原来的数据
            [self.customerArray removeAllObjects];
#pragma mark -- 添加搜索出来的数据
            [self.customerArray addObjectsFromArray:self.searchCusNameArray];
#pragma mark -- 刷新table
            [self.chooseTable reloadData];
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];


}


-(void)setupRefresh{
    
    //1.下拉刷新（进入刷新状态就会调用self的headerRereshing）
    //    [self.tableView addHeaderWithTarget:self.tableView action:@selector(headerRereshing)];
    
    __unsafe_unretained typeof(self) myvc = self;
    
    [myvc.chooseTable addHeaderWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0)), dispatch_get_main_queue(), ^{
  
            
            page = 0;
            [myvc getCustomerDataWithStart:[NSString stringWithFormat:@"%ld",(long)page] limit:@"15"];
            // 刷新表格
            [self.chooseTable reloadData];
        });
        
    }];
    
    [self.chooseTable headerBeginRefreshing];
    
    //上拉刷新
    [myvc.chooseTable addFooterWithCallback:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 刷新表格
            page += 15;
            
            if (self.customerArray.count < page) {
                
                [[Session sharedSession].tpView presentFailureTips:@"已无更多数据"];
                
                [self.chooseTable footerEndRefreshing];
                
                
            }else{
                
                [myvc getCustomerDataWithStart:[NSString stringWithFormat:@"%ld",(long)page] limit:@"15"];
            }
            
        });
    }];
    
    //设置文字（也可以不设置,默认的文字在MJRefreshConst中修改）

}



-(void)getCustomerDataWithStart:(NSString *)start limit:(NSString *)limit
{
    [[Session sharedSession].loadView StartLoading];
    
    NSString *urls = [NSString stringWithFormat:@"%@%@",MAINURL,CustomerListData];
    
    NSString *Str = [NSString stringWithFormat:@"%@%@%@%@",@"start=",start,@"&limit=",limit];
    NSString *url = [NSString stringWithFormat:@"%@%@",urls,Str];
    NSLog(@"---%@",url);
    
    NSDictionary *dict = @{@"id":@""};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"---%@",[responseObject JSONString]);
        
        if (page == 0) {
            
            [self.customerArray removeAllObjects];
        }
        
        [[Session sharedSession].loadView StopLoading];
        
        CustomerBaseClass *baseModel = [[CustomerBaseClass alloc]initWithDictionary:responseObject];
        
        if (baseModel.success) {
            
            for (int i = 0; i < baseModel.data.datalist.count; i++) {
                
                [self.customerArray addObject:[baseModel.data.datalist objectAtIndex:i]];
            }
            
        }
        [self.chooseTable headerEndRefreshing];
        [self.chooseTable footerEndRefreshing];
        [self.chooseTable reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [[Session sharedSession].loadView StopLoading];
        [self.chooseTable headerEndRefreshing];
        [self.chooseTable footerEndRefreshing];
        
        //        NSLog(@"==== %@",[[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding]);
    }];
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.customerArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"contractCellIdtenfier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    CustomerDatalist *listModel = [self.customerArray objectAtIndex:indexPath.row];
    cell.textLabel.text = listModel.cusFullName;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomerDatalist *listModel = [self.customerArray objectAtIndex:indexPath.row];
        
//    if ([self.delegate performSelector:@selector(popCustomerAddCluesWithName:cusId:cusLevel:type:jiTuan:userXZ:address:jyXZ:postCode:)]) {
    
   

    
        [self.delegate popCustomerAddCluesWithName:listModel.cusFullName cusId:listModel.datalistIdentifier cusLevel:listModel.startLevelName type:listModel.cusTypeName jiTuan:listModel.cusTypeName userXZ:listModel.userNatureName address:listModel.regionAddr jyXZ:listModel.bustNatureName postCode:listModel.postcode openTime:@""];
        [self.navigationController popViewControllerAnimated:YES];

//    }
}

@end
