//
//  MKShowDynamic.m
//  MarkShowDemo
//
//  Created by sny on 2018/1/19.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import "MKShowDynamic.h"
#import "MKShowView.h"
#import "MKShowTextView.h"
#import "MKShowImportView.h"
#import "AppDelegate.h"
#import "MKShowImportView.h"
#import "MKShowMultipleButtonView.h"
#import "MKShowMultipleImportView.h"

@interface MKShowDynamic()

//弹出带消息提示的视图 The pop-up message view
@property (strong, nonatomic) MKShowView *showView;

//弹出带消息提示和文本框的视图 The pop-up message and view a text box
@property (strong, nonatomic) MKShowTextView *showTextView;

//弹出带输入框和消息提示的视图 Pop-up view with input box and message prompt
@property (strong, nonatomic) MKShowImportView *showImportView;

//弹出带多个按钮的视图框 按钮的数量大于2的时候
//The number of view box button pop-up with multiple button is greater than 2

@property (strong, nonatomic) MKShowMultipleButtonView *showMultipleButtonView;

//弹出带多个输入框的视图框,输入框的数量大于2
//Popup view box with multiple input box, box number greater than 2

@property (strong, nonatomic) MKShowMultipleImportView *showMultipleImportView;

@end

@implementation MKShowDynamic

static MKShowDynamic *singleton;
SINGLETON_IMPLEMENTATION(singleton)

#pragma mark - 初始化视图 Initialize the view
// 这里我使用了懒加载的方式初始一些视图 为了避免初始化不成功 或者 你要在初始化时候要对视图进行一系列的操作

//Here I use the lazy loading way of initial some views in order to avoid initialization not succeed or you want to be in initialization time to view a series of operations
- (MKShowView *)showView {
    if (!_showView) {
        _showView = [MKShowView new];
        [_showView initialControl];
        
    }
    return _showView;
}

- (MKShowTextView *)showTextView {
    if (!_showTextView) {
        _showTextView = [MKShowTextView new];
    }
    return _showTextView;
}

- (MKShowImportView *)showImportView {
    if (!_showImportView) {
        _showImportView = [MKShowImportView new];
    }
    return _showImportView;
}

- (MKShowMultipleButtonView *)showMultipleButtonView {
    if(!_showMultipleButtonView) {
        _showMultipleButtonView = [MKShowMultipleButtonView new];
    }
    return _showMultipleButtonView;
}


- (MKShowMultipleImportView *)showMultipleImportView {
    if (!_showMultipleImportView) {
        _showMultipleImportView = [MKShowMultipleImportView new];
    }
    return _showMultipleImportView;
}

#pragma mark - 初始化一些基本设置
- (void)setBackImage:(UIImage *)image {
    _image = image;
}

- (void)setTintColor:(UIColor *)defaultColor {
    _defaultColor = defaultColor;
}

- (void)setDefaultShowStyle:(MKShowDynamicStyle)showDynamicStyle {
    _showDynamicStyle = showDynamicStyle;
}

- (void)setDefaultShadowStyle:(MKShowShowStyle)showShowStyle {
    _showShowStyle = showShowStyle;
}

- (void)setSureButtonColor:(UIColor *)sureColor {
    _sureColor = sureColor;
}

- (void)setCancelButtonColor:(UIColor *)cancelColor {
    _cancelColor = cancelColor;
}

#pragma mark - 初始化设置
//设置初始的显示方式 Set the initial display mode
+ (void)setDefaultMKShowDynamicStyle:(MKShowDynamicStyle)showDynamicStyle {
    [[MKShowDynamic sharedInstance] setDefaultShowStyle:showDynamicStyle];
}

//设置是否有阴影的显示方式 Set whether there is a shadow display mode
+ (void)setDefaultMKShowShowStyle:(MKShowShowStyle)showShowStyle {
    [[MKShowDynamic sharedInstance] setDefaultShadowStyle:showShowStyle];
}

//设置背景图片 Set the background image
+ (void)setDefaultBackImage:(UIImage *)image {
    [[MKShowDynamic sharedInstance] setBackImage:image];
}

//设置统一颜色(包括线条 按钮) Unified color (including line button)
+ (void)setDefaultColor:(UIColor *_Nullable)color {
    [[MKShowDynamic sharedInstance] setTintColor:color];
}

//设置确认按钮的颜色 Confirm the color of the button
+ (void)setSureColor:(UIColor *_Nullable)sureColor {
    [[MKShowDynamic sharedInstance] setSureButtonColor:sureColor];
}

