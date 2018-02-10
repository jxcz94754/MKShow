//
//  MKShowTextView.m
//  MarkShowDemo
//
//  Created by sny on 2018/1/19.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import "MKShowTextView.h"

@interface MKShowTextView()

//显示内容的控件
@property (strong, nonatomic) UILabel *textLabel; //Display content of the control

//显示的文本的高度
@property (assign, nonatomic) CGFloat textHeight; //According to the height of the text

@end

@implementation MKShowTextView

#pragma mark - stter
//使用属性进行展示内容控件的显示
- (void)setText:(NSString *)text {
    _text = text;
    
    //根据文本获得文本的高度 字体大小12 
    self.textHeight = [self getLabelHeightWithContent:text AndtitleFont:12.f];
    
    //赋值给显示文本的控件
    self.textLabel.text = text;
    
    //创建要显示的整体界面
    [self initialControl];
    
    //According to the text for the height of the text Font size 12, assigned to display text in the control, create to display the whole interface
}

#pragma mark - lazyinit
//初始化我们要显示的内容的那些控件
- (UILabel *)textLabel {
    //初始化一个文本显示控件,他的文字大小为12,文本为居中,字体颜色为黑色,不限定行数
    if(!_textLabel) {
        _textLabel = [UILabel new];
        _textLabel.font = [UIFont systemFontOfSize:12.f];
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.numberOfLines = 0;
        _textLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    //Initialize a text display control, his text size for 12, text as the center, the font color is black, don't limit the number of rows
    return _textLabel;
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

//重写了父类的初始化界面的方法 Overrides the superclass method of initialization interface

- (void)initialControl {
    //设置背景颜色为透明色 Set the background color is transparent color
    self.backgroundColor = POP_BACKGROUND_COLOR;
    
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.height.mas_equalTo(self.textHeight + 100);
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
    
    [self.contentView addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.messageLabel.mas_bottom).offset(8);
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.height.mas_equalTo(self.textHeight);
    }];
    
    [self.contentView addSubview:self.buttonLine];
    [self.buttonLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sureButton.mas_right);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(1);
    }];
}

- (CGFloat)getLabelHeightWithContent:(nullable NSString *)content AndtitleFont:(CGFloat)fontSize{
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width - 120 - 24,CGFLOAT_MAX);
    CGRect contentSize = [content boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes: @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil];
    return contentSize.size.height;
}

@end
