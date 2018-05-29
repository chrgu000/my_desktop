//
//  Bclass.m
//  NSNotication1
//
//  Created by mzr on 2017/10/11.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "Bclass.h"
#import "Aclass.h"

@implementation Bclass
-(void)testNotication{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(testAction:) name:@"TEST" object:nil];
    
    Aclass *a = [[Aclass alloc] init];
}
-(void)testAction:(NSNotification *)notif{
    
    NSLog(@"%@", notif);
    NSNumber *num1 = notif.object;
    NSDictionary *dic =notif.userInfo;
    
    NSLog(@"%@ %@", num1, dic);
    
}
@end
