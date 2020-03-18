//
//  TMAddMenuItem.m
//  TMAddMenuView
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "TMAddMenuItem.h"

@implementation TMAddMenuItem

+ (TMAddMenuItem *)createItemWithType:(TMAddMenuType)type title:(NSString *)title iconPath:(NSString *)iconPath className:(NSString *)className
{
    TMAddMenuItem *item = [[TMAddMenuItem alloc] init];
    item.type = type;
    item.title = title;
    item.iconPath = iconPath;
    item.className = className;
    return item;
}
@end
