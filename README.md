# PGTakePhotoDemo
自定义，相机（仿系统），相册 （仿系统）

![gifImage](https://raw.githubusercontent.com/guoxianlongw/PGTakePhotoDemo/master/takePhoto.gif)

自定义相机 ----  高仿系统相机


自定义相册 ----  高仿系统相册
    PGAlbumViewController *two = [[PGAlbumViewController alloc] init];
    two.imgArray = array ;  // 图片数组  （url ， image ， data 格式都可以）
    two.currentInt = 0 ;    // 第几张图片
    [self presentViewController:two animated:YES completion:^{}];
