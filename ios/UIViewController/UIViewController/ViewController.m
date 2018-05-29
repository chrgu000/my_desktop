//
//  ViewController.m
//  UIViewController
//
//  Created by mzr on 2017/10/25.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textfield1;
@property (weak, nonatomic) IBOutlet UITextField *textfield2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

@end

@implementation ViewController

- (IBAction)buttonAction:(id)sender {
    
    
    int textfield1 = [self.textfield1.text intValue];
    int textfield2 = [self.textfield2.text intValue];
    
//    NSLog(@"%@ %@", textfield1, textfield2);
//    int result = (int)textfield1 + (int)textfield2;
    int result = textfield1 + textfield2;
    
    NSLog(@"d= %d", result);
    
    self.label3.text = [NSString stringWithFormat:@"%d", result];
    
   
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    return [textField resignFirstResponder];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textfield1.delegate = self;
    self.textfield2.delegate = self;
    
    self.textfield1.keyboardType = UIKeyboardTypeNumberPad;
    self.textfield2.keyboardType = UIKeyboardTypeNumberPad;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
