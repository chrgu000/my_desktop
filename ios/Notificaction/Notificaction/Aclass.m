//
//  Aclass.m
//  Notificaction
//
//  Created by mzr on 2017/10/11.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import "Aclass.h"

@implementation Aclass
-(id)init{
    
    self = [super init];
    
    if(self){
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"TESTACTION" object:nil];
    }
    
    return self;
}
@end
