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

        Class JPerson = objc_allocateClassPair([NSObject class], [@"JPerson" UTF8String], 0);
        objc_registerClassPair(JPerson);
        

    }
    return 0;
}
