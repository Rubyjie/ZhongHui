//
//  MainCusDeailsController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/8.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "MainCusDeailsController.h"
#import "CustomerDeilsController.h" // 客户明细
#import "EmployeesController.h"     // 员工
#import "ContractViewController.h"  // 联系人
#import "ContactResultController.h" // 联络记录
#import "CluesViewController.h"     // 相关线索
#import "BusinessController.h"      // 歇业安排
#import "AssetsViewController.h"    // 内部资产

#import "TopView.h"

@interface MainCusDeailsController () <CusDeailButtonDelegate>


{
    // 当前viewController
    UIViewController *currentController;
}

@property (nonatomic, strong)CustomerDeilsController *cusDeailsVC;    // 客户明细
@property (nonatomic, strong)EmployeesController     *employeesVC;    // 员工
@property (nonatomic, strong)ContractViewController  *contractVC;     // 联系人
@property (nonatomic, strong)ContactResultController *contractResult; // 联络记录
@property (nonatomic, strong)CluesViewController     *XgCluesVC;      // 相关线索
@property (nonatomic, strong)BusinessController      *businessVC;     // 歇业安排
@property (nonatomic, strong)AssetsViewController    *assetsVC;       // 内部资产


@property (nonatomic, strong)TopView *HeadView;

@property (nonatomic, strong)UIView *MainView;

@end

@implementation MainCusDeailsController

-(UIView *)MainView
{
    if (!_MainView) {
        _MainView = [[UIView alloc]initWithFrame:CGRectMake(0, 40, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40)];
    }
    return _MainView;
}

-(TopView *)HeadView
{
    if (!_HeadView) {
        
        _HeadView = [[TopView alloc]initWithFrame:CGRectMake(0, 0, (PHONE_UISCREEN_WIDTH/4)*7, 40)];
        _HeadView.delegate = self;
    }
    return _HeadView;
}


-(CustomerDeilsController *)cusDeailsVC
{
    if (!_cusDeailsVC) {
        _cusDeailsVC = [[CustomerDeilsController alloc]init];
    }
    return _cusDeailsVC;
}

-(EmployeesController *)employeesVC
{
    if (!_employeesVC) {
        
        _employeesVC = [[EmployeesController alloc]init];
    }
    return _employeesVC;
}

-(ContractViewController *)contractVC
{
    if (!_contractVC) {
        _contractVC = [[ContractViewController alloc]init];
    }
    return _contractVC;
}

-(ContactResultController *)contractResult
{
    if (!_contractResult) {
        _contractResult = [[ContactResultController alloc]init];
    }
    return _contractResult;
}

-(CluesViewController *)XgCluesVC
{
    if (!_XgCluesVC) {
        _XgCluesVC = [[CluesViewController alloc]init];
    }
    return _XgCluesVC;
}

-(BusinessController *)businessVC
{
    if (!_businessVC) {
        
        _businessVC = [[BusinessController alloc]init];
    }
    return _businessVC;
}

-(AssetsViewController *)assetsVC
{
    if (!_assetsVC) {
        
        _assetsVC = [[AssetsViewController alloc]init];
    }
    return _assetsVC;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    UIScrollView *scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH,40)];
    scrollview.pagingEnabled = YES;
    scrollview.backgroundColor = [UIColor grayColor];
    //是否显示scrollView右边的滑动条NO为不显示
    scrollview.showsVerticalScrollIndicator = NO;
    scrollview.contentSize = CGSizeMake((PHONE_UISCREEN_WIDTH/4)*7, 40);
    [self.view addSubview:scrollview];
    [scrollview addSubview:self.HeadView];
    
    
    [self.view addSubview:self.MainView];
    
    self.title = @"明细";
    
    self.cusDeailsVC.customerId = self.customerId;
    
    self.employeesVC.cusId = self.customerId;
    self.employeesVC.empType = @"客户员工";
    
    self.contractVC.customerID = self.customerId;
    self.contractVC.contactType = @"客户明细下的联系人";
    
    self.contractResult.cusId = self.customerId;
    self.contractResult.cusRecord = @"客户明细下的联络记录";
    
    self.XgCluesVC.cusId = self.customerId;
    self.XgCluesVC.cluesType = @"客户明细下的线索";
    
    self.businessVC.cusId = self.customerId;
    
    self.assetsVC.cusId = self.customerId;
    
    [self addChildViewController:self.cusDeailsVC];
    [self addChildViewController:self.employeesVC];
    [self addChildViewController:self.contractVC];
    [self addChildViewController:self.contractResult];
    [self addChildViewController:self.XgCluesVC];
    [self addChildViewController:self.businessVC];
    [self addChildViewController:self.assetsVC];

    currentController = self.cusDeailsVC;
    [self.MainView addSubview:self.cusDeailsVC.view];
}


