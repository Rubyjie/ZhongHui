//
//  ContractDeailsController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/25.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ContractDeailsController.h"
#import "ContractDeailsCell.h"
#import "ConDeailsView.h"

#import "AFNetworking.h"

#import "DataModels.h"

@interface ContractDeailsController () <iphoneButtonDelegate>

@property (nonatomic, strong)NSArray *textArray;
@property (nonatomic, strong)UITableView *deailsTable;

@property (nonatomic, strong)myContractBaseClass *baseModel;
@property (nonatomic, strong)ConDeailsView *conView;
@end

@implementation ContractDeailsController

-(void)swithButtonCallIphoneWithTag:(NSInteger)tag
{
    if (tag == 137) {
        
        
        NSString *phoneStr = [NSString stringWithFormat:@"%@%@",@"tel://",self.baseModel.data.offtelNumber];
        NSLog(@"-----%@",phoneStr);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneStr]];
        
    }else if (tag == 139) {
    
        NSString *phoneStr = [NSString stringWithFormat:@"%@%@",@"tel://",self.baseModel.data.mobile];
        NSLog(@"-----%@",phoneStr);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneStr]];

    }

}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"联系人明细";
    
    [self getContractDeailsData];
    self.view.backgroundColor = [UIColor whiteColor];
    self.conView = [[ConDeailsView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 25 * 50)];
    self.conView.backgroundColor = [UIColor whiteColor];
    self.conView.delegate = self;
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    scrollView.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, 25 * 50);
    [self.view addSubview:scrollView];
    
    [scrollView addSubview:self.conView];
    


    
}


-(void)getContractDeailsData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"customer/contactMan/get"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *dict = @{@"id":self.contractId};
    
    [manager GET:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        self.baseModel = [[myContractBaseClass alloc]initWithDictionary:responseObject];
        
        if (self.baseModel.success) {
            
            self.conView.nameLabel.text = self.baseModel.data.conName;
            self.conView.zhiWeiLabel.text = self.baseModel.data.postionCode;
            self.conView.buMenLabel.text = self.baseModel.data.departmentId;
            self.conView.superiorLabel.text = self.baseModel.data.parentPart;

            self.conView.cusLabel.text = self.baseModel.data.cusName;
            self.conView.businessLabel.text = self.baseModel.data.inchargeofBusi;
            self.conView.phoneArea.text = self.baseModel.data.offtelAreaCode;
            self.conView.phoneNum.text = self.baseModel.data.offtelNumber;
            self.conView.phoneExtension.text = self.baseModel.data.offtelExtension;
            
            
            self.conView.mobile.text = self.baseModel.data.mobile;
            self.conView.emails.text = self.baseModel.data.email;
            
            self.conView.offtelAreaCode.text = self.baseModel.data.faxAreacode;
            self.conView.offNumber.text = self.baseModel.data.faxNumber;
            self.conView.offtelExtension.text = self.baseModel.data.faxExtension;

            self.conView.qqLabel.text = self.baseModel.data.qq;
            self.conView.wechatNumber.text = self.baseModel.data.wechatNumber;
            self.conView.address.text = self.baseModel.data.regionAddr;
            self.conView.sexLabel.text = self.baseModel.data.sexCodeName;
            self.conView.jiaoSeLabel.text = self.baseModel.data.contRoleTypeName;
            self.conView.sizeLabel.text = self.baseModel.data.imtimateDegreeName;

            self.conView.decspion.text = self.baseModel.data.dataDescription;
            self.conView.statusLabel.text = self.baseModel.data.statusName;
            self.conView.headLabel.text = self.baseModel.data.ownerName;
            
            if (self.baseModel.data.offtelNumber.length < 1 ) {
                
                UIButton *button = (UIButton *)[self.conView viewWithTag:137];
                button.hidden = YES;
                
            }
            
            

        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}


@end
