//
//  CluesSearchController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/24.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CluesSearchController.h"
#import "ChooseCustomerController.h"

#import "CluesSearchView.h"

#import "UserDefault.h"
#import "AFNetworking.h"

#import "cluesBaseClass.h"
#import "cluesData.h"
#import "cluesDatalist.h"




@interface CluesSearchController () <jiTuanButtonDelegate,popCustomerViewDelegate>

@property (nonatomic, strong)UITableView *cluesSearchTable;

@property (nonatomic, strong)NSMutableArray *searchClueArray;

@property (nonatomic, strong)NSArray *titleArray;

@property (nonatomic, strong)CluesSearchView *cluesView;

@property (nonatomic, strong)NSString *jiTuanId;


@end

@implementation CluesSearchController

-(void)popCustomerAddCluesWithName:(NSString *)name cusId:(NSString *)cusId cusLevel:(NSString *)cusLevel type:(NSString *)type jiTuan:(NSString *)jiTuan userXZ:(NSString *)userXZ address:(NSString *)address jyXZ:(NSString *)jyXZ postCode:(NSString *)postCode openTime:(NSString *)openTime
{
    [self.cluesView.jiTuanButton setTitle:name forState:UIControlStateNormal];
    [self.cluesView.jiTuanButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.jiTuanId = cusId;
}

-(void)swithButtonChooseCustomerWithTag:(NSInteger)tag
{
    if (tag == 13) {
        
        ChooseCustomerController *chooseCus = [[ChooseCustomerController alloc]init];
        chooseCus.delegate = self;
        [self.navigationController pushViewController:chooseCus animated:YES];
    }

}

-(CluesSearchView *)cluesView
{
    if (!_cluesView) {
        
        _cluesView = [[CluesSearchView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH,13*50+64)];
        _cluesView.delegate = self;
    }
    return _cluesView;
}

-(NSMutableArray *)searchClueArray
{
    if (!_searchClueArray) {
        
        _searchClueArray = [NSMutableArray array];
    }
    return _searchClueArray;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
//    self.titleArray = @[@"负责人",@"星级",@"类型",@"所属集团",@"用户性质",@"经营性质",@"地址",@"来源类型",@"来源",@"发现时间",@"状态",@"归属状态",@"归属机构"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"搜索" style:UIBarButtonItemStyleDone target:self action:@selector(searchClues)];
    
    self.title = @"线索搜索";
    self.view.backgroundColor = [UIColor whiteColor];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
    scrollView.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, 13*50+64);
    [self.view addSubview:scrollView];
    [scrollView addSubview:self.cluesView];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

-(void)searchClues
{
    
    [[Session sharedSession].loadView StartLoading];
    NSString *userName = [UserDefault getDataObjectForKey:@"logInName"];
    NSString *headId = [UserDefault getDataObjectForKey:@"managerID"];
    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,CLUESSEARCH];
//    NSDictionary *dict = @{@"ownerName":@"系统管理员",@"ownerId":headId,@"noStatus":@"SP_JS"};
    
    if (![CommonUtils objectIsValid:self.cluesView.cusText.text]) {
        
        self.cluesView.cusText.text = @"";
    }
    
    if (![CommonUtils objectIsValid:self.cluesView.levelValue]) {
        
        self.cluesView.levelValue = @"";
    }
    if (![CommonUtils objectIsValid:self.cluesView.typeValue]) {
        
        self.cluesView.typeValue = @"";
    }

    
    
    if (![CommonUtils objectIsValid:self.cluesView.userValue]) {
        
        self.cluesView.userValue = @"";
    }

    if (![CommonUtils objectIsValid:self.cluesView.jyxzValue]) {
        
        self.cluesView.jyxzValue = @"";
    }

    if (![CommonUtils objectIsValid:self.cluesView.sourceValue]) {
        
        self.cluesView.sourceValue = @"";
    }
    
    if (![CommonUtils objectIsValid:self.cluesView.startStr]) {
        
        self.cluesView.startStr = @"";
    }

    if (![CommonUtils objectIsValid:self.cluesView.endStr]) {
        
        self.cluesView.endStr = @"";
    }

    if (![CommonUtils objectIsValid:self.cluesView.statusValue]) {
        
        self.cluesView.statusValue = @"";
    }
    
    if (![CommonUtils objectIsValid:self.cluesView.provinceId]) {
        
        self.cluesView.provinceId = @"";
    }

    if (![CommonUtils objectIsValid:self.cluesView.cityId]) {
        
        self.cluesView.cityId = @"";
    }

    if (![CommonUtils objectIsValid:self.jiTuanId]) {
        
        self.jiTuanId = @"";
    }
    
    if (![CommonUtils objectIsValid:self.cluesView.areaId]) {
        
        self.self.cluesView.areaId = @"";
    }

    
    NSDictionary *dict = @{@"ownerName":userName,@"ownerId":headId,
                           @"cusFullname":self.cluesView.cusText.text,
                           @"startLevel":self.cluesView.levelValue,
                           @"cusType":self.cluesView.typeValue,
                           @"userNature":self.cluesView.userValue,
                           @"busiNature":self.cluesView.jyxzValue,
                           @"findSourceId":self.cluesView.sourceValue,
                           @"startDateMin":self.cluesView.startStr,
                           @"startDateMax":self.cluesView.endStr,
//                           @"status":@"SP_CLUESTATUS",
                           @"noStatus":@"SP_JS",
                           @"parentId":self.cluesView.provinceId,
                           @"cityId":self.cluesView.cityId,
                           @"areaId":self.cluesView.areaId,
                           @"ownerGroupId":self.jiTuanId,
                           };
    
#pragma mark - 线索搜索时的状态是SP_CLUESTATUS
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"----%@",[responseObject JSONString]);
        
        [[Session sharedSession].loadView StopLoading];
        
        cluesBaseClass *baseModel = [[cluesBaseClass alloc]initWithDictionary:responseObject];
        
        if (baseModel.success) {
            
            for (int i = 0 ; i < baseModel.data.datalist.count; i++) {
                
                [self.searchClueArray addObject:[baseModel.data.datalist objectAtIndex:i]];
                
            }
            
            [self.delegate searchClueWithArray:self.searchClueArray];
            
            if (self.searchClueArray.count == 0) {
                
                [[Session sharedSession].tpView presentMessageTips:@"没有数据"];
            }
        }
        [self.navigationController popViewControllerAnimated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [[Session sharedSession].loadView StopLoading];
        
        NSLog(@"%@",error);
    }];
}



@end
