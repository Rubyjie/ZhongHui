//
//  VisitFrame.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/3/9.
//  Copyright © 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "VisitFrame.h"
#import "VisitModel.h"


@implementation VisitFrame

-(void)setVisitData:(VisitModel *)visitData
{
    _visitData = visitData;
    
    // cell的宽度
    CGFloat cellW = PHONE_UISCREEN_WIDTH;
    
    // 1. 头像
    CGFloat photoImageW = 40;
    CGFloat photoImageH = 40;
    CGFloat photoImageX = VisitFrameMargin;
    CGFloat photoImageY = VisitFrameMargin;
    _photoImageF = CGRectMake(photoImageX, photoImageY, photoImageW, photoImageH);
    
    // 2. 姓名
    CGFloat nameViewX = CGRectGetMaxX(_photoImageF) + VisitFrameMargin;
    CGFloat nameViewY = photoImageY;
    CGSize nameSize = [visitData.name sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    _nameViewF = CGRectMake(nameViewX, nameViewY, nameSize.width, nameSize.height);
    
    // 3.状态
    CGFloat stateViewX = PHONE_UISCREEN_WIDTH - VisitFrameMargin - 40;
    CGFloat stateViewY = nameViewY;
    CGSize stateSize = [visitData.state sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    _stateViewF = CGRectMake(stateViewX, stateViewY, stateSize.width, stateSize.height);
    
    // 4.时间
    CGFloat timeViewX = nameViewX;
    CGFloat timeViewY = CGRectGetMaxY(_nameViewF) + VisitFrameMargin;
    CGSize timeSize = [visitData.time sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    _timeViewF = CGRectMake(timeViewX, timeViewY, timeSize.width, timeSize.height);

    // 5.开始时间
    CGFloat startTimeViewX = VisitFrameMargin + 40;
    CGFloat startTimeViewY = MAX(CGRectGetMaxY(_photoImageF), CGRectGetMaxY(_timeViewF)) + VisitFrameMargin;
    CGSize startTimeSize = [visitData.startTime sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    _startTimeF = CGRectMake(startTimeViewX, startTimeViewY, stateSize.width, startTimeSize.height);

    
    // 6.内容
    CGFloat contentViewX = VisitFrameMargin;
    CGFloat contentViewY = CGRectGetMaxY(_startTimeF) + VisitFrameMargin;
//    CGSize contentSize = [visitData.content sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(cellW, MAXFLOAT)];
    
    CGSize contentSize = [visitData.content boundingRectWithSize:CGSizeMake(cellW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    _contentViewF = CGRectMake(contentViewX, contentViewY, contentSize.width, contentSize.height);
    

    // 7.工具条
    CGFloat ToolbarX = photoImageX;
    CGFloat ToolbarY = CGRectGetMaxY(_contentViewF) + VisitFrameMargin;
    CGFloat ToolbarW = cellW;
    CGFloat ToolbarH = 35;
    _toolBarViewF = CGRectMake(ToolbarX, ToolbarY, ToolbarW, ToolbarH);
    
    // 8.cell的高度
    _cellHight = CGRectGetMaxY(_toolBarViewF) + VisitFrameMargin;

    
}



@end
