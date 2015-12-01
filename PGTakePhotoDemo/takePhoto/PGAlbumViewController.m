//
//  PGAlbumViewController.m
//  sdImgDemo
//
//  Created by Paul.Guo on 15/9/24.
//  Copyright (c) 2015年 Paul.Guo. All rights reserved.
//

#import "PGAlbumViewController.h"
#import "PGAlbumScView.h"
#import "UIViewExt.h"


#define CUSTOMFONT(x) [UIFont systemFontOfSize:x]



#define kscreenHeightss [UIScreen mainScreen].bounds.size.height
#define kscreenwidthss [UIScreen mainScreen].bounds.size.width

#define CURRENTSTRING(a) [NSString stringWithFormat:@"%ld/%lu", (long)a , (unsigned long)self.imgArray.count]





@interface PGAlbumViewController ()<PGAlbumDelegate>
@property(nonatomic , strong)UIView *navView;
@property (nonatomic , strong)UILabel *titleLabel;
@end








@implementation PGAlbumViewController




- (UIView *)navView
{
    if (_navView == nil) {
        _navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kscreenwidthss, 64)];
        
        UIView *maskView = [[UIView alloc] initWithFrame:_navView.bounds];
        maskView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
        [_navView addSubview:maskView];

        UILabel *leftLabel = [[UILabel alloc] initWithFrame: CGRectMake(11, 38 , 44 , 21) ];
        leftLabel.bottom = 64 - 13 ;
        leftLabel.text = @"返回" ;
        leftLabel.font = CUSTOMFONT(14.0f);
        [_navView addSubview:leftLabel];
        
        
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(0, 0, 88, _navView.height);
        backBtn.backgroundColor = [UIColor clearColor];
        [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        [_navView addSubview:backBtn];
        
        
        UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        saveBtn.frame = CGRectMake(0, 20, 50, 20);
        saveBtn.centerY = leftLabel.centerY ;
        saveBtn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        saveBtn.right = kscreenwidthss - 10 ;
        [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
        saveBtn.titleLabel.font = CUSTOMFONT(14.0f);
        [saveBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [saveBtn addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
        [_navView addSubview:saveBtn];
        
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 63, [UIScreen mainScreen].bounds.size.width , .5)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [_navView addSubview:lineView];
        
        [self.view addSubview:_navView];

    }
    return _navView ;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20 , kscreenwidthss, 44)];
        _titleLabel.font = [UIFont systemFontOfSize:16.0f];
        _titleLabel.textAlignment = NSTextAlignmentCenter ;
        _titleLabel.textColor = [UIColor blackColor];
        [self.navView addSubview:_titleLabel];
    }
    return _titleLabel;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    
    
    
    
    /**
     *      照片  view          可以根据需求，自定义
     */
    PGAlbumScView *pgAlbum = [PGAlbumScView loadPG_Album];
    pgAlbum.customDelegate = self ;
    pgAlbum.tag = 10 ;
    [pgAlbum pgPhoto_imgTotalArr:self.imgArray currentInt:self.currentInt];
    [self.view addSubview:pgAlbum];
    pgAlbum.block = ^(NSInteger currentInt)
    {
        self.titleLabel.text = CURRENTSTRING(currentInt);
    };
    
    
    
    
    
    /**
     *      黑色 navbar
     */
    self.navView.backgroundColor = [UIColor clearColor];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.text = CURRENTSTRING(self.currentInt+1);
    
    
    
    
    self.view.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}



#pragma mark --  PGAlbumScView  delegate

- (void)isSingleTap:(BOOL)isTap
{
    int a = isTap==YES ? 0 : 64 ;
    
    
    [UIView animateWithDuration:.15 animations:^{
        self.navView.bottom = a ;
    }];
    
    
    PGAlbumScView *scView = (PGAlbumScView *)[self.view viewWithTag:10];
    if (isTap) scView.backgroundColor = [UIColor blackColor];
    else       scView.backgroundColor = [UIColor whiteColor];
    
}



#pragma mark - 保存相册
- (void)saveAction
{
    NSArray *array = [self.titleLabel.text componentsSeparatedByString:@"/"];
    
    if (array.count < 2) return ;
    
    NSInteger a = [array[0] intValue] - 1;
    
//    NSString *imgStr = self.imgArray[a];
    
    
    PGAlbumScView *scView = (PGAlbumScView *)[self.view viewWithTag:10];
    [scView savePic:a];
//    UIImage *img = [UIImage imageNamed:imgStr];
    
//    UIImageWriteToSavedPhotosAlbum(img, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}

- (void)image:(UIImage *)iamge didFinishSavingWithError:(NSError *)error contextInfo:(void *)context{
    NSLog(@"图片保存相册成功");
}


#pragma mark - pop
- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}




@end
