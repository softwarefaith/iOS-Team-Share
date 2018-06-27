//
//  BaseDemo.h
//  Interview04-线程同步
//
//  Created by Allan on 2018/6/7.
//  Copyright © 2018年 Allan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseDemo : NSObject

- (void)moneyTest;
- (void)ticketTest;
- (void)otherTest;

#pragma mark - 暴露给子类去使用
- (void)__saveMoney;
- (void)__drawMoney;
- (void)__saleTicket;
@end
