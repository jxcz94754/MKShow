//
//  MKShowMultipleButtonView.m
//  MarkShowDemo
//
//  Created by sny on 2018/2/3.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import "MKShowMultipleButtonView.h"
#import "MKSubMultipleButtonView.h"

@interface MKShowMultipleButtonView()

//创建按钮的显示视图 Create button shows the view

@property (strong, nonatomic) MKSubMultipleButtonView *subMultipleButtonView;

@end

@implementation MKShowMultipleButtonView

- (MKSubMultipleButtonView *)subMultipleButtonView {
    if (!_subMultipleButtonView) {
        _subMultipleButtonView  = [MKSubMultipleButtonView new];
        _subMultipleButtonView.lineColor = self.defaultColor;
        [_subMultipleButtonView setTitleArray:self.buttonTitleArray];
    }
    return _subMultipleButtonView;
}

#pragma mark - setter

- (void)setButtonTitle:(NSArray *)buttonTitleArray {
    _buttonTitleArray = buttonTitleArray;
    [self initialControl];
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
    //设置背景颜色为透明色 Set the background color is transparent color
    self.backgroundColor = POP_BACKGROUND_COLOR;
    
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.height.mas_equalTo(60 + (self.buttonTitleArray.count * 40));
        make.left.mas_equalTo(60);
        make.right.mas_equalTo(-60);
    }];
    
    [self addSubview:self.shadowView];
    [self sendSubviewToBack:self.shadowView];
    
    self.shadowView.hidden = YES;
    
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(3);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-3);
        make.left.mas_equalTo(62);
        make.right.mas_equalTo(-62);
    }];
    
    [self.contentView addSubview:self.backImagView];
    [self.backImagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self.contentView addSubview:self.messageLabel];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(16);
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
    }];
    
    [self.contentView addSubview:self.subMultipleButtonView];
    [self.subMultipleButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(self.buttonTitleArray.count * 40);
    }];
    
    __weak __typeof(&*self)weakSelf = self;
    
    [self.subMultipleButtonView setMultipleButtonHandle:^(NSInteger tag) {
        weakSelf.sureButtonHandler ? weakSelf.sureButtonHandler([NSNumber numberWithInteger:tag]) : nil;
        [weakSelf removeFromSuperview];
    }];
}

@end
