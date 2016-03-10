//
//  PopupView.m
//  E家洁app
//
//  Created by 刘彦超 on 15/10/8.
//  Copyright (c) 2015年 刘彦超. All rights reserved.
//

#import "PopupView.h"

@interface PopupView ()

@property (nonatomic, strong)UIScrollView *scrollView;

@end

@implementation PopupView

- (id)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArr
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        UIControl *control = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, PHONE_UISCREEN_WIDTH, PHONE_UISCREEN_HEIGHT)];
        control.backgroundColor = [UIColor blackColor];
        control.alpha = 0.5;
        [control addTarget:self action:@selector(hiddenAlert) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:control];
        
//        float x_space = 40;
//        float top_space = (PHONE_UISCREEN_HEIGHT-50*titleArr.count)/2;
        
        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(20, 20, PHONE_UISCREEN_WIDTH-40,150)];
        [self addSubview:self.scrollView];
        
        for (int i = 0; i < titleArr.count; i ++) {
            
            UIButton *selectbutton = [UIButton buttonWithType:UIButtonTypeCustom];
            selectbutton.frame = CGRectMake(0, 50*i, PHONE_UISCREEN_WIDTH-40, 50);
            [selectbutton addTarget:self action:@selector(selectWitchButtonWithTag:) forControlEvents:UIControlEventTouchUpInside];
            [selectbutton setTag:100 + i];
            [selectbutton setBackgroundColor:[UIColor whiteColor]];
            [selectbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            selectbutton.titleLabel.font = [UIFont systemFontOfSize:14];
            [selectbutton setTitle:[titleArr objectAtIndex:i] forState:UIControlStateNormal];
            self.chooseButton = selectbutton;
            [self.scrollView addSubview:selectbutton];
            UILabel *xian = [[UILabel alloc]initWithFrame:CGRectMake(0, 49.5, PHONE_UISCREEN_WIDTH-40, 0.5)];
            xian.backgroundColor = LINE_COLOR;
            [selectbutton addSubview:xian];
            
        }
        
        if (titleArr.count == 3 || titleArr.count > 3) {
            
            self.scrollView.frame = CGRectMake(20, 20, PHONE_UISCREEN_WIDTH-40,150);
            self.scrollView.layer.cornerRadius = 10;
            self.scrollView.layer.masksToBounds = YES;
            [self addSubview:self.scrollView];

            
        }else if (titleArr.count == 2) {
        
            self.scrollView.frame = CGRectMake(20, 20, PHONE_UISCREEN_WIDTH-40,titleArr.count * 50);
            self.scrollView.layer.cornerRadius = 10;
            self.scrollView.layer.masksToBounds = YES;
            [self addSubview:self.scrollView];

        }else if (titleArr.count == 1) {
        
            self.scrollView.frame = CGRectMake(20, 20, PHONE_UISCREEN_WIDTH-40,titleArr.count * 50);
            self.scrollView.layer.cornerRadius = 10;
            self.scrollView.layer.masksToBounds = YES;
            [self addSubview:self.scrollView];
        
        }
        
        [self.scrollView setContentSize:CGSizeMake(PHONE_UISCREEN_WIDTH-40, titleArr.count*50)];
        self.scrollView.center = self.center;
        //是否显示scrollView右边的滑动条NO为不显示
        self.scrollView.showsVerticalScrollIndicator = NO;
        
    }
    
    return self;
}

//点击选择框上的button的代理方法
- (void)selectWitchButtonWithTag:(UIButton *)sender
{
    [self.delegate selectWhichButtonWithTag:sender.tag popView:self];
    [self hiddenAlert];
}


- (void)showAlert
{
    //把自己加到keyWindow上
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}


- (void)hiddenAlert
{
    //把自己从父视图上移除
    [self removeFromSuperview];
}



@end
