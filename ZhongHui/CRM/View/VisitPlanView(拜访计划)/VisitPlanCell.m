//
//  VisitPlanCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "VisitPlanCell.h"
#import "UserDefault.h"
#import "UIImageView+WebCache.h"
#import "VisitModel.h"
#import "VisitFrame.h"

@interface VisitPlanCell ()

@end

@implementation VisitPlanCell

static float VisitPlanCellHeight = 180;

static float VisitCellPlanMargin = 10;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, PHONE_UISCREEN_WIDTH, VisitPlanCellHeight-10);
        [self.layer addSublayer:layer];
        
        [self initVisitCell];
        
        
        [self setupVisitSubView];
    }
    return self;
}

-(void)setupVisitSubView
{
    

}

-(void)initVisitCell
{
    // 头像
    UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(VisitCellPlanMargin, VisitCellPlanMargin, 40, 40)];
    photoImage.layer.cornerRadius = 20;
    photoImage.layer.masksToBounds = YES;
    NSString *userId = [UserDefault getDataObjectForKey:@"managerID"];
    NSString *photoUrl = [NSString stringWithFormat:@"%@%@%@",MAINURL,@"attachment/view?id=",userId];
    [photoImage sd_setImageWithURL:[NSURL URLWithString:photoUrl] placeholderImage:[UIImage imageNamed:@"Man"]];
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:photoUrl]];
    photoImage.image = [UIImage imageWithData:data];
    [self addSubview:photoImage];
    
   
    // 派发人
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+VisitCellPlanMargin, VisitCellPlanMargin, 100, 20)];
    nameLabel.text = @"姓名";
    nameLabel.font = [UIFont systemFontOfSize:14];
    self.nameLabel = nameLabel;
    [self addSubview:nameLabel];
    
    // 状态
    UILabel *stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 40 - VisitCellPlanMargin, VisitCellPlanMargin+5, 40, 20)];
    stateLabel.text = @"状态";
    stateLabel.backgroundColor = [UIColor redColor];
    stateLabel.layer.cornerRadius = 5;
    stateLabel.layer.masksToBounds = YES;
    stateLabel.textColor = [UIColor whiteColor];
    stateLabel.textAlignment = NSTextAlignmentCenter;
    stateLabel.adjustsFontSizeToFitWidth = YES;
    stateLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:14];;
    self.stateLabel = stateLabel;
    [self addSubview:stateLabel];
    
    // 时间
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+VisitCellPlanMargin, CGRectGetMaxY(nameLabel.frame)+5, PHONE_UISCREEN_WIDTH - VisitCellPlanMargin - 40, 20)];
    timeLabel.text = @"2015-12-11 09:38:30";
    timeLabel.font = [UIFont systemFontOfSize:14];
    self.timeLabel = timeLabel;
    [self addSubview:timeLabel];
    
    // 提醒图标
    UIImageView *calendarImage = [[UIImageView alloc]initWithFrame:CGRectMake(VisitCellPlanMargin, CGRectGetMaxY(timeLabel.frame)+VisitCellPlanMargin, 18, 18)];
    calendarImage.image = [UIImage imageNamed:@"日程通知"];
    [self addSubview:calendarImage];
    
    
    // 开始时间
    UILabel *startLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(calendarImage.frame), CGRectGetMaxY(timeLabel.frame)+VisitCellPlanMargin, 130, 20)];
    startLabel.text = @"2015-12-12 09:56:38 - 2015-1-23";
    self.TiXingTime = startLabel;
    startLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:startLabel];
    
    // 结束时间
    UILabel *endTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(startLabel.frame), CGRectGetMaxY(timeLabel.frame)+VisitCellPlanMargin, 140, 20)];
    self.TiXingTime2 = endTimeLabel;
    endTimeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:endTimeLabel];

    
    // 内容
    UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(VisitCellPlanMargin, CGRectGetMaxY(startLabel.frame), PHONE_UISCREEN_WIDTH-VisitCellPlanMargin*2, 30)];
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.adjustsFontSizeToFitWidth = YES;
    self.contentLabel = contentLabel;
    contentLabel.numberOfLines = 0;
    [self addSubview:contentLabel];
    
    // 相关客户
    UILabel *customerLabel = [[UILabel alloc]initWithFrame:CGRectMake(VisitCellPlanMargin, CGRectGetMaxY(contentLabel.frame)+5, 60, 20)];
    customerLabel.text = @"相关客户:";
    customerLabel.adjustsFontSizeToFitWidth = YES;
    customerLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:customerLabel];
    
    // 客户名称
    UILabel *customerName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(customerLabel.frame)+5, CGRectGetMaxY(contentLabel.frame)+5, 100, 20)];
    customerName.text = @"上海优创";
    customerName.font = [UIFont systemFontOfSize:12];
    self.customerLabel = customerName;
    [self addSubview:customerName];
    
    
    
    // 相关联系人
    UILabel *contractLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(customerName.frame)+VisitCellPlanMargin, CGRectGetMinY(customerName.frame), 60, 20)];
    contractLabel.text = @"相关联系人:";
    contractLabel.adjustsFontSizeToFitWidth = YES;
    contractLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:contractLabel];
    
    // 联系人名称
    UILabel *contractName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(contractLabel.frame), CGRectGetMinY(customerName.frame), 100, 20)];
    contractName.text = @"刘超";
    self.contractLabel = contractName;
    contractName.font = [UIFont systemFontOfSize:12];
    [self addSubview:contractName];
    
    
    NSArray *marktitleArr = @[@"跟进",@"取消",@"归档"];
    
    float _linewidth = PHONE_UISCREEN_WIDTH / marktitleArr.count;
    
    for (int i = 0; i < marktitleArr.count; i ++) {
        
        CALayer *shulayer = [[CALayer alloc] init];
        shulayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
        shulayer.frame = CGRectMake(_linewidth*i, VisitPlanCellHeight- 35, 0.5, 30);
        [self.layer addSublayer:shulayer];
        
        UIButton *markbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        [markbutton setTag:600+i];
      
        [markbutton addTarget:self action:@selector(swithVisitPlanButton:) forControlEvents:UIControlEventTouchUpInside];
        markbutton.frame = CGRectMake(_linewidth*i, VisitPlanCellHeight - 40, _linewidth, 40);
        markbutton.titleLabel.font = [UIFont systemFontOfSize:15];
        [markbutton setTitleColor:RGB(0, 195, 236) forState:UIControlStateNormal];
        [markbutton setTitle:[marktitleArr objectAtIndex:i] forState:UIControlStateNormal];
        [self addSubview:markbutton];
        
        if (i < 1) {
            CALayer *henglayer = [[CALayer alloc] init];
            henglayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
            henglayer.frame = CGRectMake(0, VisitPlanCellHeight - 30 - 10, PHONE_UISCREEN_WIDTH, 0.5);
            [self.layer addSublayer:henglayer];
            
        }

    }
}


