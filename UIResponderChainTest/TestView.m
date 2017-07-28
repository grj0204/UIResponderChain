//
//  TestView.m
//  UIResponderChainTest
//
//  Created by Linda on 2017/7/27.
//  Copyright © 2017年 Linda. All rights reserved.
//

#import "TestView.h"
#import "UIResponder+Router.h"

@interface TestView ()

@property (nonatomic, strong) UIButton *viewButton;

@end
@implementation TestView
- (UIButton *)viewButton {
    if (_viewButton == nil) {
        _viewButton = [[UIButton alloc] initWithFrame:self.bounds];
        [_viewButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_viewButton addTarget:self action:@selector(viewButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _viewButton;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.viewButton];
    }
    return self;
}

- (void)viewButtonClick {
    [self routerEventWithName:@"viewButtonClick" userInfo:@{@"viewButton" : [NSString stringWithFormat:@"test  View -- %zd", self.num]}];
}

- (void)setNum:(NSInteger)num {
    _num = num;
    [_viewButton setTitle:[NSString stringWithFormat:@"viewButton-%zd",self.num] forState:UIControlStateNormal];
}
@end
