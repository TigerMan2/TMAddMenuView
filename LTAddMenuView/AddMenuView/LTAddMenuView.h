//
//  LTAddMenuView.h
//  LTAddMenuView
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTAddMenuItem.h"

@class LTAddMenuView;
@protocol LTAddMenuViewDelegate <NSObject>

@optional

- (void)addMenuView:(LTAddMenuView *)addMenuView didSelectedItem:(LTAddMenuItem *)item;

@end

@interface LTAddMenuView : UIView

@property (nonatomic , assign) id <LTAddMenuViewDelegate> delegate;
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
