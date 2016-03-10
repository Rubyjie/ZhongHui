//
//  YCSearchBar.m
//  Weibo
//
//  Created by 刘彦超 on 15/12/11.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "YCSearchBar.h"

@interface YCSearchBar ()
@property (nonatomic,weak)UIImageView *iconVIew;

@end

@implementation YCSearchBar

+(instancetype)searchBar
{
    return [[self alloc]init];
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        UITextField *searchBar = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-20, 30)];
        self.background = [UIImage resizeImageWithName:@"searchbar_textfield_background"];
        UIImageView *iocnView = [[UIImageView alloc]initWithImage:[UIImage imageWithName:@"searchbar_textfield_search_icon"]];
        iocnView.contentMode = UIViewContentModeCenter;
        self.iconVIew = iocnView;
        self.leftView = iocnView;
        self.clearButtonMode = UITextFieldViewModeAlways;
        self.font = [UIFont systemFontOfSize:13];
        //    searchBar.placeholder = @"搜索";
        
#pragma mark - attributedPlaceholder带属性的placeholder
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
        self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"输入关键字按标题、内容模糊查询" attributes:attrs];
#pragma mark - leftView始终显示
        self.leftViewMode = UITextFieldViewModeAlways;
        
        self.returnKeyType = UIReturnKeySearch;
        // 自动提示右下角能不能用
        self.enablesReturnKeyAutomatically = YES;
    
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.leftView.frame = CGRectMake(0, 0, 20, self.frame.size.height);

}

@end
