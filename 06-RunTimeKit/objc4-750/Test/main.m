//
//  main.m
//  Test
//
//  Created by 蔡杰 on 2019/1/16.
//

#import <Foundation/Foundation.h>
#import "Person.h"

#import "RuntimeKit.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSArray *array =   [RuntimeKit fetchIvarList:[Person class]];
        //
        NSLog(@"array = %@",array);
        
    }
    return 0;
}
