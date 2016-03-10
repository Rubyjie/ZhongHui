//
//  CloseViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/22.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CloseViewController.h"
#import "TPKeyboardAvoidingScrollView.h"

#import "CloseView.h"

#import "AFNetworking.h"

@interface CloseViewController () <queDingButtonDelegate>

@property (nonatomic, strong)CloseView *close;

@property (nonatomic, strong)TPKeyboardAvoidingScrollView *closeScroll;



@end

@implementation CloseViewController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"关闭";
    self.close = [[CloseView alloc]initWithFrame:self.view.bounds];
    self.close.delegate = self;
    self.view.backgroundColor = RGB(227, 227, 227);
    self.closeScroll = [[TPKeyboardAvoidingScrollView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
    self.closeScroll.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT);
    [self.view addSubview:self.closeScroll];
    [self.closeScroll addSubview:self.close];
    
    self.close.cusName.text = self.cusName;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
}


#pragma mark 键盘将要出来
-(void)keyboardWillShow:(NSNotification*)notification{
    
    NSDictionary *info=[notification userInfo];
    //获取键盘高度
    CGSize kbSize=[[info objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue].size;
    [UIView animateWithDuration:0.25f animations:^{
        self.closeScroll.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-kbSize.height-64);
        self.closeScroll.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-64);
    }completion:^(BOOL finished) {
        
    }];
}



#pragma mark 键盘将要隐藏
-(void)keyboardWillHidden:(NSNotification*)notification{
    [UIView animateWithDuration:0.25f animations:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            self.closeScroll.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT);
        });
    }completion:^(BOOL finished) {
        
    }];
}


-(void)swithButtonCloseClues
{
    if ([self.close.chooseButton1.currentTitle isEqualToString:@"必选项"]) {
        
        [[Session sharedSession].tpView presentMessageTips:@"请选择结果"];
        
    }else if ([self.close.chooseButton2.currentTitle isEqualToString:@"必选项"]){
    
        [[Session sharedSession].tpView presentMessageTips:@"请选择原因"];

    }else if ([self.close.chooseButton3.currentTitle isEqualToString:@"必选项"]) {
        
        [[Session sharedSession].tpView presentMessageTips:@"请选择时间"];

    }else{
    
        NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,CLUESCLOSE];
        
        // 关闭时间
        if (self.close.endDateStr) {
            self.close.endDateStr = [self.close.endDateStr stringByReplacingOccurrencesOfString:@"年" withString:@"-"];
            self.close.endDateStr = [self.close.endDateStr stringByReplacingOccurrencesOfString:@"月" withString:@"-"];
            self.close.endDateStr = [self.close.endDateStr stringByReplacingOccurrencesOfString:@"日" withString:@""];
        }

        if (![CommonUtils objectIsValid:self.close.contentText.text]) {
            
            self.close.contentText.text = @"";
        }
        
        
        
        NSDictionary *dict = @{@"cluId":self.idStr,@"opeReason":self.close.resultStr,@"followupResult":self.close.yuanYinStr,@"closeTime":self.close.endDateStr,@"opeContent":self.close.contentText.text,@"opeType":@"关闭"};
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSLog(@"---%@",[responseObject JSONString]);
            
            [[Session sharedSession].tpView presentMessageTips:@"已关闭"];
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"CLOSECLUES" object:nil];
            
            [self.navigationController popViewControllerAnimated:YES];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"---%@",error);
        }];
    }
}

@end
