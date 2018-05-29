//
//  ViewController.m
//  UITextField
//
//  Created by mzr on 2017/10/18.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self textfield1];
    [self textfield2];
    [self textfield3];
}

-(void)textfield3{
    
    UITextField *textfield3 = [[UITextField alloc]initWithFrame:CGRectMake(20, 250, 240, 50)];
    textfield3.layer.borderColor = [UIColor blueColor].CGColor;
    textfield3.layer.borderWidth = 2;
    textfield3.layer.cornerRadius = 10;
    textfield3.borderStyle = UITextBorderStyleRoundedRect;
   
    
    UIImage *image = [UIImage imageNamed:@"plus"];
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10,  30, 30)];
    [imageview setImage:image];
    
//    [imageview setValue:[NSNumber numberWithInt:5] forKey:@"paddingLeft"];
    
    textfield3.leftView = imageview;
//    [textfield3.leftView setValue:[NSNumber numberWithInteger:5] forKey:@"padding"];
    
    [textfield3 setValue:[NSNumber numberWithInteger:5] forKey:@"paddingLeft"];//设置textfield内边距
    
    textfield3.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:textfield3];
}

-(void)textfield2 {
    
    UITextField *textfield2 = [[UITextField alloc]initWithFrame:CGRectMake(20, 150, 240, 50)];
    textfield2.borderStyle = UITextBorderStyleRoundedRect;
    textfield2.layer.borderColor = [UIColor redColor].CGColor;
    textfield2.layer.borderWidth = 2.0;
    textfield2.layer.cornerRadius = 10.0;
    textfield2.keyboardType = UIKeyboardTypeDefault;
    textfield2.returnKeyType = UIReturnKeyGo;
    textfield2.clearButtonMode = UITextFieldViewModeWhileEditing;
    textfield2.tag = 100;
    
    
    textfield2.delegate = self;
    [self.view addSubview:textfield2];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
  
    NSLog(@"text=%@,tag=%ld", textField.text, textField.tag);//拿到内容
    return true;
}
-(void)textfield1{
    UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(20, 100, 200, 50)];
    textfield.borderStyle = UITextBorderStyleLine;//边框
    textfield.textColor = [UIColor redColor];//文本颜色
    textfield.font = [UIFont systemFontOfSize:17.0];//系统默认字体
    textfield.placeholder = @"请输入姓名";//提示
    
//    textfield.keyboardType = UIKeyboardTypeDefault;
    textfield.keyboardType = UIKeyboardTypeDefault;
    textfield.returnKeyType = UIReturnKeyGo;
    [self.view addSubview:textfield];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
