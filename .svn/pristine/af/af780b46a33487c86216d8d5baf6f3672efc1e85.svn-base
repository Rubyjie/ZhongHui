//
//  AddPlanView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/23.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "AddPlanView.h"

@implementation AddPlanView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        [self initAddPlanView];
        
        
    }
    return self;
}


-(void)initAddPlanView
{
    NSArray *titleArray = @[@"标题",@"事项",@"内容",@"时间",@"负责人",@"参与人",@"相关业务",@"提醒",@"重要性",@"方式",@"地址",@"客户",@"联系人"];
    
    for (int i = 0 ; i < titleArray.count; i++) {
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10+(60*i), 100, 20)];
        titleLabel.text = [titleArray objectAtIndex:i];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = RGB(0, 195, 236);
        [self addSubview:titleLabel];
        
        
        CALayer *henglayer = [[CALayer alloc] init];
        henglayer.backgroundColor = RGB(0, 195, 236).CGColor;
        henglayer.frame = CGRectMake(0, 10+59.5*(i+1), PHONE_UISCREEN_WIDTH, 0.5);
        [self.layer addSublayer:henglayer];
        
        if (i == 0) {
            
            UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(0, 30+(40+20)*i, PHONE_UISCREEN_WIDTH-20, 40)];
            textfield.placeholder = @"请输入";
            [self addSubview:textfield];
        
        }else{
        
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 30+(40+20)*i, PHONE_UISCREEN_WIDTH-20, 40);
            [button setTitle:@"请选择" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            button.tag = 30 + i;
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [self addSubview:button];
        }
    }
    
    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
    butt.frame = CGRectMake(20, 13*60+20, PHONE_UISCREEN_WIDTH-40, 30);
    butt.backgroundColor = RGB(0, 195, 236);
    [butt setTitle:@"确定" forState:UIControlStateNormal];
    [self addSubview:butt];

}


@end
