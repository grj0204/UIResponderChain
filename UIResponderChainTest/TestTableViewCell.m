//
//  TestTableViewCell.m
//  UIResponderChainTest
//
//  Created by Linda on 2017/7/27.
//  Copyright © 2017年 Linda. All rights reserved.
//

#import "TestTableViewCell.h"
#import "UIResponder+Router.h"
#import "TestView.h"


@interface TestTableViewCell ()
@property (nonatomic, strong) TestView *testView;
@property (nonatomic, strong) UIButton *cellButton;
@end

@implementation TestTableViewCell
- (TestView *)testView {
    if (_testView == nil) {
        _testView = [[TestView alloc] initWithFrame:CGRectMake(20, self.bounds.size.height*0.2, 120, 36)];
        _testView.num = self.index;
    }
    return _testView;
}

- (UIButton *)cellButton {
    if (_cellButton == nil) {
        _cellButton = [[UIButton alloc] initWithFrame:CGRectMake(240, self.bounds.size.height*0.2, 100, 36)];
        [_cellButton setTitle:@"cellButton" forState:UIControlStateNormal];
        [_cellButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [_cellButton addTarget:self action:@selector(cellButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cellButton;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addSubview:self.cellButton];
    }
    return self;
}

- (void)cellButtonClick {
    [self addSubview:self.testView];
    [self routerEventWithName:@"cellButtonClick" userInfo:@{@"cellButton" : [NSString stringWithFormat:@"cell  Button -- %zd",self.index]}];
}

- (void)setIndex:(NSInteger)index {
    _index = index;
}


@end
