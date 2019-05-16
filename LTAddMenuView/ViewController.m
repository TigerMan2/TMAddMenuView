//
//  ViewController.m
//  LTAddMenuView
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "LTAddMenuView.h"

@interface ViewController ()<LTAddMenuViewDelegate>

@property (nonatomic , strong) LTAddMenuView *addMenuView;

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
- (LTAddMenuView *)addMenuView{
    if (_addMenuView == nil) {
        _addMenuView = [[LTAddMenuView alloc] init];
        [_addMenuView setDelegate:self];
    }
    return _addMenuView;
}
- (void)addMenuView:(LTAddMenuView *)addMenuView didSelectedItem:(LTAddMenuItem *)item
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
