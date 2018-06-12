//
//  main.m
//  Block00
//
//  Created by 蔡杰 on 2018/6/7.
//  Copyright © 2018年 AllanCai. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef  void (^Block)(void);

int gloalInt = 5;

static int globalStaticInt = 10;


@interface MyBlockObj : NSObject

- (void)method;

@end

@implementation MyBlockObj

- (void)method{
    
    static int autoStaticInt = 30;
    int autoInt = 40;
    
    Block block = ^(void){
        
        NSLog(@"I am Block - %d----%d----%d----%d",gloalInt,globalStaticInt,autoInt,autoStaticInt);

    };
    
    block();
    
    
    
    
}


@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

       __strong MyBlockObj *blockObj = [[MyBlockObj alloc] init];
        
        __weak MyBlockObj *weakBlockObj = blockObj;
        __unsafe_unretained MyBlockObj *unsafeBlockObj = blockObj;

        
        Block block = ^(void){
            
            NSLog(@"I am Block - %@----%@-----%@",blockObj,weakBlockObj,unsafeBlockObj);
            
        };
        
        block();
        

    }
    return 0;
}
