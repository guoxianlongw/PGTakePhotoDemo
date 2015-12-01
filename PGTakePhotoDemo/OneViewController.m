//
//  OneViewController.m
//  PGTakePhotoDemo
//
//  Created by Paul.Guo on 15/12/1.
//  Copyright © 2015年 Paul.Guo. All rights reserved.
//

#import "OneViewController.h"
#import "DBTakePhotoVC.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    UIButton *myBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    myBtn.frame = CGRectMake(99, 99, 99, 99);
    myBtn.backgroundColor = [UIColor blueColor];
    [myBtn addTarget:self action:@selector(myBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myBtn];
    
    
}

- (void)myBtnAction {

    DBTakePhotoVC *db = [[DBTakePhotoVC alloc] init];
    [self.navigationController pushViewController:db animated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
