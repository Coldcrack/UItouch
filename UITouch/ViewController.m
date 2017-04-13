//
//  ViewController.m
//  UITouch
//
//  Created by 嗷嗷叫 on 2017/4/12.
//  Copyright © 2017年 嗷嗷叫aoaojiao. All rights reserved.
//

#import "ViewController.h"
#import "TouchView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TouchView *touchview = [[TouchView alloc]initWithFrame:CGRectMake(10, 10, 200, 200)];
    touchview.backgroundColor =[UIColor redColor];
    [self.view addSubview:touchview];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
