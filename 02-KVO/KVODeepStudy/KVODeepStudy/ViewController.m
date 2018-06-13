//
//  ViewController.m
//  KVODeepStudy
//
//  Created by 蔡杰 on 2018/3/28.
//  Copyright © 2018年 mljr. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
@interface Person : NSObject

@property (nonatomic,assign) int age;

@end

@implementation Person

- (void)setAge:(int)age {
    
    NSLog(@"setAge:");
    _age = age;
}
//- (void)willChangeValueForKey:(NSString *)key
//{
//    NSLog(@"willChangeValueForKey: - begin");
//    [super willChangeValueForKey:key];
//    NSLog(@"willChangeValueForKey: - end");
//}
//
//- (void)didChangeValueForKey:(NSString *)key
//{
//    NSLog(@"didChangeValueForKey: - begin");
//    [super didChangeValueForKey:key];
//    NSLog(@"didChangeValueForKey: - end");
//}
@end


@interface  Oberserver:NSObject

@end

@implementation Oberserver
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSLog(@"Oberserver keyPath = %@   change = %@ -- %p", keyPath, change,&object);
}

- (void)dealloc {
    
    NSLog(@"o dealloc");
}


@end

@interface ViewController ()

@end

@implementation ViewController

- (void)fetcMethod:(Class) cls {
    
   unsigned int  count =0;
   Method * methods =  class_copyMethodList(cls, &count);
    
    NSMutableString *methdString = [NSMutableString string];
    for (int i = 0; i < count; i ++) {
    
       Method method = methods[i];
       SEL methodSel = method_getName(method);
       [ methdString appendString:NSStringFromSelector(methodSel)];
        [methdString appendString:@"\n"];
    }
    NSLog(@"%@",methdString);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
   
    Person *person1 = [[Person alloc] init];
    Person *person2 = [[Person alloc] init];
    
    
  //  person1.age = 1;
  //  person2.age = 2;
    
    
    /*
         添加后，person2 isa 指向的类变为了  NSKVONotifying_Person
     
     */
    NSLog(@"添加后Clas - %@ - %@",NSStringFromClass(object_getClass(person1)),NSStringFromClass(object_getClass(person2)));
    
    NSLog(@"IMP　%p - %p",[person1 methodForSelector:@selector(setAge:)],[person2 methodForSelector:@selector(setAge:)]);
    
    NSKeyValueObservingOptions option = NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew;
    [person2 addObserver:self forKeyPath:@"age" options:option context:nil];

  //  person1.age = 1;
    person2.age = 20;
    
    NSLog(@"添加后Clas - %@ - %@",NSStringFromClass(object_getClass(person1)),NSStringFromClass(object_getClass(person2)));
    
    
    
    
    NSLog(@"IMP %p - %p",[person1 methodForSelector:@selector(setAge:)],[person2 methodForSelector:@selector(setAge:)]);
    
  
    //person2 setAge: _NSSetIntValueAndNotify
    
    
    [person2 removeObserver:self forKeyPath:@"age"];
   
    
 
    
  //  person2.age = 30;
    NSLog(@"添加后Clas - %@ - %@",NSStringFromClass(object_getClass(person1)),NSStringFromClass(object_getClass(person2)));

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSLog(@"keyPath = %@   change = %@", keyPath, change);
}

- (void)test {
    
    
    Person * p = [[Person alloc] init];
    p .age = 20;
    
    {
        Oberserver * o = [[Oberserver alloc] init];
        NSKeyValueObservingOptions option = NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew;
        [p addObserver:o forKeyPath:@"age" options:option context:nil];
        
        p.age = 30;

    }
    

    
    NSLog(@"--------");
    p.age =60;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
