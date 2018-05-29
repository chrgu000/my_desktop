//
//  main.m
//  Notificaction
//
//  Created by mzr on 2017/10/11.
//  Copyright © 2017年 kuaileda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bclass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
            //A类往B类发送消息
        Bclass *b =[[Bclass alloc]init];
        
        [b testNotificate];
    }
    return 0;
}
