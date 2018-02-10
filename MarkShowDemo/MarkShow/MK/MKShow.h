//
//  MKShow.h
//  MarkShowDemo
//
//  Created by sny on 2018/1/19.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GlobalMarco.h"

#pragma mark - 全局的枚举方法

//动画的枚举方法

typedef NS_ENUM(NSUInteger, MKShowDynamicStyle) {
    // Various style according to animation
    MKShowDynamicStyleDefault, //默认的显示状态 显示弹出框 The default display status display pop-up box
    MKShowDynamicStyleBottomUp, // 从底部飞出的弹出框 Flying out of the bottom of the pop-up box
    MKShowDynamicStyleLeftIn, //显示一个从左侧进入的弹出框 Display a pop-up box from the left to enter
    MKShowDynamicStyleRightIn, //显示一个从右侧进入的弹出框 To display a pop-up box from the right to enter
    MKShowDynamicStyleCenter, //显示一个从中心点进入的弹出框带有动画 Display a pop-up box into the center with animation
};

//显示样式的枚举方法

typedef NS_ENUM(NSUInteger, MKShowShowStyle) {
    // Various style according to animation
    MKShowShowStyleDefault, //默认的显示状态 显示弹出框 The default display status display pop-up box
    MKShowShowStyleShadow, //带有阴影的显示状态 Display status with shadow
    MKShowShowStyleMultipleButton,//带有多个按钮的 Display With multiple buttons
};

@interface MKShow : NSObject

#pragma mark - 自有类方法 (不可设置的方法)

//获取一张带有颜色的图片 主要作用于点击时候的高亮显示
//Get a picture with color A major role in the click when highlighted
+ (UIImage *)imageWithColor:(UIColor *)color;

//界面弹出的动画 主要用户弹框的显示 从中心点进入的弹出框
//Interface pop-up box animation major users of display from the center into the pop-up box
+ (void)showDynamicStyleCenter:(UIView *)view;

//界面弹出的动画 主要用户弹框的显示 从底部飞出的弹出框
//Popup animation interface The main user display box Flying out of the bottom of the pop-up box
+ (void)showDynamicStyleBottomUp:(UIView *)view;

//界面弹出的动画 主要用户弹框的显示 一个从左侧进入的弹出框
+ (void)showDynamicStyleLeftIn:(UIView *)view;

//界面弹出的动画 主要用户弹框的显示 一个从右侧进入的弹出框
//Interface popup animation mainly users play box displays a pop-up box from the left to enter
+ (void)showDynamicStyleRightIn:(UIView *)view;



@end
