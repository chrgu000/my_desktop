//
//  ViewController.m
//  UIbutton2
//
//  Created by mzr on 2017/10/18.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "ViewController.h"
#import "Mybutton.h"

@interface ViewController ()
- (IBAction)myAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self button1];
    [self button2];
    [self button3];
    [self button6];
}
-(void)button6{
    
    Mybutton *button6 = [[Mybutton alloc]initWithFrame:CGRectMake(20, 250, 200, 50)];
//    button6.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button6];
}
-(void)button3{
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button3.frame = CGRectMake(20, 200, 200, 50);
    [self.view addSubview:button3];
    
}
-(void)button2 {
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(20, 150, 200, 50)];
    [button2 setTitle:@"button2" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button2.layer.borderColor=[UIColor blueColor].CGColor;
    button2.layer.borderWidth =2.0;
    button2.layer.cornerRadius=10.0;
    [self.view addSubview:button2];
}
-(void)button1{

    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(20, 100, 200 , 50)];
    [button1 setTitle:@"button1" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    button1.backgroundColor = [UIColor greenColor];
    [button1 addTarget:self action:@selector(button1Action) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button1];
}

-(void)button1Action{

    NSLog(@"我是点击事件啊");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)myAction:(id)sender {
    UIButton *button1 = (UIButton *)sender;
    button1.backgroundColor = [UIColor redColor];
}
@end
