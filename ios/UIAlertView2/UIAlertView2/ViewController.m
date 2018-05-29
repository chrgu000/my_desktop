//
//  ViewController.m
//  UIAlertView2
//
//  Created by mzr on 2017/10/19.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "ViewController.h"
#import "MyAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self alertView1];
//    [self alertView2];
//    [self actionSheet1];
    [self myalertView];
}

-(void)myalertView{
    
    MyAlertView *alertView = [[MyAlertView alloc]initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-40, 100)];
    
    [self.view addSubview:alertView];
}

-(void)actionSheet1{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"action" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:@"ok" otherButtonTitles:@"1",@"2",@"3", nil];
    
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{

    NSLog(@"index=%ld", buttonIndex);
}

-(void)alertView2{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    alertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [alertView show];
    
}


-(void)alertView1 {
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"alert" message:@"title" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;//放入可填写的内容
    UITextField *textfield = [alertView textFieldAtIndex:0];//拿到textfield
    textfield.keyboardType = UIKeyboardTypeNumberPad;//将textfield设置为数字键盘
    
    [alertView show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    NSLog(@"index=%ld", buttonIndex);
    
    if(buttonIndex == 1){
        
        UITextField * name = [alertView textFieldAtIndex:0];//拿到textfield
        UITextField * password = [alertView textFieldAtIndex:1];
        NSLog(@"name= %@, password = %@", name.text, password.text);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --Action Sheet

@end
