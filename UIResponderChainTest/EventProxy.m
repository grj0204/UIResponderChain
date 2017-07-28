//
//  EventProxy.m
//  UIResponderChainTest
//
//  Created by Linda on 2017/7/27.
//  Copyright © 2017年 Linda. All rights reserved.
//

#import "EventProxy.h"
#import "ViewController.h"

@interface EventProxy ()
@property (nonatomic, strong) NSDictionary<NSString *, NSInvocation *> *eventStrategy;
@end

@implementation EventProxy

- (void)handleEvent:(NSString *)event userInfo:(NSDictionary *)userInfo {
    NSInvocation *invocation = self.eventStrategy[event];
    [invocation setArgument:&userInfo atIndex:2];
    [invocation invokeWithTarget:self];
}

- (NSDictionary<NSString *,NSInvocation *> *)eventStrategy {
    if (!_eventStrategy) {
        _eventStrategy = @{@"cellButtonClick" : [self createInvocationWithSelector:@selector(cellButtonClick:)],
                           @"viewButtonClick" : [self createInvocationWithSelector:@selector(viewButtonClick:)]
                           };
    }
    return _eventStrategy;
}

- (NSInvocation *)createInvocationWithSelector:(SEL)selector {
    //方法签名
    NSMethodSignature *sig = [[self class] instanceMethodSignatureForSelector:selector];
    //用具体方法的的方法签名创建消息调用对象
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
    //给消息调用者设置具体的方法
    [invocation setSelector:selector];
    
    return invocation;
}


- (void)cellButtonClick:(NSDictionary *)userInfo {
    if ([userInfo[@"self"] isKindOfClass:[ViewController class]]) {
        ViewController *mainVC = (ViewController *)userInfo[@"self"];
        mainVC.navigationItem.title = userInfo[@"cellButton"];
    }
}

- (void)viewButtonClick:(NSDictionary *)userInfo {
    if ([userInfo[@"self"] isKindOfClass:[ViewController class]]) {
        ViewController *mainVC = (ViewController *)userInfo[@"self"];
        mainVC.navigationItem.title = userInfo[@"viewButton"];
    }
}




@end
