//
//  CompanyView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/15.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "CompanyView.h"
#import "ZHButton.h"

#define YCBarButtonImageRatio 0.6

@implementation CompanyView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       
        UIImageView *IconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"头图.png"]];
        IconView.frame = CGRectMake(10, 10, PHONE_UISCREEN_WIDTH - 20, 130);
        [self addSubview:IconView];
        [self setupCompanyViews];
    }
    return self;
}

-(void)setupCompanyViews
{
    
    NSArray *titleArray = @[@"日程通知",@"任务提醒",@"审批提醒",@"在线消息",@"内部公告",@"工作提醒"];
    NSArray *ImageArray =@[@"日程通知.png",@"工作提醒.png",@"审批提醒.png",@"在线消息.png",@"内部公告.png",@"规章制度.png"];
    
    for (int i = 0; i < titleArray.count; i++) {
        
#pragma mark - 如果是6或6PLUS让按钮变小点
        if (PHONE_UISCREEN_IPHONE6 || PHONE_UISCREEN_IPHONE6PLUS) {
            
            CGFloat buttHeight = (PHONE_UISCREEN_HEIGHT - 64 - 49 - 150 - 160) / 2;
            CGFloat buttWidth  = (PHONE_UISCREEN_WIDTH - 20) / 3;
            
            ZHButton *button = [ZHButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(10+buttWidth * ( i % 3),  200 + buttHeight * (i / 3), buttWidth, buttHeight);
            [button setImage:[UIImage imageNamed:[ImageArray objectAtIndex:i]] forState:UIControlStateNormal];
            //        button.imageEdgeInsets = UIEdgeInsetsMake(-15, 30, 25, 5);
            [button setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
            //        button.titleEdgeInsets = UIEdgeInsetsMake(-5, -20, -30, 5);
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.backgroundColor = [UIColor whiteColor];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button addTarget:self action:@selector(ClcikButtonjumpViewController:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 200+i;
            //点击按钮会发光
            button.showsTouchWhenHighlighted = YES;
            [self addSubview:button];
            
            
            UIImageView *lineImage = [[UIImageView alloc]initWithFrame:CGRectMake(10,  199.5+buttHeight*(i%3), PHONE_UISCREEN_WIDTH-20, 0.5)];
            lineImage.backgroundColor = [UIColor grayColor];
            [self addSubview:lineImage];
            
            
            UIImageView *shuLine = [[UIImageView alloc]initWithFrame:CGRectMake(10+buttWidth*(i%3), 199.5, 0.5, buttHeight * 2)];
            shuLine.backgroundColor = [UIColor grayColor];
            [self addSubview:shuLine];
            
        }else{

            CGFloat buttHeight = (PHONE_UISCREEN_HEIGHT - 64 - 49 - 150 - 60) / 2;
            CGFloat buttWidth  = (PHONE_UISCREEN_WIDTH - 20) / 3;

            ZHButton *button = [ZHButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(10+buttWidth * ( i % 3),  150 + buttHeight * (i / 3), buttWidth, buttHeight);
            [button setImage:[UIImage imageNamed:[ImageArray objectAtIndex:i]] forState:UIControlStateNormal];
    //        button.imageEdgeInsets = UIEdgeInsetsMake(-15, 30, 25, 5);
            [button setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
    //        button.titleEdgeInsets = UIEdgeInsetsMake(-5, -20, -30, 5);
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.backgroundColor = [UIColor whiteColor];
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button addTarget:self action:@selector(ClcikButtonjumpViewController:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 200+i;
            //点击按钮会发光
            button.showsTouchWhenHighlighted = YES;
            [self addSubview:button];
            
            
            UIImageView *lineImage = [[UIImageView alloc]initWithFrame:CGRectMake(10,  149.5+buttHeight*(i%3), PHONE_UISCREEN_WIDTH-20, 0.5)];
            lineImage.backgroundColor = [UIColor grayColor];
            [self addSubview:lineImage];
            
            
            UIImageView *shuLine = [[UIImageView alloc]initWithFrame:CGRectMake(10+buttWidth*(i%3), 149.5, 0.5, buttHeight * 2)];
            shuLine.backgroundColor = [UIColor grayColor];
            [self addSubview:shuLine];
        }
    }
}


-(void)ClcikButtonjumpViewController:(UIButton *)button
{
    [self.delegate swithButtonJumpViewControllerWithTag:button.tag];
}

@end
