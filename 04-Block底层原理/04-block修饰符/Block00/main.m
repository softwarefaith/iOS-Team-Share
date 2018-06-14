//
//  main.m
//  Block00
//
//  Created by 蔡杰 on 2018/6/7.
//  Copyright © 2018年 AllanCai. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef  void (^Block)(void);



@interface MyBlockObj : NSObject

- (void)method;

@end

@implementation MyBlockObj

- (void)method{
    
    
    
    
    
}


@end


//__block static int c = 20;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

        /*
         __block 作用以及本质
         */
    
        int aNum = 10;
        __block int bNum = 20;
        
        Block block = ^(void){
            
           // aNum = 40;
            
            bNum = 60;
            NSLog(@"I am Block");
        };
       
        block();
        

    }
    return 0;
}
