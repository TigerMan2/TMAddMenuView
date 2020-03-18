//
//  TMAddMenuView.h
//  TMAddMenuView
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMAddMenuItem.h"

@class TMAddMenuView;
@protocol TMAddMenuViewDelegate <NSObject>

@optional

- (void)addMenuView:(TMAddMenuView *)addMenuView didSelectedItem:(TMAddMenuItem *)item;

@end

@interface TMAddMenuView : UIView

@property (nonatomic , assign) id <TMAddMenuViewDelegate> delegate;
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
