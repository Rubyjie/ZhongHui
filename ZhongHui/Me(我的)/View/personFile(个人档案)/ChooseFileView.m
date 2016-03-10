//
//  ChooseFileView.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/1.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "ChooseFileView.h"
#import "PopupView.h"
#import "AFNetworking.h"

@interface ChooseFileView () <UITextFieldDelegate,PopviewDelegate>

@property (nonatomic, strong)PopupView *sexPopView;
@property (nonatomic, strong)NSMutableArray *sexNameArray;
@property (nonatomic, strong)NSMutableArray *sexValueArray;


@property (nonatomic, strong)PopupView *statusPopView;
@property (nonatomic, strong)NSMutableArray *statusArray;
@property (nonatomic, strong)NSMutableArray *statusValueArray;


@property (nonatomic, strong)PopupView *yeTaiPopView;
@property (nonatomic, strong)NSMutableArray *yeiTaiNameArray;
@property (nonatomic, strong)NSMutableArray *yeiTaiValueArray;


@property (nonatomic, strong)PopupView *jiGouPopView;
@property (nonatomic, strong)NSMutableArray *jiGouArray;
@property (nonatomic, strong)NSMutableArray *jiGouIdArray;

@end

@implementation ChooseFileView


-(PopupView *)jiGouPopView
{
    if (!_jiGouPopView) {
        
        _jiGouPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.jiGouArray];
        _jiGouPopView.delegate = self;
        _jiGouPopView.tag = 800;
    }
    return _jiGouPopView;
}

-(NSMutableArray *)jiGouArray
{
    if (!_jiGouArray) {
        
        _jiGouArray = [NSMutableArray array];
    }
    return _jiGouArray;
}

-(NSMutableArray *)jiGouIdArray
{
    if (!_jiGouIdArray) {
        
        _jiGouIdArray = [NSMutableArray array];
    }
    return _jiGouIdArray;
}

-(PopupView *)yeTaiPopView
{
    if (!_yeTaiPopView) {
        
        _yeTaiPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.yeiTaiNameArray];
        _yeTaiPopView.delegate = self;
        _yeTaiPopView.tag = 700;
    }
    return _yeTaiPopView;
}


-(NSMutableArray *)yeiTaiNameArray
{
    if (!_yeiTaiNameArray) {
        
        _yeiTaiNameArray = [NSMutableArray array];
    }
    return _yeiTaiNameArray;
}

-(NSMutableArray *)yeiTaiValueArray
{
    if (!_yeiTaiValueArray) {
        
        _yeiTaiValueArray = [NSMutableArray array];
    }
    return _yeiTaiValueArray;
}

-(PopupView *)statusPopView
{
    if (!_statusPopView) {

        _statusPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.statusArray];
        _statusPopView.delegate = self;
        _statusPopView.tag = 600;
    }
    return _statusPopView;
}

-(NSMutableArray *)statusArray
{
    if (!_statusArray) {
        
        _statusArray = [NSMutableArray array];
    }
    return _statusArray;
}

-(NSMutableArray *)statusValueArray
{
    if (!_statusValueArray) {
        
        _statusValueArray = [NSMutableArray array];
    }
    return _statusValueArray;
}

-(PopupView *)sexPopView
{
    if (!_sexPopView) {
        
        _sexPopView = [[PopupView alloc]initWithFrame:[UIScreen mainScreen].bounds titleArray:self.sexNameArray];
        _sexPopView.delegate = self;
        _sexPopView.tag = 500;
    }
    return _sexPopView;
}

-(NSMutableArray *)sexNameArray
{
    if (!_sexNameArray) {
        
        _sexNameArray = [NSMutableArray array];
    }
    return _sexNameArray;
}

-(NSMutableArray *)sexValueArray
{
    if (!_sexValueArray) {
        
        _sexValueArray = [NSMutableArray array];
    }
    
    return _sexValueArray;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        // 初始化view
        [self setupChooseFileViews];
        
        // 获取性别数据
        [self getSexData];
        
        // 获取状态数据
        [self getStatusData];
        
        // 获取业态数据（事业部）
        [self getYeiTaiData];
        
        // 获取归属机构数据
        [self getJiGouData];
    }
    return self;
}

-(void)getJiGouData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/org/queryAll?"];
    
    NSDictionary *dict = @{@"name":@""};
    
    NSLog(@"%@",url);
    
    AFHTTPRequestOperationManager *manage = [AFHTTPRequestOperationManager manager];
    
    [manage POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSDictionary *dataDict = [responseObject objectForKey:@"data"];
            NSArray *dataArray = [dataDict objectForKey:@"data"];
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *name = [dict objectForKey:@"name"];
                NSString *idStr = [dict objectForKey:@"id"];
                [self.jiGouArray addObject:name];
                [self.jiGouIdArray addObject:idStr];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}

-(void)getYeiTaiData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/parameter/item/business/queryValid?type=BP_YETAI"];
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    [manger GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *yeiTaiName = [dict objectForKey:@"name"];
                NSString *yeiTaiValue = [dict objectForKey:@"value"];
                [self.yeiTaiNameArray addObject:yeiTaiName];
                [self.yeiTaiValueArray addObject:yeiTaiValue];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}

