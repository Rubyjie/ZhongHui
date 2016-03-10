//
//  TurnToViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/24.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "TurnToViewController.h"
#import "TPKeyboardAvoidingScrollView.h"

#import "TurnToView.h"

#import "AFNetworking.h"

@interface TurnToViewController ()

@property (nonatomic, strong)TurnToView *weiTuoView;

@property (nonatomic, strong)TPKeyboardAvoidingScrollView *scroll;



@end

@implementation TurnToViewController

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"线索委托";
    

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(clcikSave)];
    
    self.weiTuoView = [[TurnToView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];

    self.weiTuoView.cusLabel.text = self.cusName;

    self.scroll = [[TPKeyboardAvoidingScrollView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
    self.scroll.contentSize = CGSizeMake(PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT);
    
    [self.view addSubview:self.scroll];
    [self.scroll addSubview:self.weiTuoView];
    
    self.view.backgroundColor = RGB(227, 227, 227);

    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[Session sharedSession].loadView StopLoading];
}

#pragma mark 键盘将要出来
-(void)keyboardWillShow:(NSNotification*)notification{
    
    NSDictionary *info=[notification userInfo];
    //获取键盘高度
    CGSize kbSize=[[info objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue].size;
    [UIView animateWithDuration:0.25f animations:^{
        self.scroll.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT-kbSize.height - 64);
    }completion:^(BOOL finished) {
        
    }];
}



#pragma mark 键盘将要隐藏
-(void)keyboardWillHidden:(NSNotification*)notification{
    [UIView animateWithDuration:0.25f animations:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            self.scroll.frame = CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT);
        });
    }completion:^(BOOL finished) {
        
    }];
}


-(void)clcikSave
{
    if ([self.weiTuoView.yuanYinButton.currentTitle isEqualToString:@"必选项"]) {
        
        [[Session sharedSession].tpView presentMessageTips:@"请选择委托原因"];
        
    }else if ([self.weiTuoView.yeiTaiButton.currentTitle isEqualToString:@"必选项"]) {
        [[Session sharedSession].tpView presentMessageTips:@"请选择归属业态"];

        
    }else if ([self.weiTuoView.jiGouButton.currentTitle isEqualToString:@"必选项"]) {
        [[Session sharedSession].tpView presentMessageTips:@"请选择归属机构"];
    }else if ([self.weiTuoView.headNameButton.currentTitle isEqualToString:@"必选项"]) {
        
        [[Session sharedSession].tpView presentMessageTips:@"请选择负责人"];

    }else{
        
        [[Session sharedSession].loadView StartLoading];
        
        if (![CommonUtils objectIsValid:self.weiTuoView.shuoMingText.text]) {
            
            self.weiTuoView.shuoMingText.text = @"";
        }
        
        NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"clue/salClueOpeLog/saveTransfer"];
        
        NSDictionary *dict = @{@"opeType":@"委托",
                               @"opeResult":@"成功",
                               @"cluId":self.cluId,
                               @"opeReason":self.weiTuoView.yuanYinValue,
                               @"targetDepart":self.weiTuoView.yeTaiValue,
                               @"targetOrt":self.weiTuoView.jiGouId,
                               @"targetOrtName":self.weiTuoView.jiGouButton.titleLabel.text,
                               @"targetId":self.weiTuoView.headId,
                               @"targetName":self.weiTuoView.headNameButton.titleLabel.text,
                               @"opeContent":self.weiTuoView.shuoMingText.text};
        NSLog(@"-----%@",dict);
        
        AFHTTPRequestOperationManager *mang = [AFHTTPRequestOperationManager manager];
        [mang POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            
                [[Session sharedSession].loadView StopLoading];
                
                [[Session sharedSession].tpView presentMessageTips:@"完成"];
                [self.navigationController popViewControllerAnimated:YES];
                
                NSLog(@"----%@",[responseObject JSONString]);

            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            [[Session sharedSession].loadView StopLoading];

            NSLog(@"%@",error);
        }];
    }
    
}


@end
