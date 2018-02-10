//
//  MKShowMultipleImportView.h
//  MarkShowDemo
//
//  Created by sny on 2018/2/8.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKShowView.h"

@interface MKShowMultipleImportView : MKShowView

//初始化输入框的标题 以数组的形式传入 The title of the initial input box In the form of an array of incoming

@property (strong, nonatomic , setter = initViewWithTitleArray:) NSArray *titleArray;

@end
