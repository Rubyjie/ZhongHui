//
//  MainConViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/6.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "MainConViewController.h"
#import "ContractDeailsController.h" //联系人明细
#import "VisitPlanViewController.h"   //拜访计划
#import "ContactResultController.h"  //联络结果
#import "EmployeesController.h"      //员工

#import "ConMainView.h"

@interface MainConViewController ()<conDeailsButtonDelegate>


{
    // 当前viewController
    UIViewController *currentController;
}

@property (nonatomic, strong)ContractDeailsController *conDeailsVC;  //明细
@property (nonatomic, strong)VisitPlanViewController  *visitPlanVC;  //拜访计划
@property (nonatomic, strong)ContactResultController  *visitResultVC;//联络结果
@property (nonatomic, strong)EmployeesController      *employees;    //员工

@property (nonatomic, strong)ConMainView *HeadView;

@property (nonatomic, strong)UIView *MainView;

@end

@implementation MainConViewController

-(UIView *)MainView
{
    if (!_MainView) {
        _MainView = [[UIView alloc]initWithFrame:CGRectMake(0, 40, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40)];
    }
    return _MainView;
}

-(ConMainView *)HeadView
{
    if (!_HeadView) {
        
        _HeadView = [[ConMainView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 40)];
        _HeadView.delegate = self;
    }
    return _HeadView;
}

-(ContractDeailsController *)conDeailsVC
{
    if (!_conDeailsVC) {
        _conDeailsVC = [[ContractDeailsController alloc]init];
    }
    return _conDeailsVC;
}

-(VisitPlanViewController *)visitPlanVC
{
    if (!_visitPlanVC) {
        
        _visitPlanVC = [[VisitPlanViewController alloc]init];
    }
    return _visitPlanVC;
}

-(ContactResultController *)visitResultVC
{
    if (!_visitResultVC) {
        
        _visitResultVC = [[ContactResultController alloc]init];
    }
    return _visitResultVC;
}


-(EmployeesController *)employees
{
    if (!_employees) {
        _employees = [[EmployeesController alloc]init];
    }
    return _employees;
}




- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"明细";
    [self.view addSubview:self.HeadView];
    [self.view addSubview:self.MainView];
    
    
    self.conDeailsVC.contractId = self.contractId;
    self.employees.conId = self.contractId;
    
    self.visitPlanVC.contractIdStr = self.contractId;
    self.visitResultVC.nameId = self.contractId;
    
    [self addChildViewController:self.conDeailsVC];
    
    
    [self addChildViewController:self.visitPlanVC];
    self.visitPlanVC.planStr = @"联系人明细的拜访计划";
    
    [self addChildViewController:self.visitResultVC];
    self.visitResultVC.conRecord = @"联系人明细下的联络结果";
    self.visitResultVC.cusId = self.cusId;
    
    
    [self addChildViewController:self.employees];
    
    currentController = self.conDeailsVC;
    [self.MainView addSubview:self.conDeailsVC.view];

}

#pragma mark - 400联系人明细  401员工
-(void)swithButtonQueryConDeailsAndEmployeesWithTag:(NSInteger)tag
{
    
    if (((currentController==self.conDeailsVC)&&(tag==400))||((currentController==self.visitPlanVC )&&(tag==401))||((currentController==self.visitResultVC)&&(tag==402))||((currentController==self.employees )&&(tag==403))) {
        return;
    }
    
    UIViewController *oldViewController = currentController;
    switch (tag) {
        case 400:{
            [self transitionFromViewController:currentController toViewController:self.conDeailsVC duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.MainView addSubview:self.conDeailsVC.view];
                    currentController = self.conDeailsVC;
                    self.title = @"联系人明细";
                }else{
                    currentController = oldViewController;
                    
                }
            }];
        }
            break;
        case 401:
        {
            
            [self transitionFromViewController:currentController toViewController:self.visitPlanVC duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.MainView addSubview:self.visitPlanVC.view];
                    currentController = self.visitPlanVC;
                    
                    self.title = @"拜访计划";
                }else{
                    
                    currentController = oldViewController;
                }
            }];
            
        }
            break;
        
        case 402:{
            [self transitionFromViewController:currentController toViewController:self.visitResultVC duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.MainView addSubview:self.visitResultVC.view];
                    currentController = self.visitResultVC;
                    self.title = @"联络结果";
                }else{
                    currentController = oldViewController;
                    
                }
            }];
        }
            break;
        case 403:
        {
            
            [self transitionFromViewController:currentController toViewController:self.employees duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.MainView addSubview:self.employees.view];
                    currentController = self.employees;
                    
                    self.title = @"员工";
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
