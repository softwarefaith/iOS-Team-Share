//
//  ViewController.m
//  04-思考题
//
//  Created by 蔡杰 on 2018/6/19.
//  Copyright © 2018年 AllanCai. All rights reserved.
//

#import "ViewController.h"


@interface  Person : NSObject

@property (nonatomic, copy) NSString *name;

- (void)print;

@end


@implementation Person

- (void)print {
    NSLog(@"my name is %@",self.name);
}

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *p =[[Person alloc] init];
  //  NSObject *o =[[NSObject alloc] init];
    
    [self test];
    
    
}

- (void)test {
    id cls = [Person class];
    
    void *obj = &cls;
    
    [(__bridge id)obj print];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
