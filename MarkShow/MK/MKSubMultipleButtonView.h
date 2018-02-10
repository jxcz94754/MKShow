//
//  MKSubMultipleButtonView.h
//  MarkShowDemo
//
//  Created by sny on 2018/2/3.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKShow.h"

@interface MKSubMultipleButtonView : UIView

//设置线条的颜色 Set the color of the line

@property (strong, nonatomic) UIColor *lineColor;

//设置各个按钮的显示文字 Set the display text of each button

@property (strong, nonatomic) NSArray *titleArray;

//被点击的按钮的tag回调 By clicking the button tag correction
@property (copy, nonatomic) void (^multipleButtonHandle)(NSInteger tag);

@end
