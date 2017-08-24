//
//  WYAddMenuView.h
//  WYAddMenuView
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYAddMenuItem.h"

@class WYAddMenuView;
@protocol WYAddMenuViewDelegate <NSObject>

@optional

- (void)addMenuView:(WYAddMenuView *)addMenuView didSelectedItem:(WYAddMenuItem *)item;

@end

@interface WYAddMenuView : UIView

@property (nonatomic , assign) id <WYAddMenuViewDelegate> delegate;
/**
 展示

 @param view SuperView
 */
- (void) showInView:(UIView *)view;

/**
 是否在展示

 @return yes/no
 */
- (BOOL)isShow;

/**
 取消展示
 */
- (void) dismiss;

@end
