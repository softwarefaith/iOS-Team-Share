//
//  main.m
//  objc-test
//
//  Created by Allan Cai on 2018/12/16.
//

#import <Foundation/Foundation.h>
#import "RuntimeKit.h"
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {

     /*
      
      struct objc_class : objc_object {
      // Class ISA;
      Class superclass;
      cache_t cache;             // formerly cache pointer and vtable
      class_data_bits_t bits;
      
      */
    Person * p = [[Person alloc] init];
    NSLog(@"%p",objc_getClass("Person"));
        NSLog(@"Hello word");

    }
    return 0;
}