#pragma mark   10000明细 10001员工 10002联系人  10003连络记录  10004相关线索  10005歇业安排 10006内部资产
-(void)swithButtonQueryCusDeailsWithTag:(NSInteger)tag
{
    if (((currentController==self.cusDeailsVC)&&(tag==10000))||((currentController==self.employeesVC )&&(tag==10001)) || ((currentController==self.contractVC)&&(tag==10002))||((currentController==self.contractResult )&&(tag==10003))||((currentController==self.XgCluesVC )&&(tag==10004))||((currentController==self.businessVC )&&(tag==10005))||((currentController==self.assetsVC )&&(tag==10006))) {
        return;
    }
    
    UIViewController *oldViewController = currentController;
    switch (tag) {
            

        case 10000:{
            
            [self transitionFromViewController:currentController toViewController:self.cusDeailsVC duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.MainView addSubview:self.cusDeailsVC.view];
                    currentController = self.cusDeailsVC;
                    self.title = @"客户明细";
                }else{
                    currentController = oldViewController;
                    
                }
            }];

            
        }
            break;
        case 10001:
        {
            
            [self transitionFromViewController:currentController toViewController:self.employeesVC duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.MainView addSubview:self.employeesVC.view];
                    currentController = self.employeesVC;
                    
                    self.title = @"员工";
                }else{
                    
                    currentController = oldViewController;
                }
            }];
            
        }
            
            break;
            
        case 10002:{
            [self transitionFromViewController:currentController toViewController:self.contractVC duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.MainView addSubview:self.contractVC.view];
                    currentController = self.contractVC;
                    self.title = @"联系人";
                }else{
                    currentController = oldViewController;
                    
                }
            }];
        }
            break;
            
        case 10003:
        {
            
            [self transitionFromViewController:currentController toViewController:self.contractResult duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.MainView addSubview:self.contractResult.view];
                    currentController = self.contractResult;
                    
                    self.title = @"联络纪录";
                }else{
                    
                    currentController = oldViewController;
                }
            }];
            
        }
            break;
            
        case 10004:
        {
            
            [self transitionFromViewController:currentController toViewController:self.XgCluesVC duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.MainView addSubview:self.XgCluesVC.view];
                    currentController = self.XgCluesVC;
                    
                    self.title = @"相关线索";
                }else{
                    
                    currentController = oldViewController;
                }
            }];
            
        }
            break;
            
        case 10005:
        {
            
            [self transitionFromViewController:currentController toViewController:self.businessVC duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.MainView addSubview:self.businessVC.view];
                    currentController = self.businessVC;
                    
                    self.title = @"歇业安排";
                }else{
                    
                    currentController = oldViewController;
                }
            }];
            
        }
            break;
            
        case 10006:
        {
            
            [self transitionFromViewController:currentController toViewController:self.assetsVC duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.MainView addSubview:self.assetsVC.view];
                    currentController = self.assetsVC;
                    
                    self.title = @"内部资产";
                }else{
                    
                    currentController = oldViewController;
                }
            }];
            
        }
            break;

  
        default:
            break;
    }

}

@end
