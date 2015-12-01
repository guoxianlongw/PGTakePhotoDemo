//
//  PGAlbumScView.m
//  sdImgDemo
//
//  Created by Paul.Guo on 15/9/24.
//  Copyright (c) 2015年 Paul.Guo. All rights reserved.
//

#import "PGAlbumScView.h"
#import "PGScrollView.h"

#define kscreenHeightss [UIScreen mainScreen].bounds.size.height
#define kscreenwidthss [UIScreen mainScreen].bounds.size.width


#define SPACE 10  // 两张图片的间隔


@interface PGAlbumScView ()<UIScrollViewDelegate>

@end



@implementation PGAlbumScView


#pragma mark -
+ (instancetype)loadPG_Album
{
    PGAlbumScView *album = [[PGAlbumScView alloc] initWithFrame:CGRectMake(0, 0, kscreenwidthss+10 , kscreenHeightss)];
    return album ;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViewsss];
    }
    return self;
}

- (void)initViewsss
{
    self.delegate = self;
    self.backgroundColor = [UIColor whiteColor];
    self.pagingEnabled = YES;
    self.bounces = NO ;
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = floor((scrollView.contentOffset.x - kscreenwidthss / 2) / kscreenwidthss) + 1;

    if (self.block) {
        self.block (page+1) ;
    }
}


- (void)pgPhoto_imgTotalArr:(NSArray *)array currentInt:(NSInteger)currentInt
{
    CGFloat a = kscreenwidthss+SPACE ;
    self.contentSize = CGSizeMake( a *array.count , kscreenHeightss );

    [self setContentOffset:CGPointMake(a *currentInt , 0) animated:YES];
    
    for (int i=0; i<array.count; i++) {
        PGScrollView *pg = [[PGScrollView alloc] initWithFrame:CGRectMake(kscreenwidthss*i + SPACE*i  , 0, kscreenwidthss, kscreenHeightss)];
        pg.tag = 33 + i ;
        pg.imgString = array[i];
        [self addSubview:pg];
        
        __weak PGAlbumScView * weakSelf = self ;
        
        pg.customBlock = ^(BOOL isSingle)
        {
            //是否点击
            if (weakSelf.customDelegate && [self.customDelegate respondsToSelector:@selector(isSingleTap:)]) {
                [weakSelf.customDelegate isSingleTap:isSingle];
            }
        };
    }
}

// a = 第几张图片 从0计数
- (void)savePic:(NSInteger)a
{
    PGScrollView *sc = (PGScrollView *)[self viewWithTag:(33+a)];
    
    [sc saveImg];
}

@end
