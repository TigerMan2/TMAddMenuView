//
//  LTAddMenuHelper.m
//  LTAddMenuView
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LTAddMenuHelper.h"
#import "LTAddMenuItem.h"

@interface LTAddMenuHelper ()

@property (nonatomic , strong) NSArray *menuItemTypes;

@end

@implementation LTAddMenuHelper

- (instancetype)init{
    self = [super init];
    if (self) {
        _menuItemTypes = @[@"0",@"1",@"2",@"3"];
    }
    return self;
}
- (NSMutableArray *)menuData
{
    if (_menuData == nil) {
        _menuData = [[NSMutableArray alloc] init];
        for (NSString *type in _menuItemTypes) {
            LTAddMenuItem *item = [self createItemWithType:[type integerValue]];
            [_menuData addObject:item];
        }
    }
    return _menuData;
}

- (LTAddMenuItem *)createItemWithType:(LTAddMenuType)type
{
    switch (type) {
        case LTAddMenuTypeGroupChat:
            return [LTAddMenuItem createItemWithType:type title:@"发起群聊" iconPath:@"contacts_add_newmessage" className:@"GroupChatController"];
            break;
        case LTAddMenuTypeAddFriend:
            return [LTAddMenuItem createItemWithType:type title:@"添加朋友" iconPath:@"contacts_add_friend" className:@"AddFriendController"];
            break;
        case LTAddMenuTypeScan:
            return [LTAddMenuItem createItemWithType:type title:@"扫一扫" iconPath:@"contacts_add_scan" className:@"ScanController"];
            break;
        case LTAddMenuTypeWallet:
            return [LTAddMenuItem createItemWithType:type title:@"收付款" iconPath:@"receipt_payment_icon" className:@"WalletController"];
            break;
            
        default:
            break;
    }
}

@end
