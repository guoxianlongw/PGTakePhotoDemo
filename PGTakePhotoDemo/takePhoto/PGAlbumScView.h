//
//  PGAlbumScView.h
//  sdImgDemo
//
//  Created by Paul.Guo on 15/9/24.
//  Copyright (c) 2015年 Paul.Guo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^PGAlbumBlock) (NSInteger currentInt) ;
@protocol PGAlbumDelegate <NSObject>
- (void)isSingleTap:(BOOL)isTap;
@end


@interface PGAlbumScView : UIScrollView

@property (nonatomic , strong)PGAlbumBlock block;
@property (nonatomic , assign)id<PGAlbumDelegate>customDelegate;


+ (instancetype)loadPG_Album;
- (void)pgPhoto_imgTotalArr:(NSArray *)array currentInt:(NSInteger)currentInt;
- (void)savePic:(NSInteger)a ;
@end



/*
                                            使用方法 : 

NSArray *array = @[@"http://g.hiphotos.baidu.com/image/pic/item/b90e7bec54e736d109a9e10998504fc2d562697c.jpg" ,
                   @"http://e.hiphotos.baidu.com/image/pic/item/0eb30f2442a7d93384d24b72ae4bd11373f001bc.jpg" ,
                   @"http://f.hiphotos.baidu.com/image/pic/item/d01373f082025aaf31b913caf8edab64034f1a23.jpg" ,
                   @"http://b.hiphotos.baidu.com/image/pic/item/908fa0ec08fa513dffe50fd63f6d55fbb2fbd96f.jpg" ,
                   @"http://f.hiphotos.baidu.com/image/pic/item/0823dd54564e92580c4c76ee9e82d158ccbf4eb2.jpg" ,
                   @"http://g.hiphotos.baidu.com/image/pic/item/8c1001e93901213f1683b6dc56e736d12f2e957a.jpg" ,
                   @"http://d.hiphotos.baidu.com/image/pic/item/0b55b319ebc4b74540a47a1ecdfc1e178a821581.jpg"
                   ];




PGAlbumScView *pga = [PGAlbumScView loadPG_Album];

[pga pgPhoto_imgTotalArr:array currentInt:2];

[self.view addSubview:pga];


*/