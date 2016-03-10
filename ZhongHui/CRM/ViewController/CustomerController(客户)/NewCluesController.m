//
//  NewCluesController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/24.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "NewCluesController.h"
#import "NewCluesView.h"

#import "TPKeyboardAvoidingScrollView.h"
#import "UserDefault.h"
#import "AFNetworking.h"

#import "CustomerBaseClass.h"
#import "CustomerData.h"
#import "CustomerDatalist.h"

@interface NewCluesController () <newCluesDelegate>

@property (nonatomic, strong)NewCluesView *cluesView ;

@property (nonatomic, strong)UIScrollView *addCluesScroll;


@property (nonatomic, strong)NSString *level;
@property (nonatomic, strong)NSString *userBus;
@property (nonatomic, strong)NSString *jyXzBus;
@property (nonatomic, strong)NSString *type;


@end

@implementation NewCluesController


-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"新增线索";
    self.view.backgroundColor = RGB(227, 227, 227);
    
    self.cluesView = [[NewCluesView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, 64+22*50)];
    self.cluesView.delegate = self;
    

    self.addCluesScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
    self.addCluesScroll.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, 64+22*50);
    [self.view addSubview:self.addCluesScroll];
    [self.addCluesScroll addSubview:self.cluesView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    
    // 获取客户详情传到新增线索用
    [self getCustomerDeails];
}

-(void)getCustomerDeails
{
    
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,CUSTONERDEAILS];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *dict = @{@"id":self.cusId};
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dictData = [responseObject objectForKey:@"data"];
            
            NSArray *dataArray = [dictData objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                
                
                self.cluesView.customerLabel.text = [dict objectForKey:@"cusFullName"];
                self.cluesView.levelLabel.text = [dict objectForKey:@"startLevelName"];
                self.level = [dict objectForKey:@"startLevel"];
                
                self.cluesView.typeLabel.text =  [dict objectForKey:@"cusTypeName"];
                self.type = [dict objectForKey:@"cusType"];
                
                self.cluesView.jiTuanLabel.text = [dict objectForKey:@"ownerGroupId"];
                
                self.cluesView.userXzLabel.text = [dict objectForKey:@"userNatureName"];
                self.userBus = [dict objectForKey:@"userNature"];
                
                self.cluesView.jyxzLabel.text = [dict objectForKey:@"bustNatureName"];
                self.jyXzBus = [dict objectForKey:@"bustNature"];
                
                self.cluesView.attLabel.text = [dict objectForKey:@"userAreaName"];
                self.cluesView.sizeLabel.text = [dict objectForKey:@"userSizeName"];
                self.cluesView.ctripLabel.text = [dict objectForKey:@"tripAreaName"];
                self.cluesView.managerLabel.text = [dict objectForKey:@"managerPartyName"];
                self.cluesView.sourceLabel.text = [dict objectForKey:@"findSourceName"];
                self.cluesView.areaLabel.text = [dict objectForKey:@"districtName"];
                self.cluesView.addressLabel.text = [dict objectForKey:@"regionAddr"];
                
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}


#pragma mark 键盘将要出来
-(void)keyboardWillShow:(NSNotification*)notification{
    
    NSDictionary *info=[notification userInfo];
    //获取键盘高度
    CGSize kbSize=[[info objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue].size;
    [UIView animateWithDuration:0.25f animations:^{
        
        self.addCluesScroll.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT - kbSize.height - 64 );
//        self.addCluesScroll.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, 64+22*50);
        
    }completion:^(BOOL finished) {
        
    }];
}



#pragma mark 键盘将要隐藏
-(void)keyboardWillHidden:(NSNotification*)notification{
    [UIView animateWithDuration:0.25f animations:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            self.addCluesScroll.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT);
        });
    }completion:^(BOOL finished) {
        
    }];
}




#pragma mark - 点击button添加线索
-(void)swithButtonAddClues
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,CUSTOMERADDCLUES];
    
    NSString *uesrId = [UserDefault getDataObjectForKey:@"managerID"];
    NSString *userName = [UserDefault getDataObjectForKey:@"logInName"];
    
    if ([self.cluesView.sourceButton.currentTitle isEqualToString:@"请选择"]) {
        
        [[Session sharedSession].tpView presentMessageTips:@"来源不能为空"];
        
    }else if ([self.cluesView.yeTaiButton.currentTitle isEqualToString:@"请选择"]) {
        
        [[Session sharedSession].tpView presentMessageTips:@"业态不能为空"];

    }else if ([self.cluesView.jiGouButton.currentTitle isEqualToString:@"请选择"]) {
        [[Session sharedSession].tpView presentMessageTips:@"机构不能为空"];

        
    }else if ([self.cluesView.headButton.currentTitle isEqualToString:@"请选择"]) {
    
        [[Session sharedSession].tpView presentMessageTips:@"负责人不能为空"];

    }else{
        
        
        if (![CommonUtils objectIsValid:self.cluesView.jiTuanLabel.text]) {
            
            self.cluesView.jiTuanLabel.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.cluesView.sourceLabel.text]) {
            
            self.cluesView.sourceLabel.text = @"";
        }

        // 发现时间
        if (![CommonUtils objectIsValid:self.cluesView.timeStr]) {
            
            self.cluesView.timeStr = @"";
        }
        
        if (![CommonUtils objectIsValid:self.cluesView.shuoMingText.text]) {
            
            self.cluesView.shuoMingText.text = @"";
        }
        
        if (![CommonUtils objectIsValid:self.cluesView.stateValue]) {
            self.cluesView.stateValue = @"";
        }
        
        NSDictionary *dict =  @{@"cusId":self.cusId,
                                @"cusFullname":self.cluesView.customerLabel.text,
                                @"startLevel":self.level,
                                @"cusType":self.type,
                                @"parentId":self.cluesView.jiTuanLabel.text,
                                @"userNature":self.userBus,
                                @"bustNature":self.jyXzBus,
                                @"userArea":self.cluesView.attLabel.text,
                                @"userSize":self.cluesView.sizeLabel.text,
                                @"tripArea":self.cluesView.ctripLabel.text,
                                @"managerPartyName":self.cluesView.managerLabel.text,
                                @"findSourceName":self.cluesView.sourceLabel.text,
                                @"districtName":self.cluesView.areaLabel.text,
                                @"regionAddr":self.cluesView.addressLabel.text,
                                
                                @"findSourceIds":self.cluesView.sourceValue,
                                @"startDateMin":self.cluesView.timeStr,
                                @"busiDepart":self.cluesView.yeTaiButton.titleLabel.text, // 改的value
                                
                                @"ownerGroupId":self.cluesView.jiGouId,
                                @"finderName":self.cluesView.findNameButton.titleLabel.text,
                                @"orgName":self.cluesView.jiGouButton.titleLabel.text,
                                @"ownerId":uesrId,
                                @"ownerName":userName,
                                @"description":self.cluesView.shuoMingText.text,
                                @"status":self.cluesView.stateValue
                                };
        
        NSLog(@"%@",dict);
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSLog(@"------%@",[responseObject JSONString]);
            
            if ([responseObject objectForKey:@"success"]) {
                
                [[Session sharedSession].tpView presentMessageTips:@"添加成功"];
                
                [[NSNotificationCenter defaultCenter]postNotificationName:@"UPDATACUSCLUES" object:nil];
                
                [self.navigationController popViewControllerAnimated:YES];
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"%@",error);
        }];
    }
}


@end
