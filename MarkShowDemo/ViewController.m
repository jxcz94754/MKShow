//
//  ViewController.m
//  MarkShowDemo
//
//  Created by sny on 2018/1/19.
//  Copyright © 2018年 HuangYangYang. All rights reserved.
//

#import "ViewController.h"
#import "MKShowDynamic.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSArray<NSString *> *entryTitles;

@property (strong, nonatomic) NSArray<NSString *> *entryDetails;

@property (strong, nonatomic) NSArray<NSString *> *entryClasses;

@end

@implementation ViewController

- (NSArray<NSString *> *)entryTitles {
    if (!_entryTitles) {
        _entryTitles = @[@"普通弹出框",
                         @"文本弹出框",
                         @"输入弹出框",
                         @"带多个按钮的弹出框",
                         @"带多个输入框的弹出框",
                         @"带阴影的普通弹出框",
                         @"带阴影的文本弹出框",
                         @"带阴影的输入弹出框",
                         @"带阴影的多个按钮弹出框",
                         @"中间显示动画的普通弹框",
                         @"左侧进入的普通文本弹框",
                         @"底部进入的有阴影的输入框",
                         @"alertView"];
    }
    return _entryTitles;
}

- (NSArray<NSString *> *)entryDetails {
    if (!_entryDetails) {
        _entryDetails = @[@"普通的弹出框,带有取消和确认的回调",
                          @"文本弹出框,带有取消和确认回调",
                          @"输入弹出框,带有取消和确认回调",
                          @"多按钮弹出框,带有个个按钮的回调",
                          @"多输入框的弹出框,带确认和取消",
                          @"带阴影的普通的弹出框,带有取消和确认的回调",
                          @"带阴影的文本弹出框,带有取消和确认回调",
                          @"带阴影的输入弹出框,带有取消和确认回调",
                          @"带阴影的多个按钮弹出框,带点击按钮tag的回调",
                          @"中间显示动画的普通弹框",
                          @"左侧进入的普通文本弹框",
                          @"底部进入的有阴影的输入框",
                          @"系统的弹出框"];
    }
    return _entryDetails;
}

