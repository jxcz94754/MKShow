//
//  MKShowImportView.m
//  MarkShowDemo
//
//  Created by sny on 2018/1/19.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import "MKShowImportView.h"

@interface MKShowImportView()<UITextFieldDelegate>

@property (strong, nonatomic) UITextField *textField; //输入框  Input box

@end


@implementation MKShowImportView

#pragma mark - setter
- (void)setInPutTextPlaceholder:(NSString *)placeholderText {
    _placeholderText = placeholderText;
    
    //给输入框的背景显示文字赋值
    self.textField.placeholder = placeholderText;
    
    //To the input box shows the background of writing assignment
}

#pragma mark - lazyinit
- (UITextField *)textField {
    
    //初始化一个输入框,他的显示形式是带有圆角的不透明白底的,
    if(!_textField) {
        _textField = [UITextField new];
        _textField.delegate = self;
        _textField.font = [UIFont systemFontOfSize:14.f];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.placeholder = @"请输入内容";
    }
    //Initialize an input box, and his display forms are opaque white with rounded corners,
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
    //设置背景颜色为透明色 Set the background color is transparent color
    self.backgroundColor = POP_BACKGROUND_COLOR;
    
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.height.mas_equalTo(145);
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
    
    [self.contentView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.messageLabel.mas_bottom).offset(8);
        make.left.mas_equalTo(8);
        make.right.mas_equalTo(-8);
        make.height.mas_equalTo(35);
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

#pragma mark - UITextDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

//这个是确定按钮的点击事件 //重写父类的确认方法
- (void)sureButtonAction:(UIButton *)sender {
    // This is to determine the button click event
    
    self.sureButtonHandler ? self.sureButtonHandler(self.textField.text) : nil;
    
    //Away from the main view
    [self removeFromSuperview];
}

@end
