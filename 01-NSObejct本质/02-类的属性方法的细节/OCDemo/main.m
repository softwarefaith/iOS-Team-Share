//
//  main.m
//  OCDemo
//
//  Created by 蔡杰 on 2018/3/24.
//  Copyright © 2018年 mljr. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <objc/objc-runtime.h>

/*
 
 struct Person_IMPL {
 struct NSObject_IMPL NSObject_IVARS;
 int _idNum;
 int _age;
 NSString *_name;
 int cnum;
 int mnum;
 
 -------
 NSString *_pName;
 NSArray *_pArrays;
 NSString *_cName;
 };
 
 */

@interface Person :NSObject {
    
 @public
    int _idNum;
    int  _age;
    NSString *_name;

}

@property (nonatomic,copy) NSString *pName;
@property (nonatomic,strong) NSArray *pArrays;

- (NSString *)personInstanceMethod;

+ (NSString *)personClassMethod;

@end
@interface Person () {
    int cnum;

}
@property (nonatomic,copy) NSString *cName;

@end
@implementation Person {
    int mnum;

}

- (NSString *)personInstanceMethod {
    
    self.cName = @"123";
    cnum = 99;
    
    return @"insatnce";
}


+ (NSString *)personClassMethod {
    return @"class";
}

@end






int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Person *person = [[Person alloc] init];


    }
    return 0;
}
