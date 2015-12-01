//
//  PGAlbumViewController.h
//  sdImgDemo
//
//  Created by Paul.Guo on 15/9/24.
//  Copyright (c) 2015年 Paul.Guo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGAlbumViewController.h"

@interface PGAlbumViewController : UIViewController



@property (nonatomic , strong)NSArray *imgArray;    //图片总集合( url 或 image 或 data)
@property (nonatomic , assign)NSInteger currentInt; // 当前索引

@end
/*
 使用方法
 
 
 - (void)buttonAction
 {
 
NSArray *array = @[@"http://e.hiphotos.baidu.com/image/pic/item/83025aafa40f4bfb874fdf55014f78f0f7361817.jpg" ,
                   @"http://e.hiphotos.baidu.com/image/pic/item/0eb30f2442a7d93384d24b72ae4bd11373f001bc.jpg" ,
                   @"http://a.hiphotos.baidu.com/image/pic/item/1c950a7b02087bf4e2035b50f0d3572c10dfcf98.jpg" ,
                   @"http://b.hiphotos.baidu.com/image/pic/item/908fa0ec08fa513dffe50fd63f6d55fbb2fbd96f.jpg" ,
                   @"http://f.hiphotos.baidu.com/image/pic/item/0823dd54564e92580c4c76ee9e82d158ccbf4eb2.jpg" ,
                   @"http://c.hiphotos.baidu.com/image/pic/item/267f9e2f0708283895fe646dba99a9014d08f1dc.jpg" ,
                   @"http://d.hiphotos.baidu.com/image/pic/item/b3b7d0a20cf431ad90fe63c24936acaf2edd9818.jpg" ,
                   @"http://f.hiphotos.baidu.com/image/pic/item/b3fb43166d224f4add937caa0bf790529822d105.jpg"
                   ];

    
    PGAlbumViewController *two = [[PGAlbumViewController alloc] init];
    two.imgArray = array ;  // 图片数组
    two.currentInt = 0 ;    // 第几张图片
    [self presentViewController:two animated:YES completion:^{}];
}

*/







