//
//  MKShowView.m
//  MarkShowDemo
//
//  Created by sny on 2018/1/19.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import "MKShowView.h"

@implementation MKShowView

#pragma mark - setter
/*下面是使用.h文件中属性的set方法来设置一些我们想要的一些展示形式 比如 颜色 背景图片等等
Below is used. H file attributes set method to set up some we want to show some form Such as color background image and so on
 */

- (void)setBlackImage:(UIImage *)blackImage {
    _blackImage = blackImage;
    self.backImagView.image = blackImage;
}

- (void)setDefaultColor:(UIColor *)defaultColor {
    _defaultColor = defaultColor;
    [self setLineColor:defaultColor];
    [self setSureButtonColor:defaultColor];
    [self setCancelButtonColor:defaultColor];
    [self setMessageColor:defaultColor];
}

- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    self.centerLine.backgroundColor = lineColor;
    self.buttonLine.backgroundColor = lineColor;
}

- (void)setSureButtonColor:(UIColor *)sureButtonColor {
    _sureButtonColor = sureButtonColor;
    [self.sureButton setTitleColor:sureButtonColor forState:UIControlStateNormal];
}

- (void)setCancelButtonColor:(UIColor *)cancelButtonColor {
    _cancelButtonColor = cancelButtonColor;
    [self.cancelButton setTitleColor:cancelButtonColor forState:UIControlStateNormal];
}

- (void)setMessageColor:(UIColor *)messageColor {
    _messageColor = messageColor;
    self.messageLabel.textColor = messageColor;
}

- (void)setBlackViewColor:(UIColor *)blackViewColor {
    _blackViewColor = blackViewColor;
    self.contentView.backgroundColor = blackViewColor;
}

- (void)setMessage:(NSString *)message {
    _message = message;
    self.messageLabel.text = message;
}

- (void)setSureText:(NSString *)sureText {
    _sureText = sureText;
    [self.sureButton setTitle:sureText forState:UIControlStateNormal];
}

- (void)setCancelText:(NSString *)cancelText {
    _cancelText = cancelText;
    [self.cancelButton setTitle:cancelText forState:UIControlStateNormal];
}

- (void)setShowViewDynamicStyle:(MKShowDynamicStyle)showViewStyle {
    _showViewStyle = showViewStyle;
    
    switch (showViewStyle) {
        case MKShowDynamicStyleDefault:
            
            break;
        case MKShowDynamicStyleBottomUp:
        {
            [MKShow showDynamicStyleBottomUp:self.contentView];
            
            _shadowView != nil ? ([MKShow showDynamicStyleBottomUp:_shadowView]) : nil;
            
        }
            break;
        case MKShowDynamicStyleLeftIn:
        {
            [MKShow showDynamicStyleLeftIn:self.contentView];
            
            _shadowView != nil ? ([MKShow showDynamicStyleLeftIn:_shadowView]) : nil;
            
        }
            
            break;
        case MKShowDynamicStyleRightIn:
        {
            [MKShow showDynamicStyleRightIn:self.contentView];
            
            _shadowView != nil ? ([MKShow showDynamicStyleRightIn:_shadowView]) : nil;
        }
            
            break;
        case MKShowDynamicStyleCenter:
        {
            [MKShow showDynamicStyleCenter:self.contentView];
            
            _shadowView != nil ? ([MKShow showDynamicStyleCenter:_shadowView]) : nil;
        }
            
            break;
            
    }
}

- (void)setShowViewShowStylet:(MKShowShowStyle)showShowStyle {
    _showShowStyle = showShowStyle;
    switch (showShowStyle) {
        case MKShowShowStyleDefault:
            self.shadowView.hidden = YES;
            break;
        case MKShowShowStyleShadow:
            self.shadowView.hidden = NO;
            break;
    }
}

#pragma mark - lazyinit
/*下面是使用懒加载的方式初始化各个控件里面包含各个控件的初始化的形式 当然你可以通过上面的setter方法 设置你想要一些控件的展示形式*/

/*Way is to use lazy loading under the initialization of each control containing various control initialization, of course, you can use the above, in the form of a setter method some control Settings you want to show the form*/

