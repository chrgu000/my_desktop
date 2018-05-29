//
//  ViewController.m
//  uibutton1
//
//  Created by mzr on 2017/10/16.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self button1];
}

-(void)button1 {
    
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 100, 200)];
    [button1 setTitle:@"button1" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:button1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
