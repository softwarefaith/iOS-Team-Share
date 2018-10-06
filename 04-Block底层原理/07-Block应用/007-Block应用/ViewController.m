//
//  ViewController.m
//  007-Block应用
//
//  Created by 蔡杰 on 2018/8/29.
//  Copyright © 2018年 AllanCai. All rights reserved.
//

/*
  Block 定义
 */

#import "ViewController.h"

#import "BlockMaro.h"

#import <objc/runtime.h>

DEFINE_BLOCK_TYPE(TestBlock,int,int a,int b,int c);
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    
    IMP imp = class_getMethodImplementation([self class], @selector(test:));
    
    id block = imp_getBlock(imp);
    
    NSLog(@"---````");

}

- (void)test:(int)a {
    
    NSLog(@"---");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
