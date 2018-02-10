//
//  MKSubMultipleButtonView.m
//  MarkShowDemo
//
//  Created by sny on 2018/2/3.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import "MKSubMultipleButtonView.h"
#import "MKButton+Line.h"

@implementation MKSubMultipleButtonView

#pragma setter

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    [self initialControl];
}

#pragma layzInit
//防止赋值没有成功
- (UIColor *)lineColor {
    if (!_lineColor) {
        _lineColor = [UIColor blackColor];
    }
    return _lineColor;
}

#pragma mark - init
- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (void)initialControl {
    self.backgroundColor = [UIColor clearColor];
    UIButton *lastButton;
    for (int i = 0;i < self.titleArray.count; i ++) {
        UIButton *button = [UIButton new];
        [button setTitle:self.titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:self.lineColor forState:UIControlStateNormal];
        [button setBackgroundImage:[MKShow imageWithColor:SYSTEM_LINE_COLOR] forState:UIControlStateHighlighted];
        button.titleLabel.font = [UIFont systemFontOfSize:14.f];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [button showTopLineWithLineColor:self.lineColor];
        button.tag = i;
        [self addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(40);
            
            if (lastButton) {
                make.top.equalTo(lastButton.mas_bottom);
            }else {
                make.top.mas_equalTo(0);
            }
            
        }];
        
        lastButton = button;
    }
}

- (void)buttonAction:(UIButton *)sender {
    _multipleButtonHandle ? _multipleButtonHandle(sender.tag) : nil;
}

@end
