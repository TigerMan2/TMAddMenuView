//
//  LTAddMenuItem.m
//  LTAddMenuView
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LTAddMenuItem.h"

@implementation LTAddMenuItem

+ (LTAddMenuItem *)createItemWithType:(LTAddMenuType)type title:(NSString *)title iconPath:(NSString *)iconPath className:(NSString *)className
{
    LTAddMenuItem *item = [[LTAddMenuItem alloc] init];
    item.type = type;
    item.title = title;
    item.iconPath = iconPath;
    item.className = className;
    return item;
}
@end
