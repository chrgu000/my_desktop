//
//  ViewController.m
//  6.ViewController
//
//  Created by mzr on 2017/10/27.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    self.label1.text = @"hello";
    self.label1.layer.borderColor = [UIColor redColor].CGColor;
    self.label1.layer.backgroundColor = [UIColor redColor].CGColor;
    self.label1.layer.borderWidth = 2;
    self.label1.textAlignment = NSTextAlignmentCenter;
    self.label1.center = self.view.center;
    
    [self.view addSubview:self.label1];
    
    self.button1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 40, 100, 50)];
    [self.button1 setTitle:@"button" forState:UIControlStateNormal];
    [self.button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.button1 addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button1];
    
    
}

-(void)buttonAction{
    
    [self.view endEditing:YES];
    self.label1.text = @"点击了";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
