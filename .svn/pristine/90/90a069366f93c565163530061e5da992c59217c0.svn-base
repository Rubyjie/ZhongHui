//
//  ConDeailsView.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/25.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "ConDeailsView.h"

@implementation ConDeailsView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initConDeailsView];
    }
    return self;
}

-(void)initConDeailsView
{
    NSArray *textArray = @[@"姓名",@"职位",@"部门",@"直属上级",@"所属客户",@"负责业务",@"电话区号",@"办公电话",@"电话分机号",@"手机",@"Email",@"传真区号",@"传真",@"传真分机号",@"QQ",@"微信",@"地址",@"性别",@"角色关系",@"亲密程度",@"备注",@"状态",@"负责人"];
    
    for (int i = 0; i < textArray.count; i ++) {
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 50 *i, 100, 50)];
        titleLabel.textColor = [UIColor grayColor];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.text = [textArray objectAtIndex:i];
        [self addSubview:titleLabel];
        
        
        UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame), 50*i, PHONE_UISCREEN_WIDTH - 120, 50)];
        contentLabel.tag = 10 + i;
        contentLabel.textColor = [UIColor blackColor];
        contentLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:contentLabel];

        switch (i) {
            case 0:
                self.nameLabel = contentLabel;
                break;
            case 1:
                self.zhiWeiLabel = contentLabel;
                break;
            case 2:
                self.buMenLabel = contentLabel;
                break;
            case 3:
                self.superiorLabel = contentLabel;
                break;
            case 4:
                self.cusLabel = contentLabel;
                break;
            case 5:
                self.businessLabel = contentLabel;
                break;
            case 6:
                self.phoneArea = contentLabel;
                break;
            case 7:
                self.phoneNum = contentLabel;
                break;


            case 8:
                self.phoneExtension = contentLabel;
                break;
            case 9:
                self.mobile = contentLabel;
                break;
            case 10:
                self.emails = contentLabel;
                break;
            case 11:
                self.offtelAreaCode = contentLabel;
                break;
            case 12:
                self.offNumber = contentLabel;
                break;
            case 13:
                self.offtelExtension = contentLabel;
                break;
            case 14:
                self.qqLabel = contentLabel;
                break;
            case 15:
                self.wechatNumber = contentLabel;
                break;
                
            case 16:
                self.address = contentLabel;
                break;
            case 17:
                self.sexLabel = contentLabel;
                break;
            case 18:
                self.jiaoSeLabel = contentLabel;
                break;
            case 19:
                self.sizeLabel = contentLabel;
                break;
            case 20:
                self.decspion = contentLabel;
                break;
            case 21:
                self.statusLabel = contentLabel;
                break;
            case 22:
                self.headLabel = contentLabel;
                break;


            default:
                break;
        }
        
        CALayer *layerLine = [[CALayer alloc]init];
        layerLine.backgroundColor = [UIColor grayColor].CGColor;
        layerLine.frame = CGRectMake(0, 49.5*(i+1), 320, 0.5);
        [self.layer addSublayer:layerLine];
        
        
        
        if (i == 7 || i == 9) {
            
            // 电话按钮
            UIButton *phoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
            phoneButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-40,  50*i, 40, 50);
            [phoneButton setImage:[UIImage imageNamed:@"Shape-76"] forState:UIControlStateNormal];
            phoneButton.tag = 130 + i;
            [phoneButton addTarget:self action:@selector(swithContractButton:) forControlEvents:UIControlEventTouchUpInside];
            //            phoneButton.hidden = YES;
            //            self.phoneButton = phoneButton;
            [self addSubview:phoneButton];
            
        }
    }
}

-(void)swithContractButton:(UIButton *)button
{
    [self.delegate swithButtonCallIphoneWithTag:button.tag];
}
@end
