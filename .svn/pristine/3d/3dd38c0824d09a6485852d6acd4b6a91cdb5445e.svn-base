//
//  DefaultCell.h
//  E家洁app
//
//  Created by 刘彦超 on 15/8/30.
//  Copyright (c) 2015年 刘彦超. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DefaultDataPickerDelegate <NSObject>
@optional


- (void)returnTime:(NSInteger )whichdatapicker shijianchuo:(NSString *)shijianchuo shijian:(NSString *)timestr;

@end

@interface DefaultCell : UIView

@property (nonatomic, weak) id <DefaultDataPickerDelegate>delegate;
@property (nonatomic, assign) NSInteger whichCell;

- (void)showDatapicker;
- (void)hiddenDatapicker;

@end
