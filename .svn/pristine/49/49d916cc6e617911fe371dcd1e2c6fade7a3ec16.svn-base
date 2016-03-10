//
//  PlanCancelView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/22.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "PlanCancelView.h"
#import "AFNetworking.h"
#import "PopupView.h"

@interface PlanCancelView () <UITextViewDelegate,PopviewDelegate>

@property (nonatomic, strong)UILabel *placeholderLabel;


@property (nonatomic, strong)PopupView *CancelYuanYinPopView;

@property (nonatomic, strong)NSMutableArray *cancelYuanyinArray;

@property (nonatomic, strong)NSMutableArray *cancelTypeArray;

@property (nonatomic, strong)UIButton *yuanYinButton;

@end

@implementation PlanCancelView


-(PopupView*)CancelYuanYinPopView
{
    if (!_CancelYuanYinPopView) {
        
        _CancelYuanYinPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.cancelYuanyinArray];
        _CancelYuanYinPopView.delegate = self;
        _CancelYuanYinPopView.tag = 124;
    }
    return _CancelYuanYinPopView;
}

-(NSMutableArray *)cancelYuanyinArray
{
    if (!_cancelYuanyinArray) {
        
        _cancelYuanyinArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _cancelYuanyinArray;
}

-(NSMutableArray *)cancelTypeArray
{
    if (!_cancelTypeArray) {
        
        _cancelTypeArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _cancelTypeArray;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initPlanCancelView];
        
        // 获取取消原因的数据
        [self getCancelYuanYinData];
    }
    return self;
}

-(void)getCancelYuanYinData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,VISITCANCELYUANYIN];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"------%@",responseObject);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray  = [responseObject objectForKey:@"data"];
            
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                
                NSString *YuanyinName = [dict objectForKey:@"name"];
                NSString *yuanYinType = [dict objectForKey:@"value"];
                
                [self.cancelYuanyinArray addObject:YuanyinName];
                
                [self.cancelTypeArray addObject:yuanYinType];
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];


}

-(void)initPlanCancelView
{
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 40, 30)];
    titleLabel.text = @"原因";
    titleLabel.tag = 128;
    titleLabel.textColor = [UIColor redColor];
    titleLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:titleLabel];
    
    
    
    UIButton *YuanYinButton = [UIButton buttonWithType:UIButtonTypeCustom];
    YuanYinButton.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame), 10, PHONE_UISCREEN_WIDTH-10-10, 30);
    [YuanYinButton addTarget:self action:@selector(clcikChooseYuanYin:) forControlEvents:UIControlEventTouchUpInside];
    YuanYinButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [YuanYinButton setTitle:@"请选择" forState:UIControlStateNormal];
    [YuanYinButton setTitleColor:[UIColor grayColor]forState:UIControlStateNormal];
    YuanYinButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:YuanYinButton];
    self.yuanYinButton = YuanYinButton;
    
    CALayer *linelayer = [[CALayer alloc]init];
    linelayer.backgroundColor = [UIColor whiteColor].CGColor;
    linelayer.frame = CGRectMake(0,49.5,PHONE_UISCREEN_WIDTH, 0.5);
    [self.layer addSublayer:linelayer];

    
//    self.yuanYinLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH-100, 6, 80, 18)];
//    self.yuanYinLabel.font = [UIFont systemFontOfSize:14];
//    [YuanYinButton addSubview:self.yuanYinLabel];

    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(YuanYinButton.frame)+20, PHONE_UISCREEN_WIDTH-20, 200)];
    textView.delegate = self;
    textView.scrollEnabled = YES;    //当文字超过视图的边框时是否允许滑动，默认为“YES”
    textView.backgroundColor = [UIColor whiteColor];
    [self addSubview:textView];
    self.conText = textView;

    
    self.placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 200, 30)];
    self.placeholderLabel.textColor = [UIColor grayColor];
    self.placeholderLabel.font = [UIFont systemFontOfSize:14];
    self.placeholderLabel.text = @"请简要描述您的说明内容";
    self.placeholderLabel.textColor = [UIColor grayColor];
    self.placeholderLabel.hidden = NO;
    self.placeholderLabel.enabled = NO; //label必须设置为不可用
    [textView addSubview:self.placeholderLabel];
    
    
    UIButton *QueDingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    QueDingButton.frame = CGRectMake(10, CGRectGetMaxY(textView.frame)+20, PHONE_UISCREEN_WIDTH-20, 30);
    QueDingButton.userInteractionEnabled = NO;
    QueDingButton.alpha = 0.5;
    QueDingButton.tag = 10;
    [QueDingButton addTarget:self action:@selector(clcikQueDingButton) forControlEvents:UIControlEventTouchUpInside];
    QueDingButton.backgroundColor = RGB(0, 195, 236);
    [QueDingButton setTitle:@"确定" forState:UIControlStateNormal];
    [self addSubview:QueDingButton];
}


#pragma mark  UItextViewDelegate 这个可以用
-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        
        self.placeholderLabel.text = @"请简要描述您的说明内容";
        
    }else{
        
        self.placeholderLabel.text = @"";
        
        if ([textView.text length] > 500) {
            
            textView.text = [textView.text substringToIndex:500];
            [self endEditing:YES];
            [[Session sharedSession].tpView presectLoadingTips:@"超出最大限制"];
        }
    }
}

#pragma mark -- textview点击右下角按钮收起键盘
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

-(void)clcikChooseYuanYin:(UIButton *)button
{
    [self endEditing:YES];
    [self.CancelYuanYinPopView showAlert];
}

#pragma mark  popView  delegate
-(void)selectWhichButtonWithTag:(NSInteger)tag popView:(PopupView *)popview
{
    if (popview.tag == 124) {
        
        [self.yuanYinButton setTitle:[self.cancelYuanyinArray objectAtIndex:tag-100] forState:UIControlStateNormal];
        [self.yuanYinButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.YuanYinType = [self.cancelTypeArray objectAtIndex:tag - 100];
        
        UIButton *button = (UIButton *)[self viewWithTag:10];
        button.userInteractionEnabled = YES;
        button.alpha = 1;
        
        UILabel *titelLabel = (UILabel *)[self viewWithTag:128];
        titelLabel.textColor = [UIColor grayColor];

    }
}


-(void)clcikQueDingButton
{
    [self.delegate selectedButtonQueDingCancel];
}

@end
