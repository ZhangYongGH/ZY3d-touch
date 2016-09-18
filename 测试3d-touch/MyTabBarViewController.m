



//
//  MyTabBarViewController.m
//  测试3d-touch
//
//  Created by zhangyong on 16/4/22.
//  Copyright © 2016年 zhangyong. All rights reserved.
//

#import "MyTabBarViewController.h"

@interface MyTabBarViewController ()

@end

@implementation MyTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *vcName = @[@"ViewController",@"SecondViewController",@"ThirdViewController",@"FourthViewController"];
    NSArray *titleArray = @[@"第一",@"第二",@"第三",@"第四"];
    
    NSMutableArray *navArray = [NSMutableArray array];
    
    
    for (int i = 0; i < 4; i ++) {
        
        UIViewController *vc = [[NSClassFromString(vcName[i]) alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:titleArray[i] image:nil selectedImage:nil];
        nav.tabBarItem = item;
        [navArray addObject:nav];
    }
    
    
    self.viewControllers = navArray;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
