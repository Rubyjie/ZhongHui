//
//  TiXingController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "TiXingController.h"
#import "TiXingView.h"

#import "AFNetworking.h"

@interface TiXingController () <TiXingButtonDelegate>

@property (nonatomic, strong)TiXingView *tiXIng;
@end

@implementation TiXingController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"计划提醒";
    self.view.backgroundColor = RGB(227, 227, 227);
    self.tiXIng = [[TiXingView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
    self.tiXIng.delegate = self;
    [self.view addSubview:self.tiXIng];

}


#pragma mark - 点击确定按钮
-(void)selectedButtonSavePlan
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,VISITPLANTIXING];
    
    // 提醒状态needRemind
    NSString *startStr = self.tiXIng.timeButton.titleLabel.text;
    if (startStr) {
        startStr = [startStr stringByReplacingOccurrencesOfString:@"年" withString:@"-"];
        startStr = [startStr stringByReplacingOccurrencesOfString:@"月" withString:@"-"];
        startStr = [startStr stringByReplacingOccurrencesOfString:@"日" withString:@""];
    }
    
    NSLog(@"%@ --- %@",self.planIdtenfier,startStr);
    
    NSDictionary *dict = @{@"ids":self.planIdtenfier,@"needRemind":[NSNumber numberWithBool:self.tiXIng.buttonStatu.selected],@"remindTime":startStr};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"-----%@",[responseObject JSONString]);
        
        [[Session sharedSession].tpView presentMessageTips:@"成功"];
        [self.navigationController popViewControllerAnimated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}
@end
