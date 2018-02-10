//
//  MKShowMultipleButtonView.h
//  MarkShowDemo
//
//  Created by sny on 2018/2/3.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKShowView.h"

@interface MKShowMultipleButtonView : MKShowView

//设置各个按钮的显示文字 Set the display text of each button

@property (strong, nonatomic,setter = setButtonTitle:) NSArray *buttonTitleArray;

@end
