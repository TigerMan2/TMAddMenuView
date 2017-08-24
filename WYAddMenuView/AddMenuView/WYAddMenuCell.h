//
//  WYAddMenuCell.h
//  WYAddMenuView
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYAddMenuItem.h"

#define WYAddMenuTableBackColor [UIColor colorWithRed:71/255.0 green:70/255.0 blue:73/255.0 alpha:1]
#define WYAddMenuSelectColor [UIColor colorWithRed:65/255.0 green:64/255.0 blue:67/255.0 alpha:1]


@interface WYAddMenuCell : UITableViewCell

@property (nonatomic , strong) WYAddMenuItem *menuItem;

@end