-(void)getStatusData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/parameter/item/business/queryValid?type=BP_YGZT"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"------%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *statusName = [dict objectForKey:@"name"];
                NSString *statusValue = [dict objectForKey:@"value"];
                [self.statusArray addObject:statusName];
                [self.statusValueArray addObject:statusValue];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];


}

-(void)getSexData
{
    NSString *url = [NSString stringWithFormat:@"%@%@",MAINURL,@"base/parameter/item/business/queryValid?type=BP_SEX"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"----%@",[responseObject JSONString]);
        
        if ([responseObject objectForKey:@"success"]) {
            
            NSArray *dataArray = [responseObject objectForKey:@"data"];
            for (int i = 0; i < dataArray.count; i++) {
                
                NSDictionary *dict = [dataArray objectAtIndex:i];
                NSString *sexName = [dict objectForKey:@"name"];
                NSString *sexValue = [dict objectForKey:@"value"];
                
                [self.sexNameArray addObject:sexName];
                [self.sexValueArray addObject:sexValue];
            }
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];

}


-(void)setupChooseFileViews
{
    NSArray *titleArray = @[@"头像",@"姓名",@"工号",@"性别",@"所属机构",@"移动电话",@"邮件",@"职务",@"职位",@"事业部",@"备注",@"状态"];
    
    for (int i = 0; i < titleArray.count; i++) {
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 50*i, 60, 50)];
        titleLabel.text = [titleArray objectAtIndex:i];
        titleLabel.textColor = [UIColor grayColor];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:titleLabel];
        
//        if (i > 0) {
//           
//        }
        
        if (i == 0) {
        
            UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 50, 10, 40, 40)];
            iconImage.layer.cornerRadius = 20;
            iconImage.layer.masksToBounds = YES;
            [self addSubview:iconImage];
            self.iconImage = iconImage;
            
        }else {
        
            CALayer *henglayer = [[CALayer alloc] init];
            henglayer.backgroundColor = RGB(0, 195, 236).CGColor;
            henglayer.frame = CGRectMake(0,  49.5*i, PHONE_UISCREEN_WIDTH, 0.5);
            [self.layer addSublayer:henglayer];
            
        }
        
        if (i == 3 || i == 4 || i == 9 || i == 11) {
            
            UIButton *chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
            chooseButton.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame), 50*i, PHONE_UISCREEN_WIDTH-80, 50);
            [chooseButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            chooseButton.tag = 100+i;
            [chooseButton addTarget:self action:@selector(clcikChooseButton:) forControlEvents:UIControlEventTouchUpInside];
            chooseButton.titleLabel.font = [UIFont systemFontOfSize:15];
            chooseButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            [self addSubview:chooseButton];

            switch (i) {
                case 3:
                    self.sexButton = chooseButton;
                    break;
                case 4:
                    self.jiGouButton = chooseButton;
                    break;
                
                case 9:
                    self.shiyeButton = chooseButton;
                    break;
                case 11:
                    self.statusButton = chooseButton;
                default:
                    break;
            }

        }else {
        
            UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame), 50*i, PHONE_UISCREEN_WIDTH-80, 50)];
            textfield.textAlignment = NSTextAlignmentRight;
            textfield.font = [UIFont systemFontOfSize:15];
            textfield.delegate = self;
            textfield.textColor = [UIColor grayColor];
            [self addSubview:textfield];
            switch (i) {
                case 1:
                    self.nameText = textfield;
                    break;
                case 2:
                    self.numberText = textfield;
                    break;
                case 5:
                    self.phoneText = textfield;
                    break;
                case 6:
                    self.emailText = textfield;
                    break;
                case 7:
                    self.zhiwuText = textfield;
                    break;
                case 8:
                    self.positionText = textfield;
                    break;
                case 10:
                    self.beizhuText = textfield;
                    break;
                default:
                    break;
            }
    
        }
        
    }
    
}

-(void)clcikChooseButton:(UIButton *)button
{
    
    [self endEditing:YES];
    
    if (button.tag == 103) {
        
        [self.sexPopView showAlert];
        
    }else if (button.tag == 104) {
        
        [self.jiGouPopView showAlert];
        
    }else if (button.tag == 109) {
    
        [self.yeTaiPopView showAlert];
        
    }else if (button.tag == 111) {
    
        [self.statusPopView showAlert];
    
    }

}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

-(void)selectWhichButtonWithTag:(NSInteger)tag popView:(PopupView *)popview
{
    if (popview.tag == 500) {
        
        [self.sexButton setTitle:[self.sexNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        [self.sexButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.sexValue = [self.sexValueArray objectAtIndex:tag - 100];
        
    }else if (popview.tag == 600) {
    
        [self.statusButton setTitle:[self.statusArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        self.statusValue = [self.statusValueArray objectAtIndex:tag - 100];
        
    }else if (popview.tag == 700) {
    
        [self.shiyeButton setTitle:[self.yeiTaiNameArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        self.shiyeValue = [self.yeiTaiValueArray objectAtIndex:tag - 100];
        
    }else if (popview.tag == 800) {
    
        [self.jiGouButton setTitle:[self.jiGouArray objectAtIndex:tag - 100] forState:UIControlStateNormal];
        self.jiGouId = [self.jiGouIdArray objectAtIndex:tag - 100];
    }

}

@end
