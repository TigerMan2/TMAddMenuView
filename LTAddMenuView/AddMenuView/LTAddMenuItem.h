//
//  LTAddMenuItem.h
//  LTAddMenuView
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTEnumerate.h"

@interface LTAddMenuItem : NSObject

@property (nonatomic , assign) LTAddMenuType type;

@property (nonatomic , strong) NSString *title;

@property (nonatomic , strong) NSString *iconPath;

@property (nonatomic , strong) NSString *className;

/**
 Create LTAddMenuItem

 @param type 类型
 @param title 标题
 @param iconPath 图片链接
 @param className 类名
 @return item
 */
+ (LTAddMenuItem *)createItemWithType:(LTAddMenuType)type title:(NSString *)title iconPath:(NSString *)iconPath className:(NSString *)className;

@end
