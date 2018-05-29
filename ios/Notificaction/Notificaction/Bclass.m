//
//  Bclass.m
//  Notificaction
//
//  Created by mzr on 2017/10/11.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "Bclass.h"

@implementation Bclass
-(void)testNotificate{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testAction) name:@"TESTACTION" object:nil];
    
    Aclass *a = [[Aclass alloc]init];
    
}

-(void)testAction{
    NSLog(@"我收到消息了");
}
@end
