//
//  MKShowMultipleImportView.m
//  MarkShowDemo
//
//  Created by sny on 2018/2/8.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import "MKShowMultipleImportView.h"
#import "MKShowSubMultipleImportView.h"

@interface MKShowMultipleImportView()

//输入框视图的存放视图 Input box view store view
@property (strong, nonatomic) UIView *textFeildSuperView;

//输入内容的存放数组 To store the content of the input array
@property (strong, nonatomic) NSMutableArray *contentArray;

@end

@implementation MKShowMultipleImportView

// 懒加载输入框组的存放视图 Lazy loading input box set store view
- (UIView *)textFeildSuperView {
    if (!_textFeildSuperView) {
        _textFeildSuperView = [UIView new];
    }
    return _textFeildSuperView;
}

//输入框组内内容的存放数组 Input box set of content stored within an array
- (NSMutableArray *)contentArray {
    if(!_contentArray){
        _contentArray = [NSMutableArray new];
    }
    return _contentArray;
}

//通过setter方法初始化我们的输入框数组 并且存放在视图当中 如果有输入的操作 通过callblack回调输入内容
//Through a setter method to initialize our input box array And in a view If you have input operations Through callblack callback input content
- (void)initViewWithTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    MKShowSubMultipleImportView *lastShowSubMultipleImportView;
    for (int i = 0; i < titleArray.count; i ++) {
        MKShowSubMultipleImportView *showSubMultipleImportView = [MKShowSubMultipleImportView new];
        [showSubMultipleImportView setText:titleArray[i]];
        [self.textFeildSuperView addSubview:showSubMultipleImportView];
        
        [showSubMultipleImportView setTextFeildEndEdit:^(NSString *text) {
            [self.contentArray addObject:text];
        }];
        
        [showSubMultipleImportView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            if (lastShowSubMultipleImportView) {
                make.top.equalTo(lastShowSubMultipleImportView.mas_bottom);
                make.height.mas_equalTo(lastShowSubMultipleImportView.mas_height);
            }else {
                make.top.mas_equalTo(0);
                make.height.mas_equalTo(40);
            }
        }];
        
        lastShowSubMultipleImportView = showSubMultipleImportView;
    }
    
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
        make.height.mas_equalTo(60 + (self.titleArray.count * 40) + 40);
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
    
    [self.contentView addSubview:self.textFeildSuperView];
    [self.textFeildSuperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.messageLabel.mas_bottom).offset(8);
        make.left.mas_equalTo(8);
        make.right.mas_equalTo(-8);
        make.height.mas_equalTo(self.titleArray.count * 40);
    }];
    
    [self.contentView addSubview:self.centerLine];
    [self.centerLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-40);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
    [self.contentView addSubview:self.sureButton];
    [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(40);
        make.width.equalTo(self.contentView.mas_width).multipliedBy(0.5);
    }];
    
    [self.contentView addSubview:self.cancelButton];
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.equalTo(self.sureButton.mas_height);
        make.width.equalTo(self.sureButton.mas_width);
    }];
    
    [self.contentView addSubview:self.buttonLine];
    [self.buttonLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sureButton.mas_right);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(1);
    }];
}

//这个是确定按钮的点击事件 //重写父类的确认方法
- (void)sureButtonAction:(UIButton *)sender {
    // This is to determine the button click event
    
    self.sureButtonHandler ? self.sureButtonHandler(self.contentArray) : nil;
    
    //Away from the main view
    [self removeFromSuperview];
}

@end
