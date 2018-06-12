//
//  main.m
//  CateGory
//
//  Created by 蔡杰 on 2018/6/4.
//  Copyright © 2018年 AllanCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, assign) int num;

@end

@implementation Person

@end

@interface Person (Test)

- (void)personTest;

@end

@implementation Person (Test)

- (void)personTest {
    _num = 20;
}

@end

@interface Person (Test0)

@property (nonatomic,class,assign) int personNum;

- (void)personTest;

@end

@implementation Person (Test0)

+ (int)personNum {
    return 0;
}

+ (void)setPersonNum:(int)personNum {
    
    
}

- (void)personTest {
    _num = 20;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Person *p = [[Person alloc] init];
        [p personTest];
    }
    return 0;
}
