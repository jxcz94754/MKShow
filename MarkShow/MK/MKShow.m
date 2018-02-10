//
//  MKShow.m
//  MarkShowDemo
//
//  Created by sny on 2018/1/19.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import "MKShow.h"

@implementation MKShow

//获取一张带有颜色的图片 主要作用于点击时候的高亮显示
//Get a picture with color A major role in the click when highlighted
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

//界面弹出的动画 主要用户弹框的显示 从中心点进入的弹出框
//Interface pop-up box animation major users of display from the center into the pop-up box
+ (void)showDynamicStyleCenter:(UIView *)view {
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.4;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [view.layer addAnimation:popAnimation forKey:nil];
    
}

//界面弹出的动画 主要用户弹框的显示 从底部飞出的弹出框
//Popup animation interface The main user display box Flying out of the bottom of the pop-up box
+ (void)showDynamicStyleBottomUp:(UIView *)view {
    
    //设置动画路径 Set the animation path
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //设置关键帧点 Set the key frames
    NSValue *begainPoint = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH / 2.f, SCREEN_HEIGHT)];
    NSValue *endPoint = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH / 2.f, SCREEN_HEIGHT / 2.f)];
    popAnimation.values = @[begainPoint, endPoint];
    
    //设置动画时间 Set the animation time
    [popAnimation setDuration:0.2];
    
    [view.layer addAnimation:popAnimation forKey:nil];
}

//界面弹出的动画 主要用户弹框的显示 一个从左侧进入的弹出框
+ (void)showDynamicStyleLeftIn:(UIView *)view {
    //设置动画路径 Set the animation path
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //设置关键帧点 Set the key frames
    NSValue *begainPoint = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT / 2.f)];
    NSValue *endPoint = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH / 2.f, SCREEN_HEIGHT / 2.f)];
    popAnimation.values = @[begainPoint, endPoint];
    
    //设置动画时间 Set the animation time
    [popAnimation setDuration:0.2];
    
    [view.layer addAnimation:popAnimation forKey:nil];
}

//界面弹出的动画 主要用户弹框的显示 一个从右侧进入的弹出框
//Interface popup animation mainly users play box displays a pop-up box from the left to enter
+ (void)showDynamicStyleRightIn:(UIView *)view {
    //设置动画路径 Set the animation path
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //设置关键帧点 Set the key frames
    NSValue *begainPoint = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT / 2.f)];
    NSValue *endPoint = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH / 2.f, SCREEN_HEIGHT / 2.f)];
    popAnimation.values = @[begainPoint, endPoint];
    
    //设置动画时间 Set the animation time
    [popAnimation setDuration:0.2];
    
    [view.layer addAnimation:popAnimation forKey:nil];
}

@end