-(void)swithVisitPlanButton:(UIButton *)button
{
    [self.delegate swithVisitPlanCell:self buttonWithTag:button.tag idStr:self.visitId row:self.touchRow];
}

//#pragma mark ---  根据内容计算cell的高度
+ (CGFloat)getCellHeightWithName:(NSString *)name state:(NSString *)state time:(NSString *)time content:(NSString*)content tiXingTime:(NSString *)tiXingTime customer:(NSString *)customer contract:(NSString *)contract
{
    float cellHeight = 0;

    CGSize nameSize = [CommonUtils sizeWithContentString:name size:CGSizeMake(150, 100) lineSpace:0 font:[UIFont systemFontOfSize:14]];

    CGSize stateSize = [CommonUtils sizeWithContentString:state size:CGSizeMake(300, 100) lineSpace:0 font:[UIFont systemFontOfSize:10]];
    
    CGSize timeSize = [CommonUtils sizeWithContentString:time size:CGSizeMake(300, 100) lineSpace:0 font:[UIFont systemFontOfSize:10]];


    CGSize contentSize = [CommonUtils sizeWithContentString:content size:CGSizeMake(PHONE_UISCREEN_WIDTH - 60, CGFLOAT_MAX) lineSpace:0 font:[UIFont systemFontOfSize:14]];

    CGSize tiXingSize = [CommonUtils sizeWithContentString:tiXingTime size:CGSizeMake(100, 100) lineSpace:0 font:[UIFont systemFontOfSize:14]];

    CGSize customerSize = [CommonUtils sizeWithContentString:customer size:CGSizeMake(PHONE_UISCREEN_WIDTH-100, MAXFLOAT) lineSpace:0 font:[UIFont systemFontOfSize:14]];
    
    CGSize contractSize = [CommonUtils sizeWithContentString:contract size:CGSizeMake(PHONE_UISCREEN_WIDTH-100, MAXFLOAT) lineSpace:0 font:[UIFont systemFontOfSize:14]];


    cellHeight = nameSize.height + stateSize.height + timeSize.height + contentSize.height + tiXingSize.height + customerSize.height + contractSize.height;

    return cellHeight + 20;
}


#warning 当需要调cell的frame的时候可以重写cell的setFrame方法
-(void)setFrame:(CGRect)frame
{
    frame.origin.y += 10;
//    frame.size.height -= 30;
    [super setFrame:frame];
}
@end
