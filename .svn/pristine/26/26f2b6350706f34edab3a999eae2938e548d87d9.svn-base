//
//  PendApproverCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "PendApproverCell.h"

@implementation PendApproverCell

static float PendApproverCellMargin = 10;

static float PendApproverCellHeight = 190;

#pragma mark 审批提醒

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, PHONE_UISCREEN_WIDTH, PendApproverCellHeight - 10);
        [self.layer addSublayer:layer];
        
        [self initPendApprovalCell];
    }
    return self;
}


-(void)initPendApprovalCell
{
    // 头像
    UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(PendApproverCellMargin, PendApproverCellMargin, 40, 40)];
    photoImage.image = [UIImage imageNamed:@"Man"];
    [self addSubview:photoImage];
    
    // 申请人
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+PendApproverCellMargin, PendApproverCellMargin, 100, 20)];
    nameLabel.text = @"姓名";
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:nameLabel];
    
    // 状态
    UILabel *stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 100 - PendApproverCellMargin, PendApproverCellMargin, 100, 20)];
    stateLabel.text = @"状态";
    stateLabel.textAlignment = NSTextAlignmentRight;
    stateLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:stateLabel];
    
    // 时间
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+PendApproverCellMargin, CGRectGetMaxY(nameLabel.frame)+5, PHONE_UISCREEN_WIDTH - PendApproverCellMargin - 40, 20)];
    timeLabel.text = @"2015-12-11 09:38:30";
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:timeLabel];
    
    // 提醒图标
    UIImageView *calendarImage = [[UIImageView alloc]initWithFrame:CGRectMake(PendApproverCellMargin, CGRectGetMaxY(timeLabel.frame)+PendApproverCellMargin, 18, 18)];
    calendarImage.image = [UIImage imageNamed:@"日程通知"];
    [self addSubview:calendarImage];
    
    
    
    // 要求时间
    UILabel *requirementsLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(calendarImage.frame), CGRectGetMaxY(timeLabel.frame)+PendApproverCellMargin, PHONE_UISCREEN_WIDTH-PendApproverCellMargin*2, 20)];
    requirementsLabel.text = @"2015-12-12 09:56:38(要求完成时间)";
    requirementsLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:requirementsLabel];
    
    // 标题
    CGFloat titleX = PendApproverCellMargin;
    CGFloat titleY = CGRectGetMaxY(requirementsLabel.frame)+PendApproverCellMargin;
    CGFloat titleW = PHONE_UISCREEN_WIDTH - PendApproverCellMargin * 2;
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"标题:您飞机开放呢那贷款金额万罚款金额肯德基内方可";
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.numberOfLines = 0;
    CGSize titleLabelSize = [titleLabel.text boundingRectWithSize:CGSizeMake(titleW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    titleLabel.frame = (CGRect){{titleX, titleY}, titleLabelSize};
    [self addSubview:titleLabel];

    // 姓名
    UILabel *XingMingLabel = [[UILabel alloc]initWithFrame:CGRectMake(PendApproverCellMargin, CGRectGetMaxY(titleLabel.frame), 30, 20)];
    XingMingLabel.text = @"姓名";
    XingMingLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:XingMingLabel];
    
    // 同意
    UILabel *opinionLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(XingMingLabel.frame), CGRectGetMaxY(titleLabel.frame), 50, 20)];
    opinionLabel.text = @"同意";
    opinionLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:opinionLabel];
    

    // 批复时间
    UILabel *ApproverTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH-PendApproverCellMargin-120, CGRectGetMaxY(titleLabel.frame), 120, 20)];
    ApproverTimeLabel.text = @"2013-12-23";
    ApproverTimeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:ApproverTimeLabel];

    
    NSArray *marktitleArr = @[@"记录",@"催单"];
    
    float _linewidth = PHONE_UISCREEN_WIDTH / 2;
    
    for (int i = 0; i < 2; i ++) {
        
        CALayer *shulayer = [[CALayer alloc] init];
        shulayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
        shulayer.frame = CGRectMake(_linewidth*i, PendApproverCellHeight- 35, 0.5, 30);
        [self.layer addSublayer:shulayer];
        
        UIButton *markbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        [markbutton setTag:100+i];
//        [markbutton addTarget:self action:@selector(swithApproverButton:) forControlEvents:UIControlEventTouchUpInside];
        markbutton.frame = CGRectMake(_linewidth*i, PendApproverCellHeight - 40, _linewidth, 40);
        markbutton.backgroundColor = [UIColor clearColor];
        markbutton.titleLabel.font = [UIFont systemFontOfSize:15];
        [markbutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [markbutton setTitle:[marktitleArr objectAtIndex:i] forState:UIControlStateNormal];
        [self addSubview:markbutton];
        
        if (i < 1) {
            CALayer *henglayer = [[CALayer alloc] init];
            henglayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
            henglayer.frame = CGRectMake(0, PendApproverCellHeight - 30 - 10, PHONE_UISCREEN_WIDTH, 0.5);
            [self.layer addSublayer:henglayer];
            
        }
    }

    
}

@end
