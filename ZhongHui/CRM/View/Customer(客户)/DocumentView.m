//
//  DocumentView.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/12.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "DocumentView.h"

@implementation DocumentView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        NSArray *titleArray = @[@"文件名",@"类型",@"附件"];
        
        
        for (int i = 0; i < titleArray.count; i++) {
            
            CGFloat labelW = PHONE_UISCREEN_WIDTH / 3;
            
            UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelW*i, 0, labelW, 40)];
            titleLabel.textAlignment = NSTextAlignmentCenter;
            titleLabel.text = [titleArray objectAtIndex:i];
            titleLabel.font = [UIFont systemFontOfSize:14];
            titleLabel.textColor = [UIColor grayColor];
            [self addSubview:titleLabel];
        }
        
//        [self initContractWayView];
    }
    return self;
}




@end
