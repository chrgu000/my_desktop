//
//  ViewController.m
//  UIother
//
//  Created by mzr on 2017/10/19.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    NSString *sliderValue;
    UILabel *label;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self sliderView];
    [self addSliderValue];
    [self switchAction];
    [self dataPicker];
}


-(void)dataPicker{
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 260, 300, 200)];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dataPickerAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
}

-(void)dataPickerAction:(UIDatePicker *)datePicker{
    
    NSLog(@"%@", [datePicker date]);
    
}
-(void)switchAction{
    
    UISwitch *mswitch = [[UISwitch alloc]initWithFrame:CGRectMake(20, 200, 50, 25)];
    [mswitch addTarget:self action:@selector(mswitchAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:mswitch];
}


-(void)mswitchAction:(UISwitch *)sender{
    
    NSLog(@"value=%d", [sender isOn]);
}

-(void)addSliderValue{
    label = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, 100, 200)];
    
    [label setText:@"setText"];
    [self.view addSubview:label];
}

-(void)sliderView{
    
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-40, 20)];
    
    slider.minimumValue = 0.0;
    slider.maximumValue = 100.0;
    slider.value = 50.0;
//    slider.continuous = true;
    slider.continuous = YES;
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];
}

-(void)sliderAction:(UISlider *)slider{
    
    int value = (int)slider.value;
    NSString *sValue = [NSString stringWithFormat:@"%d", value];
    
    NSLog(@"slider=%d",value);
    [label setText:sValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --Switch


@end
