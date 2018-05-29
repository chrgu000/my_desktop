//
//  ViewController.m
//  2UIview
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
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    
//    view.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view];
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 200,50)];
    view1.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view1];
    
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(110, 110, 200 , 50)];
    view2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view2];
//
//    
//    //交换两个视图
//    [self.view exchangeSubviewAtIndex:3 withSubviewAtIndex:2];
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(120, 120, 200, 50)];
    view3.backgroundColor = [UIColor blueColor];
    [self.view insertSubview:view3 atIndex:4];
    [self.view bringSubviewToFront:view1];
    [self.view sendSubviewToBack:view3];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