- (NSArray<NSString *> *)entryClasses {
    if(!_entryClasses) {
        _entryClasses = @[@"MKShowDynamicStyleDefault",
                          @"MKShowDynamicStyleText",
                          @"MKShowDynamicStyleImportView",
                          @"MKShowDynamicStyleMultipleButton",
                          @"MKShowDynamicStyleMultipleImportView",
                          @"MKShowDynamicStyleShadowDefault",
                          @"MKShowDynamicStyleShadowText",
                          @"MKShowDynamicStyleShadowImportView",
                          @"MKShowDynamicStyleShadowMultipleButton",
                          @"MKShowDynamicStyleCenter",
                          @"MKShowDynamicStyleLeftIn",
                          @"MKShowDynamicStyleBottomUp",
                          @"SystemAlertView"];
    }
    return _entryClasses;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置默认的颜色
    [MKShowDynamic setDefaultColor:NAVBAR_TINTCOLOR];
    //设置弹出框的背景图片
    //[MKShowDynamic setDefaultBackImage:[UIImage imageNamed:@"ico_show_black"]];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _tableView.sectionHeaderHeight = 10;
    _tableView.sectionFooterHeight = 0;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.entryTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *mainCellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:mainCellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.textLabel.numberOfLines = 0;
        
        cell.detailTextLabel.lineBreakMode = NSLineBreakByCharWrapping;
        cell.detailTextLabel.textColor = [UIColor grayColor];
        cell.detailTextLabel.numberOfLines = 0;
    }
    
    cell.textLabel.text = self.entryTitles[indexPath.row];
    
    cell.detailTextLabel.text = self.entryDetails[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *className = self.entryClasses[indexPath.row];
    
    if ([className isEqualToString:@"MKShowDynamicStyleDefault"]) {
        
        [MKShowDynamic setDefaultMKShowShowStyle:MKShowShowStyleDefault]; //设置默认的弹出样式
        
        [MKShowDynamic setDefaultMKShowDynamicStyle:MKShowDynamicStyleDefault]; //不设置动画
        
        [MKShowDynamic showMkViewWithMessage:@"消息提示" sureCallBack:^(id backObject) {
            
        } cancelCallBack:^(id backObject) {
            
        }];
    }
    
    if ([className isEqualToString:@"MKShowDynamicStyleText"]) {
        
        [MKShowDynamic setDefaultMKShowShowStyle:MKShowShowStyleDefault];//设置默认的弹出样式
        
        [MKShowDynamic setDefaultMKShowDynamicStyle:MKShowDynamicStyleDefault]; //不设置动画
        
        [MKShowDynamic showMkViewWithMessage:@"消息提示" Text:@"入夜渐微凉繁花落地成霜你在远方眺望耗尽所有暮光不量自难相忘傲日其愣夭夭桃花凉前世你怎舍下这一海心茫茫" sureCallBack:^(id  _Nullable backObject) {
            
        } cancelCallBack:^(id  _Nullable backObject) {
            
        }];
    }
    
    if ([className isEqualToString:@"MKShowDynamicStyleImportView"]) {
        
        
        [MKShowDynamic setDefaultMKShowShowStyle:MKShowShowStyleDefault]; //设置默认的弹出样式
        
        [MKShowDynamic setDefaultMKShowDynamicStyle:MKShowDynamicStyleDefault]; //不设置动画
        
        [MKShowDynamic showMkInPutViewWithMessage:@"消息输入" sureCallBack:^(id  _Nullable backObject) {
            NSLog(@"backObject : %@",(NSString *)backObject);
        } cancelCallBack:^(id  _Nullable backObject) {
            
        }];
        
    }
    
    if ([className isEqualToString:@"MKShowDynamicStyleShadowDefault"]) {
        
        [MKShowDynamic setDefaultMKShowShowStyle:MKShowShowStyleShadow]; //设置有阴影的弹出样式
        
        [MKShowDynamic setDefaultMKShowDynamicStyle:MKShowDynamicStyleDefault]; //不设置动画
        
        [MKShowDynamic showMkViewWithMessage:@"消息提示" sureCallBack:^(id backObject) {
            
        } cancelCallBack:^(id backObject) {
            
        }];
    }
    
    if ([className isEqualToString:@"MKShowDynamicStyleShadowText"]) {
        [MKShowDynamic setDefaultMKShowShowStyle:MKShowShowStyleShadow]; //设置有阴影的弹出样式
        
        
        [MKShowDynamic setDefaultMKShowDynamicStyle:MKShowDynamicStyleDefault]; //不设置动画
        
        [MKShowDynamic showMkViewWithMessage:@"消息提示" Text:@"这是现实在文本框里面的内容,这是现实在文本框里面的内容,这是现实在文本框里面的内容,这是现实在文本框里面的内容,这是现实在文本框里面的内容,这是现实在文本框里面的内容,这是现实在文本框里面的内容,这是现实在文本框里面的内容,这是现实在文本框里面的内容,这是现实在文本框里面的内容,这是现实在文本框里面的内容,这是现实在文本框里面的内容" sureCallBack:^(id  _Nullable backObject) {
            
        } cancelCallBack:^(id  _Nullable backObject) {
            
        }];
    }
    
    if ([className isEqualToString:@"MKShowDynamicStyleShadowImportView"]) {
        
        [MKShowDynamic setDefaultMKShowShowStyle:MKShowShowStyleShadow]; //设置有阴影的弹出样式
        
        [MKShowDynamic setDefaultMKShowDynamicStyle:MKShowDynamicStyleDefault]; //不设置动画
        
        [MKShowDynamic showMkInPutViewWithMessage:@"带阴影的输入框" sureCallBack:^(id  _Nullable backObject) {
            NSLog(@"backObject : %@",(NSString *)backObject);
        } cancelCallBack:^(id  _Nullable backObject) {
            
        }];
    }
    
    if ([className isEqualToString:@"MKShowDynamicStyleMultipleButton"]) {
        
        [MKShowDynamic setDefaultMKShowShowStyle:MKShowShowStyleDefault]; //设置默认弹出样式
        
        [MKShowDynamic setDefaultMKShowDynamicStyle:MKShowDynamicStyleDefault]; //不设置动画
        
        [MKShowDynamic showMultipleButtonViewWithMessage:@"多按钮弹出框" titleArray:@[@"按钮1",@"按钮2",@"按钮3",@"按钮4"] sureCallBack:^(id  _Nullable backObject) {
            
            NSLog(@"did selectd button tag : %lu",[backObject integerValue]);
            
        } cancelCallBack:^(id  _Nullable backObject) {
            
        }];
        
    }
    
    if ([className isEqualToString:@"MKShowDynamicStyleShadowMultipleButton"]) {
        
        [MKShowDynamic setDefaultMKShowShowStyle:MKShowShowStyleShadow]; //设置有阴影的弹出样式
        
        [MKShowDynamic setDefaultMKShowDynamicStyle:MKShowDynamicStyleDefault]; //不设置动画
        
        [MKShowDynamic showMultipleButtonViewWithMessage:@"多按钮弹出框" titleArray:@[@"按钮1",@"按钮2",@"按钮3",@"按钮4"] sureCallBack:^(id  _Nullable backObject) {
            
            NSLog(@"did selectd button tag : %lu",[backObject integerValue]);
            
        } cancelCallBack:^(id  _Nullable backObject) {
            
        }];
    }
    
    if ([className isEqualToString:@"MKShowDynamicStyleBottomUp"]) {
        
        [MKShowDynamic setDefaultMKShowShowStyle:MKShowShowStyleShadow]; //设置有阴影的弹出样式
        
        [MKShowDynamic setDefaultMKShowDynamicStyle:MKShowDynamicStyleBottomUp]; //设置重底部进入
        
        [MKShowDynamic showMkInPutViewWithMessage:@"带阴影的输入框" sureCallBack:^(id  _Nullable backObject) {
            NSLog(@"backObject : %@",(NSString *)backObject);
        } cancelCallBack:^(id  _Nullable backObject) {
            
        }];
    }
    
    if ([className isEqualToString:@"MKShowDynamicStyleLeftIn"]) {
        [MKShowDynamic setDefaultMKShowShowStyle:MKShowShowStyleDefault]; //设置为普通显示
        
        [MKShowDynamic setDefaultMKShowDynamicStyle:MKShowDynamicStyleLeftIn]; //左侧进入
        
        [MKShowDynamic showMkViewWithMessage:@"消息提示" Text:@"入夜渐微凉 繁花落地成霜 你在远方眺望 耗尽所有暮光 不思量自难相忘 傲日其愣：夭夭桃花凉 前世你怎舍下 这一海心茫茫" sureCallBack:^(id  _Nullable backObject) {
            
        } cancelCallBack:^(id  _Nullable backObject) {
            
        }];
    }
    
    if ([className isEqualToString:@"MKShowDynamicStyleCenter"]) {
        [MKShowDynamic setDefaultMKShowShowStyle:MKShowShowStyleDefault]; //设置为普通显示
        
        [MKShowDynamic setDefaultMKShowDynamicStyle:MKShowDynamicStyleCenter]; //设置为中间的显示
        
        [MKShowDynamic showMkViewWithMessage:@"消息提示" sureCallBack:^(id backObject) {
            
        } cancelCallBack:^(id backObject) {
            
        }];
        
    }
    
    if ([className isEqualToString:@"MKShowDynamicStyleMultipleImportView"]) {
        
        [MKShowDynamic setDefaultMKShowShowStyle:MKShowShowStyleDefault]; //设置为普通显示
        
        [MKShowDynamic setDefaultMKShowDynamicStyle:MKShowDynamicStyleDefault]; //设置为中间的显示
        
        [MKShowDynamic showMultipleImprotViewWithMessage:@"多输入弹出框" titleArray:@[@"姓名",@"性别",@"年龄"] sureCallBack:^(id  _Nullable backObject) {
            NSLog(@"backObject : %@",(NSMutableArray *)backObject);
        } cancelCallBack:^(id  _Nullable backObject) {
           
        }];
        
    }
    
    if ([className isEqualToString:@"SystemAlertView"]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"消息提示" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
        [alertView show];
    }
    
}


@end
