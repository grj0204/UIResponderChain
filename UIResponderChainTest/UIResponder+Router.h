//
//  UIResponder+Router.h
//  UIResponderChainTest
//
//  Created by Linda on 2017/7/27.
//  Copyright © 2017年 Linda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Router)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
