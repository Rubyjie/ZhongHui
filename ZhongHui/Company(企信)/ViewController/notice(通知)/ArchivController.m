//
//  ArchivController.m
//  ZhongHui
//
//  Created by 刘彦超 on 15/12/20.
//  Copyright (c) 2015年 com.shanghaiyouchaung. All rights reserved.
//

#import "ArchivController.h"
#import "ArchivView.h"

@interface ArchivController () <ArchivButtonDelegate>

@end

@implementation ArchivController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"归档";
    self.view.backgroundColor = RGB(227, 227, 227);
    
    ArchivView *view = [[ArchivView alloc]initWithFrame:self.view.bounds];
    view.delegate = self;
    [self.view addSubview:view];
}

#pragma mark - 50结果  51原因
-(void)swithButtonChooseResultAndCausesWithTag:(NSInteger)tag
{
    if (tag == 50) {
        
        NSLog(@"选择结果");
        
    }else if (tag == 51){
        
        NSLog(@"选择原因");
    }

}
@end
