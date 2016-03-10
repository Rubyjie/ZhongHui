//
//  DocumentCell.h
//  ZhongHui
//
//  Created by 刘彦超 on 16/1/13.
//  Copyright (c) 2016年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol downLoadButtonDelegate <NSObject>

#pragma mark - 点击button下载附件 传过去附件id
-(void)swithButtonDownLoadAttachmentWithDocumentId:(NSString *)documentId;

@end

@interface DocumentCell : UITableViewCell

@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *typeLabel;
@property (nonatomic, strong)UIButton *downButton;

@property (nonatomic, strong)NSString *documentId;

@property (nonatomic, weak) id <downLoadButtonDelegate>delegate;

@end
