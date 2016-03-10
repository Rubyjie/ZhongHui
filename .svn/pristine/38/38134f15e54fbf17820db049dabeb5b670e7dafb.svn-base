//
//  ReplyViewController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/16.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ReplyViewController.h"
#import "EditDemandPicker.h"
#import "ReplyView.h"

@interface ReplyViewController () <chooseButtonDelegate,editPickDelegate>

@property (nonatomic, strong) EditDemandPicker *myPickerView;
@property (nonatomic, strong) EditDemandPicker *myPickerView2;

@property (nonatomic, strong) ReplyView *replyView;

@end

@implementation ReplyViewController

- (EditDemandPicker *)myPickerView
{
    if (!_myPickerView) {
        
        _myPickerView = [[EditDemandPicker alloc]initWithFrame:self.view.bounds numberOfComponent:2];
        _myPickerView.delegate = self;
        [_myPickerView setTag:100];
    }
    
    return _myPickerView;
}

- (EditDemandPicker *)myPickerView2
{
    if (!_myPickerView2) {
        
        _myPickerView2 = [[EditDemandPicker alloc]initWithFrame:self.view.bounds numberOfComponent:2];
        _myPickerView2.delegate = self;
        [_myPickerView2 setTag:101];
    }
    
    return _myPickerView2;
}



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"通知回复";
    
    self.view.backgroundColor = RGB(227, 227, 227);
    
    self.replyView = [[ReplyView alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT )];
    
    self.replyView.delegate = self;
    
    [self.view addSubview:self.replyView];
    
}


//- (void)clickBtn
//{
//    [self.myPickerView showPickerView];
//}


- (void)quxiao
{
    
}

- (void)sureWithSelect:(NSString *)select pickview:(EditDemandPicker *)picker
{
    if (picker.tag == 100) {
        
        self.replyView.chooseLabel.text = select;
        
    }else if (picker.tag == 101){
        
        self.replyView.secondLabel.text = select;

    }
    
}

- (void)selectComponent:(NSInteger)component row:(NSInteger)row
{
    if (component == 0) {
        
        if (row == 0) {
            
            self.myPickerView.secondDataArray = [[NSMutableArray alloc]initWithArray:@[@"意见",@"原因",@"好",@"不"]];
            
            self.myPickerView2.secondDataArray = [[NSMutableArray alloc]initWithArray:@[@"意见",@"原因",@"好",@"不"]];
            
        }else{
            
            self.myPickerView.secondDataArray = [[NSMutableArray alloc]initWithArray:@[@"同意",@"不同意",@"符合标准",@"不符合"]];
            
            self.myPickerView2.secondDataArray = [[NSMutableArray alloc]initWithArray:@[@"同意",@"不同意",@"符合标准",@"不符合"]];

        }
    }
    [self.myPickerView reloadMyView];
}



//- (void)setupModalStyle:(UIViewController *)presentedVC {
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
//        presentedVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//    } else {
//        self.modalPresentationStyle = UIModalPresentationCurrentContext;
//    }
//}


#pragma mark - ReplyViewDelegate
-(void)selectedButtonChooseOpinionWithTag:(NSInteger)tag
{
    if (tag == 10) {
        
        [self.myPickerView showPickerView];
        
    }else if (tag == 11) {
    
        [self.myPickerView2 showPickerView];
    }
}


@end
