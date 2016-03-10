//
//  DocumentCell.m
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/13.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import "DocumentCell.h"

@implementation DocumentCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self initDocumentCell];
    }
    return self;
}

-(void)initDocumentCell
{
    CGFloat labelWidth = PHONE_UISCREEN_WIDTH / 3;
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, labelWidth, 40)];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.font = [UIFont systemFontOfSize:14];
    self.nameLabel = nameLabel;
    [self addSubview:nameLabel];
    

    UILabel *typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelWidth, 0, labelWidth, 40)];
    typeLabel.font = [UIFont systemFontOfSize:14];
    typeLabel.textAlignment = NSTextAlignmentCenter;
    typeLabel.textColor = [UIColor grayColor];
    self.typeLabel = typeLabel;
    [self addSubview:typeLabel];
    

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(labelWidth*2, 0, labelWidth, 40);
    [button setTitleColor:RGB(0, 195, 236) forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    [button addTarget:self action:@selector(clcikButtonDownload:) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.numberOfLines = 2;
    [self addSubview:button];
    self.downButton = button;

    
}


-(void)clcikButtonDownload:(UIButton *)button
{
    [self.delegate swithButtonDownLoadAttachmentWithDocumentId:self.documentId];
}



@end
