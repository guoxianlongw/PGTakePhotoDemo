//
//  PGScrollView.m
//  sdImgDemo
//
//  Created by Paul.Guo on 15/9/24.
//  Copyright (c) 2015年 Paul.Guo. All rights reserved.
//

#import "PGScrollView.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"
//#import "SGInfoAlert.h"

#define kscreenHeightss [UIScreen mainScreen].bounds.size.height
#define kscreenwidthss [UIScreen mainScreen].bounds.size.width


@interface PGScrollView ()<UIScrollViewDelegate>
@property(nonatomic , strong)UIImageView *imageView;
@end



@implementation PGScrollView

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
    }
    return _imageView ;
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
    self.showsHorizontalScrollIndicator = YES;
    self.showsVerticalScrollIndicator = YES;
    self.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    self.maximumZoomScale = 3.0;
    self.minimumZoomScale = 1.0;
    self.delegate = self ;
    
    
    
    //单击手势
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:tap1];


    //双击放大缩小手势
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    //双击
    tap2.numberOfTapsRequired = 2;
    //手指的数量
    tap2.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:tap2];

    
    //tap1、tap2两个手势同时响应时，则取消tap1手势
    [tap1 requireGestureRecognizerToFail:tap2];
}



#pragma mark - UIScrollView delegate
//返回需要缩放的子视图
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    //缩放的比例
//    float zoomScale = scrollView.zoomScale;
    CGFloat xcenter = scrollView.center.x , ycenter = scrollView.center.y;
    //目前contentsize的width是否大于原scrollview的contentsize，如果大于，设置imageview中心x点为contentsize的一半，以固定imageview在该contentsize中心。如果不大于说明图像的宽还没有超出屏幕范围，可继续让中心x点为屏幕中点，此种情况确保图像在屏幕中心。
    xcenter = scrollView.contentSize.width > scrollView.frame.size.width ?
    scrollView.contentSize.width/2 : xcenter;
    //同上，此处修改y值
    ycenter = scrollView.contentSize.height > scrollView.frame.size.height ?
    scrollView.contentSize.height/2 : ycenter;
//    [self.imageView setCenter:CGPointMake(xcenter, ycenter)];
    
}


static BOOL isTap = YES ;

- (void)tapAction:(UITapGestureRecognizer *)tap {
    
    
    if (tap.numberOfTapsRequired == 1) {
        //显示、隐藏导航栏
        if (self.customBlock) {
            self.customBlock (isTap) ;
        }
        isTap = !isTap ;

    }
    else if(tap.numberOfTapsRequired == 2) {
        
        if (self.zoomScale > 1) {
            [self setZoomScale:1 animated:YES];
        } else {
            [self setZoomScale:3 animated:YES];
        }
    }
}


- (void)setImgString:(NSString *)imgString
{
    if (![imgString isKindOfClass:[NSString class]] && [imgString isKindOfClass:[UIImage class]]) {
        self.NetImg = (UIImage *)imgString ;
        return ;
    };
    
    if (![imgString isKindOfClass:[NSString class]] && [imgString isKindOfClass:[NSData class]]) {
        NSData *data = (NSData *)imgString ;
        UIImage *img = [UIImage imageWithData:data];
        self.NetImg = img  ;
        return ;
    }
    
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imgString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
    {
        
        if (!image) return ;

        CGFloat heights = [UIScreen mainScreen].bounds.size.width * image.size.height / image.size.width  ;
        
        self.imageView.frame = CGRectMake(0, (kscreenHeight-heights)/5*2 , kcscreenWidth , heights );
        
    }];
}

- (void)setNetImg:(UIImage *)NetImg
{
    UIImage *image = NetImg ;
    
    CGFloat heights = [UIScreen mainScreen].bounds.size.width * image.size.height / image.size.width  ;
    
    self.imageView.frame = CGRectMake(0, (kscreenHeight-heights)/5*2 , kcscreenWidth , heights );
    
    self.imageView.image = image; 
}

- (void)saveImg
{
    UIImageWriteToSavedPhotosAlbum(self.imageView.image, self , @selector(image:didFinishSavingWithError:contextInfo:) , nil );
}

- (void)image:(UIImage *)iamge didFinishSavingWithError:(NSError *)error contextInfo:(void *)context{
   
    NSLog(@"图片保存相册成功");
    
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    [SGInfoAlert showInfo:@"保存相册成功" bgColor:[UIColor darkGrayColor].CGColor inView:window vertical:.8];
    
}

@end
