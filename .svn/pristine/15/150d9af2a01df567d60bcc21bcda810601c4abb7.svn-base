//
//  AliasVIew.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/11.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "AliasVIew.h"

@implementation AliasVIew

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        

        NSArray *titleArray = @[@"名称",@"类型",@"开始时间",@"结束时间"];

        for (int i = 0; i < titleArray.count; i++) {
            
            CGFloat labelW = PHONE_UISCREEN_WIDTH / titleArray.count;
            
            UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelW*i, 0, labelW, 40)];
            titleLabel.text = [titleArray objectAtIndex:i];
            titleLabel.textAlignment = NSTextAlignmentCenter;
            titleLabel.font = [UIFont systemFontOfSize:14];
            titleLabel.textColor = [UIColor whiteColor];
            [self addSubview:titleLabel];
        }
    }
    return self;
}




@end
