//
//  MKShowDynamic.h
//  MarkShowDemo
//
//  Created by sny on 2018/1/19.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "GlobalMarco.h"
#import "MKShow.h"

@interface MKShowDynamic : NSObject

//初始化方法
SINGLETON_INTERFACE


#pragma mark - 本类的初始化设置的类方法

//设置初始的显示方式 Set the initial display mode
+ (void)setDefaultMKShowDynamicStyle:(MKShowDynamicStyle)showDynamicStyle;

//设置是否有阴影的显示方式 Set whether there is a shadow display mode
+ (void)setDefaultMKShowShowStyle:(MKShowShowStyle)showShowStyle;

//设置背景图片 Set the background image
+ (void)setDefaultBackImage:(UIImage *_Nullable)image;

//设置统一颜色(包括线条 按钮) Unified color (including line button)
+ (void)setDefaultColor:(UIColor *_Nullable)color;

//设置确认按钮的颜色 Confirm the color of the button
+ (void)setSureColor:(UIColor *_Nullable)sureColor;

//设置取消按钮的颜色 The color of the set the cancel button
+ (void)setCancelColor:(UIColor *_Nullable)cancelColor;


#pragma mark - 本类的初始化方法主要用于显示弹框

/**
 展示一个有消息提示的弹出框并且有带block返回

 @param message message                         //消息提示
 @param sureCallBack  sureCallBack              //点击确认的返回
 @param cancelCallBack cancelCallBack           //点击取消的返回
 */

+ (void)showMkViewWithMessage:(NSString *_Nullable)message
                 sureCallBack:(void(^_Nullable)(id _Nullable backObject))sureCallBack
               cancelCallBack:(void(^_Nullable)(id _Nullable backObject))cancelCallBack;

/**
 展示一个有消息提示并且有文本的弹出框并且有带block返回

 @param message message                         //消息提示
 @param text text                               //显示的文本内容
 @param sureCallBack sureCallBack               //点击确认的返回
 @param cancelCallBack cancelCallBack           //点击取消的返回
 */

+ (void)showMkViewWithMessage:(NSString *_Nullable)message Text:(NSString *_Nullable)text
                 sureCallBack:(void(^_Nullable)(id _Nullable backObject))sureCallBack
               cancelCallBack:(void(^_Nullable)(id _Nullable backObject))cancelCallBack;

/**
 展示一个有消息提示并且可以输入弹出框并且有带block返回
 
 @param message message                         //消息提示
 @param sureCallBack sureCallBack               //点击确认的返回 （返回的是number类型 按钮的下标）
 @param cancelCallBack cancelCallBack           //点击取消的返回 （该方法没有取消的返回）
 */

+ (void)showMkInPutViewWithMessage:(NSString *_Nullable)message
                 sureCallBack:(void(^_Nullable)(id _Nullable backObject))sureCallBack
               cancelCallBack:(void(^_Nullable)(id _Nullable backObject))cancelCallBack;

/**
 展示一个有消息提示并且带多个按钮的弹出框并且有带block返回
 
 @param message message
 @param titleArray titleArray
 @param sureCallBack sureCallBack
 @param cancelCallBack cancelCallBack
 */
+ (void)showMultipleButtonViewWithMessage:(NSString *_Nullable)message
                               titleArray:(NSArray *_Nullable)titleArray
                             sureCallBack:(void(^_Nullable)(id _Nullable backObject))sureCallBack
                           cancelCallBack:(void(^_Nullable)(id _Nullable backObject))cancelCallBack;

/**
 展示一个有消息提示并且带多个输入框的弹出框并且有带block返回
 
 @param message message
 @param titleArray titleArray
 @param sureCallBack sureCallBack
 @param cancelCallBack cancelCallBack
 */
+ (void)showMultipleImprotViewWithMessage:(NSString *_Nullable)message
                               titleArray:(NSArray *_Nullable)titleArray
                             sureCallBack:(void(^_Nullable)(id _Nullable backObject))sureCallBack
                           cancelCallBack:(void(^_Nullable)(id _Nullable backObject))cancelCallBack;



#pragma mark - 本类所使用的可以开放的属性

//**下面是一些基本的属性设置你可以用这个修改你要修改的属性你也可以使用上面的类方法来进行界面的初始设置
/*Here are some basic properties of Settings you can use the change you want to modify the properties of the you can also use the above class methods for initial setup of the interface
 */

//设置显示的方式的属性 Set properties show in the way
@property (assign, nonatomic,setter = setDefaultShowStyle:) MKShowDynamicStyle showDynamicStyle;

//设置是否有阴影的显示方式 Set whether there is a shadow display mode
@property (assign, nonatomic,setter = setDefaultShadowStyle:) MKShowShowStyle showShowStyle;

//设置弹出框的背景颜色 Set the background color of the pop-up box
@property (strong, nonatomic,setter = setBackImage:) UIImage * _Nullable image;

//设置统一颜色(包括线条 按钮) Unified color (including line button)
@property (strong, nonatomic,setter = setTintColor:) UIColor * _Nullable defaultColor;

//设置确认按钮的颜色 Confirm the color of the button
@property (strong, nonatomic, setter = setSureButtonColor:) UIColor * _Nullable sureColor;

//设置取消按钮的颜色 The color of the set the cancel button
@property (strong, nonatomic, setter = setCancelButtonColor:) UIColor * _Nullable cancelColor;

@end