//设置取消按钮的颜色 The color of the set the cancel button
+ (void)setCancelColor:(UIColor *_Nullable)cancelColor {
    [[MKShowDynamic sharedInstance] setCancelButtonColor:cancelColor];
}

//展示一个有消息提示的弹出框并且有带block返回 Display a message pop-up And with block to return
+ (void)showMkViewWithMessage:(NSString *)message
                 sureCallBack:(void(^)(id backObject))sureCallBack
               cancelCallBack:(void(^)(id backObject))cancelCallBack {
    //加入到弹出的底部视图当中 To join to the bottom of the pop-up view
    [[self getRootView] addSubview:[MKShowDynamic sharedInstance].showView];
    
    //约束视图 The constraint view
    [[MKShowDynamic sharedInstance].showView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    //设置显示的标题 Set the title of the show
    [[MKShowDynamic sharedInstance].showView setMessage:message];
    
    //下面3个方法是设置颜色的方法  The following three methods is the method of set colors
    if ([MKShowDynamic sharedInstance].defaultColor) {
        [[MKShowDynamic sharedInstance].showView setDefaultColor:[MKShowDynamic sharedInstance].defaultColor];
        
    }
    
    if ([MKShowDynamic sharedInstance].sureColor) {
        [[MKShowDynamic sharedInstance].showView setSureButtonColor:[MKShowDynamic sharedInstance].sureColor];
    }
    
    if([MKShowDynamic sharedInstance].cancelColor) {
        [[MKShowDynamic sharedInstance].showView setSureButtonColor:[MKShowDynamic sharedInstance].cancelColor];
    }
    
    //设置背景图片 Set the background image
    if([MKShowDynamic sharedInstance].image) {
        [[MKShowDynamic sharedInstance].showView setBlackImage:[MKShowDynamic sharedInstance].image];
    }
    
    //设置阴影 Set the shadow
    [[MKShowDynamic sharedInstance].showView setShowViewShowStylet:[MKShowDynamic sharedInstance].showShowStyle];
    
    //设置弹出的动画类型 The types of animation pop up
    [[MKShowDynamic sharedInstance].showView setShowViewDynamicStyle:[MKShowDynamic sharedInstance].showDynamicStyle];
    
    //确认按钮的回调 Confirm button callback
    [[MKShowDynamic sharedInstance].showView setSureButtonHandler:^(id blackObject){
        sureCallBack(nil);
    }];
    
    //取消按钮的回调 Cancel button callback
    [[MKShowDynamic sharedInstance].showView setCancelButtonHandler:^(id blackObject){
        [MKShowDynamic sharedInstance].showView = nil;
        cancelCallBack(nil);
    }];
}

//展示一个有消息提示并且有文本的弹出框并且有带block返回 Display a pop-up message and text And with block to return
+ (void)showMkViewWithMessage:(NSString *)message Text:(NSString *)text
                 sureCallBack:(void(^)(id backObject))sureCallBack
               cancelCallBack:(void(^)(id backObject))cancelCallBack {
    //加入到弹出的底部视图当中 To join to the bottom of the pop-up view
    [[self getRootView] addSubview:[MKShowDynamic sharedInstance].showTextView];
    
    //约束视图 The constraint view
    [[MKShowDynamic sharedInstance].showTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    //设置显示的标题 Set the title of the show
    [[MKShowDynamic sharedInstance].showTextView setMessage:message];
    
    //设置显示的文本 Set the text of the show
    [[MKShowDynamic sharedInstance].showTextView setText:text];
    
    
    //下面3个方法是设置颜色的方法  The following three methods is the method of set colors
    if ([MKShowDynamic sharedInstance].defaultColor) {
        [[MKShowDynamic sharedInstance].showTextView setDefaultColor:[MKShowDynamic sharedInstance].defaultColor];
    }
    
    if ([MKShowDynamic sharedInstance].sureColor) {
        [[MKShowDynamic sharedInstance].showTextView setSureButtonColor:[MKShowDynamic sharedInstance].sureColor];
    }
    
    if([MKShowDynamic sharedInstance].cancelColor) {
        [[MKShowDynamic sharedInstance].showTextView setSureButtonColor:[MKShowDynamic sharedInstance].cancelColor];
    }
    
    //设置背景图片 Set the background image
    if([MKShowDynamic sharedInstance].image) {
        [[MKShowDynamic sharedInstance].showTextView setBlackImage:[MKShowDynamic sharedInstance].image];
    }
    
    //设置阴影 Set the shadow
    [[MKShowDynamic sharedInstance].showTextView setShowViewShowStylet:[MKShowDynamic sharedInstance].showShowStyle];
    
    //设置弹出的动画类型 The types of animation pop up
    [[MKShowDynamic sharedInstance].showTextView setShowViewDynamicStyle:[MKShowDynamic sharedInstance].showDynamicStyle];
    
    //确认按钮的回调 Confirm button callback
    [[MKShowDynamic sharedInstance].showTextView setSureButtonHandler:^(id blackObject){
        [MKShowDynamic sharedInstance].showTextView = nil;
        sureCallBack(nil);
    }];
    
    //取消按钮的回调 Cancel button callback
    [[MKShowDynamic sharedInstance].showTextView setCancelButtonHandler:^(id blackObject){
        [MKShowDynamic sharedInstance].showTextView = nil;
        cancelCallBack(nil);
    }];
}

//展示一个有消息提示并且带可以输入的文本框并且有带block返回 Display a message and belt can input text box and with block to return


+ (void)showMkInPutViewWithMessage:(NSString *_Nullable)message
                      sureCallBack:(void(^_Nullable)(id _Nullable backObject))sureCallBack
                    cancelCallBack:(void(^_Nullable)(id _Nullable backObject))cancelCallBack {
    //加入到弹出的底部视图当中 To join to the bottom of the pop-up view
    [[self getRootView] addSubview:[MKShowDynamic sharedInstance].showImportView];
    
    //约束视图 The constraint view
    [[MKShowDynamic sharedInstance].showImportView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    //设置显示的标题 Set the title of the show
    [[MKShowDynamic sharedInstance].showImportView setMessage:message];
    
    
    //下面3个方法是设置颜色的方法  The following three methods is the method of set colors
    if ([MKShowDynamic sharedInstance].defaultColor) {
        [[MKShowDynamic sharedInstance].showImportView setDefaultColor:[MKShowDynamic sharedInstance].defaultColor];
        
    }
    
    if ([MKShowDynamic sharedInstance].sureColor) {
        [[MKShowDynamic sharedInstance].showImportView setSureButtonColor:[MKShowDynamic sharedInstance].sureColor];
    }
    
    if([MKShowDynamic sharedInstance].cancelColor) {
        [[MKShowDynamic sharedInstance].showImportView setSureButtonColor:[MKShowDynamic sharedInstance].cancelColor];
    }
    
    //设置背景图片 Set the background image
    if([MKShowDynamic sharedInstance].image) {
        [[MKShowDynamic sharedInstance].showImportView setBlackImage:[MKShowDynamic sharedInstance].image];
    }
    
    //设置阴影 Set the shadow
    [[MKShowDynamic sharedInstance].showImportView setShowViewShowStylet:[MKShowDynamic sharedInstance].showShowStyle];
    
    
    //设置弹出的动画类型 The types of animation pop up
    [[MKShowDynamic sharedInstance].showImportView setShowViewDynamicStyle:[MKShowDynamic sharedInstance].showDynamicStyle];
    
    //确认按钮的回调 Confirm button callback
    [[MKShowDynamic sharedInstance].showImportView setSureButtonHandler:^(id blackObject) {
        [MKShowDynamic sharedInstance].showImportView = nil;
        sureCallBack(blackObject);
    }];
    
    //取消按钮的回调 Cancel button callback
    [[MKShowDynamic sharedInstance].showImportView setCancelButtonHandler:^(id blackObject){
        [MKShowDynamic sharedInstance].showImportView = nil;
        cancelCallBack(blackObject);
    }];
}

//展示一个有按钮列表的弹出框并且带有block返回
+ (void)showMultipleButtonViewWithMessage:(NSString *_Nullable)message
                               titleArray:(NSArray *_Nullable)titleArray
                             sureCallBack:(void(^_Nullable)(id _Nullable backObject))sureCallBack
                           cancelCallBack:(void(^_Nullable)(id _Nullable backObject))cancelCallBack {
    //加入到弹出的底部视图当中 To join to the bottom of the pop-up view
    [[self getRootView] addSubview:[MKShowDynamic sharedInstance].showMultipleButtonView];
    
    
    //约束视图 The constraint view
    [[MKShowDynamic sharedInstance].showMultipleButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    //设置显示的标题 Set the title of the show
    [[MKShowDynamic sharedInstance].showMultipleButtonView setMessage:message];
    
    
    if ([MKShowDynamic sharedInstance].defaultColor) {
        [[MKShowDynamic sharedInstance].showMultipleButtonView setDefaultColor:[MKShowDynamic sharedInstance].defaultColor];
        
    }
    
    //设置显示的按钮的文字 Set the button text
    [[MKShowDynamic sharedInstance].showMultipleButtonView setButtonTitle:titleArray];
    
    
    //下面3个方法是设置颜色的方法  The following three methods is the method of set colors
    
    //设置背景图片 Set the background image
    if([MKShowDynamic sharedInstance].image) {
        [[MKShowDynamic sharedInstance].showMultipleButtonView setBlackImage:[MKShowDynamic sharedInstance].image];
    }
    
    //设置阴影 Set the shadow
    [[MKShowDynamic sharedInstance].showMultipleButtonView setShowViewShowStylet:[MKShowDynamic sharedInstance].showShowStyle];
    
    //设置弹出的动画类型 The types of animation pop up
    [[MKShowDynamic sharedInstance].showMultipleButtonView setShowViewDynamicStyle:[MKShowDynamic sharedInstance].showDynamicStyle];
    
    //确认按钮的回调 Confirm button callback
    [[MKShowDynamic sharedInstance].showMultipleButtonView setSureButtonHandler:^(id blackObject) {
        [MKShowDynamic sharedInstance].showMultipleButtonView = nil;
        sureCallBack(blackObject);
    }];
    
    //取消按钮的回调 Cancel button callback
    [[MKShowDynamic sharedInstance].showMultipleButtonView setCancelButtonHandler:^(id blackObject){
        [MKShowDynamic sharedInstance].showMultipleButtonView = nil;
        cancelCallBack(blackObject);
    }];
}


 //展示一个有消息提示并且带输入框的弹出框并且有带block返回

+ (void)showMultipleImprotViewWithMessage:(NSString *_Nullable)message
                               titleArray:(NSArray *_Nullable)titleArray
                             sureCallBack:(void(^_Nullable)(id _Nullable backObject))sureCallBack
                           cancelCallBack:(void(^_Nullable)(id _Nullable backObject))cancelCallBack {
    //加入到弹出的底部视图当中 To join to the bottom of the pop-up view
    [[self getRootView] addSubview:[MKShowDynamic sharedInstance].showMultipleImportView];
    
    
    //约束视图 The constraint view
    [[MKShowDynamic sharedInstance].showMultipleImportView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    //设置显示的标题 Set the title of the show
    [[MKShowDynamic sharedInstance].showMultipleImportView setMessage:message];
    
    
    if ([MKShowDynamic sharedInstance].defaultColor) {
        [[MKShowDynamic sharedInstance].showMultipleImportView setDefaultColor:[MKShowDynamic sharedInstance].defaultColor];
        
    }
    
    //设置显示的按钮的文字 Set the button text
    [[MKShowDynamic sharedInstance].showMultipleImportView initViewWithTitleArray:titleArray];
    
    
    //下面3个方法是设置颜色的方法  The following three methods is the method of set colors
    
    //设置背景图片 Set the background image
    if([MKShowDynamic sharedInstance].image) {
        [[MKShowDynamic sharedInstance].showMultipleImportView setBlackImage:[MKShowDynamic sharedInstance].image];
    }
    
    //设置阴影 Set the shadow
    [[MKShowDynamic sharedInstance].showMultipleImportView setShowViewShowStylet:[MKShowDynamic sharedInstance].showShowStyle];
    
    //设置弹出的动画类型 The types of animation pop up
    [[MKShowDynamic sharedInstance].showMultipleImportView setShowViewDynamicStyle:[MKShowDynamic sharedInstance].showDynamicStyle];
    
    //确认按钮的回调 Confirm button callback
    [[MKShowDynamic sharedInstance].showMultipleImportView setSureButtonHandler:^(id blackObject) {
        [MKShowDynamic sharedInstance].showMultipleImportView = nil;
        sureCallBack(blackObject);
    }];
    
    //取消按钮的回调 Cancel button callback
    [[MKShowDynamic sharedInstance].showMultipleImportView setCancelButtonHandler:^(id blackObject){
        [MKShowDynamic sharedInstance].showMultipleImportView = nil;
        cancelCallBack(blackObject);
    }];
    
}

+ (nonnull UIView *)getRootView {
    //获取最初界面
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UIView *view = appDelegate.window.viewForLastBaselineLayout;
    return view;
}

@end
