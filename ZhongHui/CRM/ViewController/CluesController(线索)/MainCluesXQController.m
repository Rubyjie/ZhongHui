//
//  MainCluesXQController.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/11.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "MainCluesXQController.h"

#import "CluesXQController.h"       //线索明细
#import "VisitPlanViewController.h" //拜访计划
#import "ContactResultController.h" //联络结果
#import "AddConRecordController.h"  //添加联络纪录


#import "CluesXQTopView.h"

@interface MainCluesXQController () <cluesDeailsButtonDelegate>

{
    // 当前viewController
    UIViewController *currentController;
}

@property (nonatomic, strong)CluesXQController *cluesXQ;  //明细
@property (nonatomic, strong)VisitPlanViewController   *visitPlanVC;  //拜访计划
@property (nonatomic, strong)ContactResultController  *visitResultVC;//联络结果

@property (nonatomic, strong)CluesXQTopView *HeadView;

@property (nonatomic, strong)UIView *MainView;

@end

@implementation MainCluesXQController

-(UIView *)MainView
{
    if (!_MainView) {
        _MainView = [[UIView alloc]initWithFrame:CGRectMake(0, 40, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - 64 - 40)];
    }
    return _MainView;
}

-(CluesXQTopView *)HeadView
{
    if (!_HeadView) {
        
        _HeadView = [[CluesXQTopView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 40)];
        _HeadView.delegate = self;
    }
    return _HeadView;
}


-(CluesXQController *)cluesXQ
{
    if (!_cluesXQ) {
        _cluesXQ = [[CluesXQController alloc]init];
    }
    return _cluesXQ;
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


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view addSubview:self.HeadView];
    [self.view addSubview:self.MainView];
    self.title = @"线索明细";

    
    self.cluesXQ.cluesId = self.cluesId;

    
//    self.cluesXQ.cusName = self.visitResultVC.cusNameStr;
//    self.cluesXQ.cusId = self.visitResultVC.cusIdStr;
//    self.cluesXQ.headName = self.visitResultVC.ownerNameStr;
    
    
    
    self.visitPlanVC.cluesIds = self.cluesId; //拜访计划
    self.visitPlanVC.planStr = @"线索明细下的拜访计划";
    
    self.visitResultVC.cluId = self.cluesId; //联络纪录
    self.visitResultVC.visitRecord = @"线索的拜访记录";
    self.visitResultVC.cusId = self.cusId;
    
    [self addChildViewController:self.cluesXQ];
    [self addChildViewController:self.visitPlanVC];
    [self addChildViewController:self.visitResultVC];
    
    currentController = self.cluesXQ;
    [self.MainView addSubview:self.cluesXQ.view];
    
}


#pragma mark 点击线索明细里的（1000）线索明细、（1001）拜访计划、（1002）联络记录
-(void)swithButtonQueryCluesDeailsAndVisitPlanAndConRecordWithTag:(NSInteger)tag
{
    
    if (((currentController==self.cluesXQ)&&(tag==1000))||((currentController==self.visitPlanVC )&&(tag==1001))||((currentController==self.visitResultVC)&&(tag==1002))) {
        return;
    }
    
    UIViewController *oldViewController = currentController;
    switch (tag) {
        case 1000:{
            [self transitionFromViewController:currentController toViewController:self.cluesXQ duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.MainView addSubview:self.cluesXQ.view];
                    currentController = self.cluesXQ;
                    self.title = @"线索明细";
                    self.navigationItem.rightBarButtonItem = nil;

                }else{
                    currentController = oldViewController;
                    
                }
            }];
        }
            break;
        case 1001:
        {
            
            [self transitionFromViewController:currentController toViewController:self.visitPlanVC duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.MainView addSubview:self.visitPlanVC.view];
                    currentController = self.visitPlanVC;
                    
                    self.title = @"拜访计划";
                    self.navigationItem.rightBarButtonItem = nil;
                }else{
                    
                    currentController = oldViewController;
                }
            }];
            
        }
            break;
            
        case 1002:{
            [self transitionFromViewController:currentController toViewController:self.visitResultVC duration:0 options:0 animations:^{
                
            } completion:^(BOOL finished) {
                if (finished) {
                    [currentController.view removeFromSuperview];
                    [self.MainView addSubview:self.visitResultVC.view];
                    currentController = self.visitResultVC;
                    self.title = @"联络结果";
                    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"加号"] style:UIBarButtonItemStyleDone target:self action:@selector(addContractRecord)];
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

-(void)addContractRecord
{
    AddConRecordController *addRecord = [[AddConRecordController alloc]init];
    addRecord.customerIDStr = self.cluesXQ.cusId;
    addRecord.customerNameStr = self.cluesXQ.cusName;
    addRecord.ownerNameStr = self.cluesXQ.headName;
    addRecord.cluesIdStr = self.cluesXQ.cluesId;
    addRecord.addRcordType = @"线索";
    [self.navigationController pushViewController:addRecord animated:YES];
}



@end
