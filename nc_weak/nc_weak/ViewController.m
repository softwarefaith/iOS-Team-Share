//
//  ViewController.m
//  nc_weak
//
//  Created by zengzoe on 02/07/2018.
//  Copyright © 2018 zyuaaaa. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import "NSObject+Ncweak.h"

@interface MyObject: NSObject


@end

@implementation MyObject

- (void)dealloc {
    
    NSLog(@"dealloc = %p",self);
}

@end

@interface NcObj:NSObject


@property(nonatomic,weak)NcObj *w_property;

@end

@implementation NcObj

@end

typedef void(^block)(void);

@interface ViewController ()
@property(nonatomic,weak)NSString *w_str;

@property(nonatomic,weak)NcObj *w_obj2;

@property(nonatomic,weak)block w_blk1;


@end

@implementation ViewController

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//
//    self.w_blk1();
//
//}
//
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//
//    self.w_blk1();
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
    
}

- (MyObject *)createObj {
    
    MyObject * o = [[MyObject alloc] init];//objc_autoreleaseReturnValue
    NSLog(@"--- %p -- %p",&o,o);
    return o;
}

- (MyObject *)createObj0 {
    int  a = 5;
    MyObject * o = [[MyObject alloc] init];
    NSLog(@"--- %p -- %p",&o,o);
    return o;
}

- (MyObject *)createObj1 {
    long long b = 10;
    int a = 5;
    MyObject * o = [[MyObject alloc] init];
    NSLog(@"--- %p -- %p",&o,o);
    return o;
}

- (void)test44 {
    
    
    
    MyObject *__weak obj1 = [[MyObject alloc] init];
    
    
    MyObject *__weak obj2 = [[MyObject alloc] init];
    MyObject *__weak obj3 = [[MyObject alloc] init];
    
    NSLog(@"-1---%@-",obj1);
    NSLog(@"-2---%@-",obj2);
    NSLog(@"-3---%@-",obj3);
    NSLog(@"pass");
}

- (void)test {
    
   

    MyObject *__weak obj1 = [self createObj];
    
    
    MyObject *__weak obj2 = [self createObj0];
    MyObject *__weak obj3 = [self createObj1];

    NSLog(@"-1---%@-",obj1);
    NSLog(@"-2---%@-",obj2);
    NSLog(@"-3---%@-",obj3);
    NSLog(@"pass");
}

- (void)test9 {
    NSObject *obj7 = [[NSObject alloc] init];
    
    NSObject *obj8 = [[NSObject alloc] init];
    obj8.obj = obj7 ;
    
    NSLog(@"-1---%@-",obj8.obj);
    obj7 = nil;
    NSLog(@"-2---%@-",obj8.obj);

    
}

- (void)test8 {
    NSObject * obj1 =[NSObject new] ;
    NSObject *__weak obj2 = obj1;
    NcObj *objyyy = [[NcObj alloc] init];
    objyyy.w_property = objyyy;
    
    NSArray *array = @[objyyy];
    

    NcObj *objyyy2 = array[0];
    
    NSLog(@"----%@",objyyy2.w_property);

    obj1 = nil;
    
    NSLog(@"----%@",obj2);
    
    
//    NSObject * obj3 = array.allObjects[];
    
}

- (void)test7 {
    
    __block int val = 5;
    {
    self.w_blk1 = ^ {
        val ++;
    };
    
//    self.w_blk1();
    NSLog(@"-----%@",self.w_blk1);
    }
    
      self.w_blk1();

}

- (void)test6 {
    NcObj *obj = [NcObj new];
    
    self.w_obj2 = obj;
    
    [self.w_obj2 addObserver:self forKeyPath:@"w_property" options:NSKeyValueObservingOptionNew context:nil];
    
    self.w_obj2.w_property = obj;

    
    obj = nil;
    
    NSLog(@"--222--%@",self.w_obj2.w_property);

    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"--observe--%@",change);
}

- (void)test5 {

    NSString *string1 = @"123456789";
    NSString *string2 = [[NSString alloc] initWithFormat:@"123456789"];
    NSString *string3 = [[NSString alloc] initWithFormat:@"12345678910"];
    NSString *string4 = [NSString stringWithFormat:@"634576879809-0-"];
    
    NSString * __weak a = string1;
    NSString * __weak b = string2;
    NSString * __weak c = string3;
    
    NSLog(@"---a %@  %p ",a.class,a);
    NSLog(@"---b %@  %p ",b.class,b);
    NSLog(@"---c %@  %p ",c.class,c);
    
    string1 = nil;
    string2 = nil;
    string3 = nil;
    
    NSLog(@"---a=%@  %p ",a,a);
    NSLog(@"---b=%@  %p ",b,b);
    NSLog(@"---c=%@  %p ",c,c);
}

- (void)test4 {
    NSString *string;
    @autoreleasepool{
        string = [NSString stringWithFormat:@"1234444466772"];
        self.w_str = string;
    }
    NSLog(@"--1-%@--",self.w_str);
}

- (void)test3 {
    NSObject *__weak obj1 ;
    NSObject *__weak obj2;
    {
        NSObject *__autoreleasing obj3 = [NSObject new] ;
        NSObject * obj4 = [NSObject new] ;
        obj1 = obj3;
        obj2 = obj4;
    }
    
    NSLog(@"--1-%@--",obj1);
    NSLog(@"---2-%@--",obj2);

}

-(void)test2 {
    NcObj * obj1 = [[NcObj alloc] init];
    
    NcObj *__weak obj = obj1;

    NSLog(@"----%@--%@",obj,obj.class);

}

- (void)test1 {
    NSString * __weak string = [[NSString alloc] initWithFormat:@"12238888888888"];
    
    NSLog(@"----%@--%@",string,string.class);
}


@end
