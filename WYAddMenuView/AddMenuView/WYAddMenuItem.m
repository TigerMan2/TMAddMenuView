//
//  WYAddMenuItem.m
//  WYAddMenuView
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "WYAddMenuItem.h"

@implementation WYAddMenuItem

+ (WYAddMenuItem *)createItemWithType:(WYAddMenuType)type title:(NSString *)title iconPath:(NSString *)iconPath className:(NSString *)className
{
    WYAddMenuItem *item = [[WYAddMenuItem alloc] init];
    item.type = type;
    item.title = title;
    item.iconPath = iconPath;
    item.className = className;
    return item;
}
@end
