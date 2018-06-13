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

@property(nonatomic, strong) dispatch_queue_t queue;

- (void)method;

- (void)asyn;
@property(nonatomic,copy)Block block;


@end

@implementation MyBlockObj {
    int _age;
}

-(void)dealloc {
    
    NSLog(@"MyBlockObj dealloc");
}

- (void)method{
    
   
    self.block = ^(void){
        
        _age = 80;
        NSLog(@"method innner = %d",_age);
        
        
    };
    
    self.block();
    
}

- (void)asyn {
    self.queue = dispatch_queue_create("com.mljr.Block", DISPATCH_QUEUE_CONCURRENT);

    dispatch_async(self.queue, ^{
        
       // sleep(2);
        NSLog(@"my name is queue -%d",_age);
    });
}


@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

    {
        MyBlockObj *blockObj = [[MyBlockObj alloc] init];
        
        [blockObj asyn];
        
        NSLog(@"Outer = %@",[blockObj valueForKey:@"_age"]);

    }
        
        

    }
    return 0;
}
