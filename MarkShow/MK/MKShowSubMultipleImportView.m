//
//  MKShowSubMultipleImportView.m
//  MarkShowDemo
//
//  Created by sny on 2018/2/8.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import "MKShowSubMultipleImportView.h"
#import "Masonry.h"

@interface MKShowSubMultipleImportView()

@property (strong, nonatomic) UILabel *textLabel;

@property (strong, nonatomic) UITextField *textField;

@end

@implementation MKShowSubMultipleImportView

- (void)setText:(NSString *)text {
    _text = text;
    self.textLabel.text = text;
}

- (void)setDefaultColor:(UIColor *)defaultColor {
    _defaultColor = defaultColor;
    self.textLabel.textColor = defaultColor;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [UILabel new];
        _textLabel.font = [UIFont systemFontOfSize:14.f];
        _textLabel.textColor = [UIColor blackColor];
    }
    return _textLabel;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [UITextField new];
        _textField.delegate = self;
        _textField.font = [UIFont systemFontOfSize:14.f];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _textField;
}

#pragma mark - init
- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialControl];
    }
    return self;
}

- (void)initialControl {
    [self addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(8);
        make.centerY.mas_equalTo(self);
    }];
    
    [self addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.right.mas_equalTo(-8);
        make.centerY.mas_equalTo(self);
        make.top.mas_equalTo(4);
        make.bottom.mas_equalTo(-4);
    }];
}

#pragma mark - UITextFeildDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    _textFeildEndEdit ? _textFeildEndEdit(textField.text) : nil;
}

@end
