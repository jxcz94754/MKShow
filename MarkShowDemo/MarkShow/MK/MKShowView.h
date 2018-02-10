//
//  MKShowView.h
//  MarkShowDemo
//
//  Created by sny on 2018/1/19.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "MKShow.h"

/*下面是点击了取消和确认的blocl回调 你可以在blcok里面加你想要回调的一些参数**/
//Below is clicked cancel and confirm blocl callback in blcok to add your want some parameter of the callback

typedef void(^SureButtonHandler)(id blackObject);
typedef void(^CancelButtonHandler)(id blackObject);


@interface MKShowView : UIView

/****背景图片的设置*******/

@property (strong, nonatomic) UIImage *blackImage; //black image

/****颜色属性的设置 线条颜色 确定键颜色 取消键颜色 提示信息颜色 背景色 默认的全局颜色*******/

//Set the line color color attribute determine key color cancel key color message color background color

@property (strong, nonatomic) UIColor *lineColor; //line color

@property (strong, nonatomic) UIColor *sureButtonColor; //sure button color

@property (strong, nonatomic) UIColor *cancelButtonColor; //cancel button color

@property (strong, nonatomic) UIColor *messageColor; //message title color

@property (strong, nonatomic) UIColor *blackViewColor; //backGround color

@property (strong, nonatomic) UIColor *defaultColor; //default color

/****提示内容设置 确定键显示文字设置 取消键显示文字设置*******/

//Prompt content setting determines key word display Settings Cancel key word display Settings

@property (strong, nonatomic) NSString *message; // message

@property (strong, nonatomic) NSString *sureText; //sure button title

@property (strong, nonatomic) NSString *cancelText; //cancel button title

/****弹出的动画显示方式 *******/
//Popup animation display mode
@property (assign, nonatomic,setter = setShowViewDynamicStyle:) MKShowDynamicStyle showViewStyle;

//****是否有阴影的显示********/
//If there is a shadow show
@property (assign, nonatomic,setter = setShowViewShowStylet:) MKShowShowStyle showShowStyle;

#pragma mark - Open to subclass modify attributes Is not a subclass as far as possible not to modify

/***本类目中的一些初始化方法 和一些基本当中开放出来的控件显示*****/

- (void)initialControl; //The initialization method of the interface And some basic controls show open

//存放显示区域的视图或者是容器
@property (strong, nonatomic) UIView *contentView; // Store display area view or a container

//阴影显示背景图片
@property (strong, nonatomic) UIView *shadowView; //The shadow show the background image

//显示区域的背景图片
@property (strong, nonatomic) UIImageView *backImagView; //The background image display area

//默认的是确认按钮
@property (strong, nonatomic) UIButton *sureButton; //The default is the confirm button

//默认的是取消按钮
@property (strong, nonatomic) UIButton *cancelButton; //The default is a cancel button

//显示信息的文字控件
@property (strong, nonatomic) UILabel *messageLabel; //This is a control displays a message

//中部的显示线条
@property (strong, nonatomic) UIView *centerLine; //Display of Central Line

//两个按钮之间的分割线
@property (strong, nonatomic) UIView *buttonLine; //Dividing line between the two buttons

#pragma mark - The callback method

@property (copy, nonatomic) SureButtonHandler sureButtonHandler; //Confirm button callback

@property (copy, nonatomic) CancelButtonHandler cancelButtonHandler;//Cancel button callback


@end
