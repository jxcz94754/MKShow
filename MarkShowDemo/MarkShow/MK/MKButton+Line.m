//
//  MKButton+Line.m
//  MarkShowDemo
//
//  Created by sny on 2018/2/3.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import "MKButton+Line.h"

@implementation UIButton (LineView)

- (void)showTopLineWithLineColor:(UIColor *)lineColor {
    UIView *lineView = [UIView new];
    lineView.backgroundColor = lineColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
}

@end
