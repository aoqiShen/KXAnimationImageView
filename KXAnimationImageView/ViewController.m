//
//  ViewController.m
//  KXAnimationImageView
//
//  Created by 王小亮 on 16/2/24.
//  Copyright © 2016年 王小亮. All rights reserved.
//

#import "ViewController.h"
#import "KXAnimationImageView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.kxView = [[KXAnimationImageView alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    self.kxView.animationDuration = 0.5;
    NSMutableArray *imageList = [NSMutableArray arrayWithObjects:@"1.jpg",@"2.jpg",@"3.jpg",nil];

    self.kxView.animationImages = imageList;
    [self.kxView setCurrentImage];
    [self.view addSubview:self.kxView];
//    [self.kxView startAnimating];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 50, 60, 30);
    [btn setTitle:@"开始运行" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(animationImagesControl:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animationImagesControl:(id)sender{
    UIButton *tmpBtn = sender;
    if ([self.kxView isAnimating]) {
        [self.kxView stopAnimating];

        [tmpBtn setTitle:@"开始运行" forState:UIControlStateNormal];
    }
    else{
        self.
        kxView.animationRepeatCount = 2;
        [self.kxView startAnimating];
        [tmpBtn setTitle:@"停止运行" forState:UIControlStateNormal];
    }
}

@end
