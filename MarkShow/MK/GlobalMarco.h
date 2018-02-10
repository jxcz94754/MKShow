//
//  GlobalMarco.h
//  Wuaimi
//
//
//  Created by 52aimi on 2017/2/27.
//  Copyright © 2017年 52aimi. All rights reserved.
//

#ifndef GlobalMarco_h
#define GlobalMarco_h


//正则相关
#define REGEX_TEL       @"^[1][3-8]+\\d{9}"

//screen
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREENRECT [UIScreen mainScreen].bounds

#define kSNBaseWidth 320.f
#define kSNBaseHeight 568.f

#define KSN4SScreenHeight 480.f

#define kSNScreenWidth [UIScreen mainScreen].bounds.size.width
#define kSNScreenHeight ([UIScreen mainScreen].bounds.size.height==KSN4SScreenHeight?kSNBaseHeight:[UIScreen mainScreen].bounds.size.height)
#define kSNScreenWidthRatio  (kSNScreenWidth / kSNBaseWidth)
#define kSNScreenHeightRatio (kSNScreenHeight / kSNBaseHeight)
#define SNAdaptedWidthValue(x)  (ceilf((x) * kSNScreenWidthRatio))
#define SNAdaptedHeightValue(x) (ceilf((x) * kSNScreenHeightRatio))


//Version
#define SWOSVersionAtLeast(v)  \
([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

//字体相关
#define FONT_LIGHT(fontsize) (SWOSVersionAtLeast(@"8.2")?([UIFont systemFontOfSize:fontsize weight:UIFontWeightLight]):([UIFont fontWithName:@"HelveticaNeue-Light" size:fontsize]))
#define FONT_REGULAR(fontsize) (SWOSVersionAtLeast(@"8.2")?([UIFont systemFontOfSize:fontsize weight:UIFontWeightRegular]):([UIFont fontWithName:@"HelveticaNeue" size:fontsize]))
#define FONT_BOLD(fontsize) (SWOSVersionAtLeast(@"8.2")?([UIFont systemFontOfSize:fontsize weight:UIFontWeightBold]):([UIFont boldSystemFontOfSize:fontsize]))
#define FONT8_BOLD(fontsize) [UIFont systemFontOfSize:fontsize weight:UIFontWeightBold]
#define FONT8_THIN(fontsize) [UIFont systemFontOfSize:fontsize weight:UIFontWeightThin]


#define FONT_ICON(fontsize) ([UIFont fontWithName:@"iconfont" size:fontsize])
#define FONT_DIGIT(fontsize) ([UIFont fontWithName:@"Helvetica" size:fontsize])
#define FONT_DIGIT_BOLD(fontsize) ([UIFont fontWithName:@"Helvetica-Bold" size:fontsize])

//color
#define UICOLOR_WITH_RGB(r,g,b,a) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]
#define UICOLOR_WITH_HEX(rgb) [UIColor colorWithRed:((float)((rgb&0xFF0000)>>16))/255.0 green:((float)((rgb&0xFF00)>>8))/255.0  blue:((float)(rgb&0xFF))/255.0  alpha:1]


#define LINE_BACKGROUND_COLOR ([[UIColor blackColor] colorWithAlphaComponent:.5f])
#define POP_BACKGROUND_COLOR ([[UIColor blackColor] colorWithAlphaComponent:.5f])
#define NAVBAR_TINTCOLOR UICOLOR_WITH_HEX(0x79d6f2)//主体颜色
#define SYSTEM_BLACKGROUND_COLOR UICOLOR_WITH_HEX(0xf2f2f2)//默认的背景颜色
#define SYSTEM_GLARYTEXT_COLOR UICOLOR_WITH_HEX(0x888888)//默认的灰色字体颜色
#define SYSTEM_TEXT_COLOR UICOLOR_WITH_HEX(0x262626) // 默认的主色字体颜色
#define SYSTEM_LINE_COLOR UICOLOR_WITH_HEX(0xdddddd) //默认的线条颜色


//notification name
#define NOTIFICATION_LOGIN_SUCCESSS @"NOTIFICATION_LOGIN_SUCCESSS"

//block weak self
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//singleton
#define SINGLETON_INTERFACE + (nonnull instancetype)sharedInstance;
#define SINGLETON_IMPLEMENTATION(singleton) + (nonnull instancetype)sharedInstance { \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        singleton = [[[self class] alloc] init]; \
    }); \
    return singleton; \
} \
 \
+ (nonnull instancetype)allocWithZone:(struct _NSZone *)zone { \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        singleton = [super allocWithZone:zone]; \
    }); \
    return singleton; \
} \
 \
- (nonnull id)copyWithZone:(NSZone *)zone { \
    return singleton; \
} \

//telephone regex
#define kMobilePhoneNumberFormat @"^1[3-9]\\d{9}$"

#define TABLEVIEWCELL_DEFAULT_HEIGHT 44

#endif /* GlobalMarco_h */
