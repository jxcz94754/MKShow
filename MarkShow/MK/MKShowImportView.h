//
//  MKShowImportView.h
//  MarkShowDemo
//
//  Created by sny on 2018/1/19.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKShowView.h"

@interface MKShowImportView : MKShowView

//输入框的背景显示文字
//Input box shows the background of the text
@property (strong, nonatomic,setter = setInPutTextPlaceholder:) NSString *placeholderText;

@end