- (UIView *)contentView {
    if(!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.cornerRadius = 5.f;
        _contentView.layer.masksToBounds = YES;
    }
    return _contentView;
}

- (UIView *)shadowView {
    if (!_shadowView) {
        _shadowView = [UIView new];
        
        _shadowView.backgroundColor = [UIColor whiteColor];
        
        //阴影的颜色
        _shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
        
        //阴影的透明度
        _shadowView.layer.shadowOpacity = 0.8f;
        
        //阴影的圆角
        _shadowView.layer.shadowRadius = 5.f;
        
        //阴影偏移量
        _shadowView.layer.shadowOffset = CGSizeMake(8,8);
        
    }
    
    //Set a background view, the attribute of the background shadow, the shadow of the background shadow, the shadow of the background shadow, the offset of the corner shadow of the background shadow.
    
    
    return _shadowView;
}


- (UIImageView *)backImagView {
    if (!_backImagView) {
        _backImagView = [UIImageView new];
        [_backImagView setContentMode:UIViewContentModeScaleAspectFill];
    }
    return _backImagView;
}


- (UIButton *)sureButton {
    if(!_sureButton) {
        _sureButton = [UIButton new];
        //初始化设置按钮文字的颜色 为黑色 按钮的文字显示 为确定 显示的字体大小为 14
        [_sureButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_sureButton setBackgroundImage:[MKShow imageWithColor:SYSTEM_LINE_COLOR] forState:UIControlStateHighlighted];
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        _sureButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
        //Initializes the Settings button text color is black button on the display text In order to determine show the font size to 14
        
        //初始化点击事件
        [_sureButton addTarget:self action:@selector(sureButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        //Initializes the click event
    }
    return _sureButton;
}

#pragma mark - SureButtonAction
//这个是确定按钮的点击事件
- (void)sureButtonAction:(UIButton *)sender {
    // This is to determine the button click event
    _sureButtonHandler ? _sureButtonHandler(nil) : nil;
    //Away from the main view
    [self removeFromSuperview];
}

- (UIButton *)cancelButton {
    if(!_cancelButton) {
        _cancelButton = [UIButton new];
        //初始化设置按钮文字的颜色 为黑色 按钮的文字显示 为取消
        [_cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setBackgroundImage:[MKShow imageWithColor:SYSTEM_LINE_COLOR] forState:UIControlStateHighlighted];
        _cancelButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
        //Initializes the Settings button text color for black button text display to cancel show the font size to 14
        
        //初始化点击事件
        [_cancelButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        //Initializes the click event
    }
    return _cancelButton;
    
}

#pragma mark - CancelButtonAction
//这个是取消按钮的点击事件
- (void)cancelButtonAction:(UIButton *)sender {
    //This is a cancel button click event
    _cancelButtonHandler ? _cancelButtonHandler(nil) : nil;
    //Away from the main view
    [self removeFromSuperview];
}

- (UILabel *)messageLabel {
    if(!_messageLabel) {
        _messageLabel = [UILabel new];
        //初始化的设置 消息文本控件 字体大小 14 字体的颜色 黑色
        _messageLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.textColor = [UIColor blackColor];
        //Initialize the set message text control The color of the font size 14 black
        
    }
    return _messageLabel;
}

- (UIView *)centerLine {
    if(!_centerLine) {
        _centerLine = [UIView new];
        //初始化的设置 分割线的颜色 灰色
        _centerLine.backgroundColor = [UIColor grayColor];
        // Initializes the Settings line color gray
    }
    return _centerLine;
}

- (UIView *)buttonLine {
    if(!_buttonLine) {
        _buttonLine = [UIView new];
        //初始化的设置 分割线的颜色 灰色
        _buttonLine.backgroundColor = [UIColor grayColor];
        //Initializes the Settings line color gray
    }
    return _buttonLine;
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
    
    //1.将显示的视图加入主控制器,其中约束的代码是使用Masonry完成的,我在Demo中已经将Masnory放进去了,如果和你的项目有重复使用可以将我的文件删除掉.
    
    //Will display the view to join the main controller, which constraints the code is the use of Masonry, I has been put into the Masnory in the Demo, if you and your project has repeated use my files can be deleted.
    
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.height.mas_equalTo(100);
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

@end
