//
//  TMAddMenuCell.h
//  TMAddMenuView
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMAddMenuItem.h"

#define TMAddMenuTableBackColor [UIColor colorWithRed:71/255.0 green:70/255.0 blue:73/255.0 alpha:1]
#define TMAddMenuSelectColor [UIColor colorWithRed:65/255.0 green:64/255.0 blue:67/255.0 alpha:1]


@interface TMAddMenuCell : UITableViewCell

@property (nonatomic , strong) TMAddMenuItem *menuItem;

@end
