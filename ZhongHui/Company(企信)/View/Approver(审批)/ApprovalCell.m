//
//  ApprovalCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/18.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ApprovalCell.h"

@implementation ApprovalCell

static float ApprovalCellMargin = 10;

static float appCellHeight = 190;

#pragma mark 审批提醒

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
        
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        layer.frame = CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width, appCellHeight-10);
        [self.layer addSublayer:layer];
        
        [self initApprovalCell];
    }
    return self;
}

-(void)initApprovalCell
{
    // 头像
    UIImageView *photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(ApprovalCellMargin, ApprovalCellMargin, 40, 40)];
    photoImage.image = [UIImage imageNamed:@"Man"];
    [self addSubview:photoImage];
    
    // 申请人
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+ApprovalCellMargin, ApprovalCellMargin, 100, 20)];
    nameLabel.text = @"姓名";
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:nameLabel];
    
    // 状态
    UILabel *stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH - 100 - ApprovalCellMargin, ApprovalCellMargin, 100, 20)];
    stateLabel.text = @"状态";
    stateLabel.textAlignment = NSTextAlignmentRight;
    stateLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:stateLabel];
    
    // 时间
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(photoImage.frame)+ApprovalCellMargin, CGRectGetMaxY(nameLabel.frame)+5, PHONE_UISCREEN_WIDTH - ApprovalCellMargin - 40, 20)];
    timeLabel.text = @"2015-12-11 09:38:30";
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:timeLabel];
    
    // 提醒图标
    UIImageView *calendarImage = [[UIImageView alloc]initWithFrame:CGRectMake(ApprovalCellMargin, CGRectGetMaxY(timeLabel.frame)+ApprovalCellMargin, 18, 18)];
    calendarImage.image = [UIImage imageNamed:@"日程通知"];
    [self addSubview:calendarImage];

    
    
    // 要求时间
    UILabel *requirementsLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(calendarImage.frame), CGRectGetMaxY(timeLabel.frame)+ApprovalCellMargin, PHONE_UISCREEN_WIDTH-ApprovalCellMargin*2, 20)];
    requirementsLabel.text = @"2015-12-12 09:56:38(要求完成时间)";
    requirementsLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:requirementsLabel];
    
    // 标题
    CGFloat titleX = ApprovalCellMargin;
    CGFloat titleY = CGRectGetMaxY(requirementsLabel.frame)+ApprovalCellMargin;
    CGFloat titleW = PHONE_UISCREEN_WIDTH - ApprovalCellMargin * 2;
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"标题:您飞机开放呢那贷款金额万罚款金额肯德基内方可";
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.numberOfLines = 0;
    CGSize titleLabelSize = [titleLabel.text boundingRectWithSize:CGSizeMake(titleW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    titleLabel.frame = (CGRect){{titleX, titleY}, titleLabelSize};
    [self addSubview:titleLabel];
    
    // 客户
    UILabel *customerLabel = [[UILabel alloc]initWithFrame:CGRectMake(ApprovalCellMargin, CGRectGetMaxY(titleLabel.frame), PHONE_UISCREEN_WIDTH-ApprovalCellMargin*2, 20)];
    customerLabel.text = @"客户名称";
    customerLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:customerLabel];

    
    // 联系人
    UILabel *contractLabel = [[UILabel alloc]initWithFrame:CGRectMake(PHONE_UISCREEN_WIDTH-ApprovalCellMargin - 100, CGRectGetMaxY(customerLabel.frame)-20, 100, 20)];
    contractLabel.text = @"联系人名称";
    contractLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:contractLabel];
    
    NSArray *marktitleArr = @[@"批复",@"记录",@"催单"];
    
    float _linewidth = PHONE_UISCREEN_WIDTH / 3;
    
    for (int i = 0; i < 3; i ++) {
        
        CALayer *shulayer = [[CALayer alloc] init];
        shulayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
        shulayer.frame = CGRectMake(_linewidth*i, appCellHeight- 35, 0.5, 30);
        [self.layer addSublayer:shulayer];
        
        UIButton *markbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        [markbutton setTag:100+i];
        [markbutton addTarget:self action:@selector(swithApproverButton:) forControlEvents:UIControlEventTouchUpInside];
        markbutton.frame = CGRectMake(_linewidth*i, appCellHeight - 40, _linewidth, 40);
        markbutton.backgroundColor = [UIColor clearColor];
        markbutton.titleLabel.font = [UIFont systemFontOfSize:15];
        [markbutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [markbutton setTitle:[marktitleArr objectAtIndex:i] forState:UIControlStateNormal];
        [self addSubview:markbutton];
        
        if (i < 1) {
            CALayer *henglayer = [[CALayer alloc] init];
            henglayer.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
            henglayer.frame = CGRectMake(0, appCellHeight - 30 - 10, PHONE_UISCREEN_WIDTH, 0.5);
            [self.layer addSublayer:henglayer];

        }
    }

}

-(void)swithApproverButton:(UIButton *)button
{
    [self.delegate swithButtonLookApproverWithRecordWithReminderWithTag:button.tag];
}

@end
