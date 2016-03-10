//
//  HeaderView.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/16.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "HeaderView.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "UserDefault.h"


static CGFloat IconImageTop = 20;
static CGFloat IconImageLeft = 15;

@interface HeaderView ()
@property (nonatomic,strong) UIView *backGroundView;
@property (nonatomic,strong) NSString *actionTitle;
@property (nonatomic,assign) NSInteger postionIndexNumber;
@property (nonatomic,assign) BOOL isHadTitle;
@property (nonatomic,assign) BOOL isHadDestructionButton;
@property (nonatomic,assign) BOOL isHadOtherButton;
@property (nonatomic,assign) BOOL isHadCancelButton;
@property (nonatomic,assign) CGFloat LXActionSheetHeight;

#define CANCEL_BUTTON_COLOR                     [UIColor colorWithRed:53/255.00f green:53/255.00f blue:53/255.00f alpha:1]
#define DESTRUCTIVE_BUTTON_COLOR                [UIColor colorWithRed:185/255.00f green:45/255.00f blue:39/255.00f alpha:1]
#define OTHER_BUTTON_COLOR                      [UIColor whiteColor]
#define ACTIONSHEET_BACKGROUNDCOLOR             [UIColor colorWithRed:106/255.00f green:106/255.00f blue:106/255.00f alpha:0.8]
#define WINDOW_COLOR                            [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]
#define CORNER_RADIUS                           5

#define BUTTON_INTERVAL_HEIGHT                  20
#define BUTTON_HEIGHT                           40
#define BUTTON_INTERVAL_WIDTH                   30
#define BUTTON_WIDTH                            260
#define BUTTONTITLE_FONT                        [UIFont fontWithName:@"HelveticaNeue-Bold" size:18]
#define BUTTON_BORDER_WIDTH                     0.5f
#define BUTTON_BORDER_COLOR                     [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.8].CGColor


#define TITLE_INTERVAL_HEIGHT                   15
#define TITLE_HEIGHT                            35
#define TITLE_INTERVAL_WIDTH                    30
#define TITLE_WIDTH                             260
#define TITLE_FONT                              [UIFont fontWithName:@"Helvetica-Bold" size:14]
#define SHADOW_OFFSET                           CGSizeMake(0, 0.8f)
#define TITLE_NUMBER_LINES                      2

#define ANIMATE_DURATION                        0.25f

@end

@implementation HeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *headerImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 5, PHONE_UISCREEN_WIDTH, 100)];
        headerImage.userInteractionEnabled = YES;
        headerImage.image = [UIImage imageNamed:@"bg"];
        [self addSubview:headerImage];
        
        
        // 1.头像
        UIButton *IconImage = [[UIButton alloc]init];
        IconImage.frame = CGRectMake(IconImageLeft, IconImageTop, 100 - 40, 100 - 40);
        IconImage.tag = 120;
        IconImage.layer.cornerRadius = 30;
        IconImage.layer.masksToBounds = YES;
        NSString *userId = [UserDefault getDataObjectForKey:@"managerID"];
        NSString *photoUrl = [NSString stringWithFormat:@"%@%@%@",MAINURL,@"attachment/view?id=",userId];
        [IconImage sd_setImageWithURL:[NSURL URLWithString:photoUrl] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"Man"]];
        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:photoUrl]];
        NSLog(@"----%@",data);
        [IconImage setImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
        [IconImage addTarget:self action:@selector(changePhoto:) forControlEvents:UIControlEventTouchUpInside];

        self.iconImage = IconImage;
        [headerImage addSubview:IconImage];
        
        
        // 2.姓名
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(IconImage.frame) + 10, IconImageTop + 10, 150, 15)];
//        nameLabel.text = @"众荟";
        nameLabel.font = [UIFont systemFontOfSize:14];
        nameLabel.textColor = [UIColor whiteColor];
        [headerImage addSubview:nameLabel];
        self.nameLabel = nameLabel;

        
        
        //
        UIButton *archivesButton = [UIButton buttonWithType:UIButtonTypeCustom];
        archivesButton.frame = CGRectMake(CGRectGetMaxX(IconImage.frame)+5, CGRectGetMaxX(IconImage.frame)-30, 20, 30);
        [archivesButton setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
        [self addSubview:archivesButton];
        
        // 3.手机号
        UILabel *phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(archivesButton.frame) , IconImageTop + 30, 100, 15)];
//        phoneLabel.text = @"13688888888";
        phoneLabel.textColor = [UIColor whiteColor];
        phoneLabel.font = [UIFont systemFontOfSize:14];
        [headerImage addSubview:phoneLabel];
        self.phoneLabel = phoneLabel;

        
        // 4.修改密码
        UIButton *passButton = [UIButton buttonWithType:UIButtonTypeCustom];
        passButton.frame = CGRectMake(PHONE_UISCREEN_WIDTH-80, CGRectGetMaxY(phoneLabel.frame)+5, 20, 20);
        [passButton setImage:[UIImage imageNamed:@"修改密码"] forState:UIControlStateNormal];
        [passButton addTarget:self action:@selector(passWordButton:) forControlEvents:UIControlEventTouchUpInside];
        [passButton setTitle:@"修改密码" forState:UIControlStateNormal];
        [self addSubview:passButton];
        
        // 5.个人档案
        UIButton *fileButton = [UIButton buttonWithType:UIButtonTypeCustom];
        fileButton.frame = CGRectMake(PHONE_UISCREEN_WIDTH-40, CGRectGetMaxY(phoneLabel.frame)+5, 20, 20);
        [fileButton setImage:[UIImage imageNamed:@"客户"] forState:UIControlStateNormal];
        [fileButton addTarget:self action:@selector(personFile:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:fileButton];
       
    }
    return self;
}


-(void)personFile:(UIButton *)button
{
    [self.delegate swithButtonModifyPersonFile];
}


-(void)passWordButton:(UIButton *)button
{
    [self.delegate swithButtonChangePassWord];
}

-(void)changePhoto:(UIButton *)buttonImage
{
    [self.delegate choosePhotoUpDataWithTag:buttonImage.tag];
}

@end
