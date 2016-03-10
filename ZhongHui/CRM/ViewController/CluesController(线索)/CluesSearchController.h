//
//  CluesSearchController.h
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/24.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol clueSearchDelegate <NSObject>

-(void)searchClueWithArray:(NSMutableArray *)clueArray;

@end

@interface CluesSearchController : UIViewController

@property (nonatomic, weak) id <clueSearchDelegate>delegate;

@property (nonatomic, strong)NSString *headId;

@end
