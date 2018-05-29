//
//  ViewController.m
//  helloui
//
//  Created by mzr on 2017/10/13.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置屏幕的背景色
    self.view.backgroundColor = [UIColor greenColor];
    
    //拿到的是设备尺寸(物理尺寸)
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = [UIScreen mainScreen].bounds.size.height;
    
    CGFloat x = [UIScreen mainScreen].bounds.origin.x;
    CGFloat y = [UIScreen mainScreen].bounds.origin.y;
   
    
    NSLog(@"w=%f, h=%f", w, h);
    NSLog(@"X=%f, y=%f", x,y);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
