//
//  main.m
//  OCDemo
//
//  Created by 蔡杰 on 2018/3/24.
//  Copyright © 2018年 mljr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/objc-runtime.h>
#import <malloc/malloc.h>
@interface Person :NSObject {
    
 @public
    int _idNum;
    int  _age;
    NSString *_name;

}



@end
@interface Person ()
@end
@implementation Person

@end



struct personStruct {
    Class  isa;
    int idnum;
    int age;
    char *name;
};




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Person *person = [[Person alloc] init];
        person->_idNum = 10;
        person->_age = 20;
        person->_name = @"caijie";
        
        NSLog(@"person address = %p", person);

        
        
        //验证 Struc  与 person  对象
        struct personStruct *p = (__bridge struct personStruct *)person;
        NSLog(@"person = %zd,%zd,%@",p->idnum,p->age,p->name);
        
       // person 对象的size
        NSLog(@"NSObject size = %zd, person size = %zd",
              class_getInstanceSize([NSObject class]),
              class_getInstanceSize([person class])
              );
        
        NSLog(@"malloc size = %zd",
            
                malloc_size((__bridge void *)person)
              );

    }
    return 0;
}
