//
//  ViewController.m
//  MyTextfield
//
//  Created by mzr on 2017/10/18.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "ViewController.h"
#import "MyTextfield.h"

@interface ViewController (){
    
    MyTextfield *textfield1;
    MyTextfield *textfield2;
}

@end

@implementation ViewController
- (IBAction)login:(id)sender {
    
    [textfield1 resignFirstResponder];
    [textfield2 resignFirstResponder];
    
    textfield1.layer.borderColor = [UIColor grayColor].CGColor;
    textfield2.layer.borderColor = [UIColor grayColor].CGColor;
    textfield1.text = @"";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    textfield1 = [[MyTextfield alloc]initWithFrame:CGRectMake(20, 100, 200, 50)];
    textfield2 = [[MyTextfield alloc]initWithFrame:CGRectMake(20, 200, 200, 50)];
    
    [self.view addSubview:textfield1];
    [self.view addSubview:textfield2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
