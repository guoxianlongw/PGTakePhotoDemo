//
//  PGScrollView.h
//  sdImgDemo
//
//  Created by Paul.Guo on 15/9/24.
//  Copyright (c) 2015年 Paul.Guo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^PGBlock) (BOOL isSingle);

@interface PGScrollView : UIScrollView
@property (nonatomic , copy)NSString *imgString;
@property (nonatomic , strong)PGBlock customBlock;

- (void)saveImg;

@end
