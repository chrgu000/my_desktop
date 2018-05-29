//
//  ViewController.m
//  5.viewController
//
//  Created by mzr on 2017/10/26.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 100, 20)];
    self.label1.text = @"label";
    self.label1.layer.borderColor = [UIColor redColor].CGColor;
    self.label1.layer.borderWidth = 2;
    self.label1.center = self.view.center;
    self.label1.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:self.label1];
    
    self.button1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 40, 100, 20)];
    [self.button1 setTitle:@"button" forState:UIControlStateNormal];
    [self.button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.button1 addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:self.button1];
}

-(void)clickButton{
    
    self.label1.text = @"后改的";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
