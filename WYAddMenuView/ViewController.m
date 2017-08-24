//
//  ViewController.m
//  WYAddMenuView
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "WYAddMenuView.h"

@interface ViewController ()<WYAddMenuViewDelegate>

@property (nonatomic , strong) WYAddMenuView *addMenuView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightItemTap:)];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}
#pragma mark - Event Response
- (void)rightItemTap:(UIBarButtonItem *)sender
{
    if (self.addMenuView.isShow) {
        [self.addMenuView dismiss];
    }
    else {
        [self.addMenuView showInView:self.navigationController.view];
    }
}
- (WYAddMenuView *)addMenuView{
    if (_addMenuView == nil) {
        _addMenuView = [[WYAddMenuView alloc] init];
        [_addMenuView setDelegate:self];
    }
    return _addMenuView;
}
- (void)addMenuView:(WYAddMenuView *)addMenuView didSelectedItem:(WYAddMenuItem *)item
{
    if (item.className.length > 0) {
        id vc = [[NSClassFromString(item.className) alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else NSLog(@"Operation is not open!");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
