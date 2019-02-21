//
//  main.m
//  Test
//
//  Created by 蔡杰 on 2019/1/16.
//

#import <Foundation/Foundation.h>

#import "RuntimeKit.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
    //    NSArray *array =   [RuntimeKit fetchIvarList:[Person class]];
        
         // NSArray *array =   [RuntimeKit fetchPropertyList:[Person class]];
        
      NSArray *array =   [RuntimeKit fetchMethodList:[Person class]];
        
        Person * p = [[Person alloc] init];
     NSLog(@"%p",objc_getClass("Person"));
        //
       // NSLog(@"array = %@",array);
        
        NSLog(@"Hello Word");
        
        
    }
    return 0;
}
