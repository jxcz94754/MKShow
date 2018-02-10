//
//  MKShowSubMultipleImportView.h
//  MarkShowDemo
//
//  Created by sny on 2018/2/8.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MKShowSubMultipleImportView : UIView<UITextFieldDelegate>

@property (strong, nonatomic) NSString *text;

@property (copy, nonatomic) void (^textFeildEndEdit)(NSString *text);

@property (strong, nonatomic) UIColor *defaultColor;

@end
