//
//  EventProxy.h
//  UIResponderChainTest
//
//  Created by Linda on 2017/7/27.
//  Copyright © 2017年 Linda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventProxy : NSObject

- (void)handleEvent:(NSString *)event userInfo:(NSDictionary *)userInfo;

@end
