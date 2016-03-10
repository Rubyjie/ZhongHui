//
//  CollectionView.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/21.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol collectionDelegate <NSObject>

#pragma mark - 90待收款  91已收款
-(void)swithButtonQueryCollectionTypeWithTag:(NSInteger)tag;

@end

@interface CollectionView : UIView

@property (nonatomic, weak) id <collectionDelegate>delegate;

@end
