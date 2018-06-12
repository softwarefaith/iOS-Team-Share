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


@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

    {
        MyBlockObj *blockObj = [[MyBlockObj alloc] init];
        
        [blockObj method];
        
        NSLog(@"Outer = %@",[blockObj valueForKey:@"_age"]);

    }
        
        

    }
    return 0;
}
