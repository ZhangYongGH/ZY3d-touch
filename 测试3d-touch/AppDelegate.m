//
//  AppDelegate.m
//  测试3d-touch
//
//  Created by zhangyong on 16/4/22.
//  Copyright © 2016年 zhangyong. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MyTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    MyTabBarViewController *mainVC = [[MyTabBarViewController alloc] init];
    
    self.window.rootViewController = mainVC;
    [self.window makeKeyAndVisible];
    
    
    //创建应用图标上的3D touch快捷选项
    [self creatShortcutItem];
    
    UIApplicationShortcutItem *shortcutItem = [launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey];
    //如果是从快捷选项标签启动app，则根据不同标识执行不同操作，然后返回NO，防止调用- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
    
    if (shortcutItem) {
        //判断先前我们设置的快捷选项标签唯一标识，根据不同标识执行不同操作
        if([shortcutItem.type isEqualToString:@"ViewController"]){
          
        //进入第一页面
            
//            NSArray *arr = @[@"hello 3D Touch"];
//            UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:arr applicationActivities:nil];
//            [self.window.rootViewController presentViewController:vc animated:YES completion:^{
//            }];
            mainVC.selectedIndex = 0;
            
            
        } else if ([shortcutItem.type isEqualToString:@"SecondViewController"]) {
            //进入第二页面

            mainVC.selectedIndex = 1;
            
        } else if ([shortcutItem.type isEqualToString:@"ThirdViewController"]) {
            //进入第三页面

            mainVC.selectedIndex = 2;
        }
        else if ([shortcutItem.type isEqualToString:@"FourthViewController"]) {
            //进入第四页面

            mainVC.selectedIndex = 3;
        }
        
        return NO;
    }
    
    return YES;
}


//创建应用图标上的3D touch快捷选项
- (void)creatShortcutItem {
    //创建系统风格的icon
//    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];
    
    
    NSArray *picArray = @[@"ScanQR1",@"ScanQR2",@"ScanQR3",@"ScanQR4"];
    
    NSArray *vcName = @[@"ViewController",@"SecondViewController",@"ThirdViewController",@"FourthViewController"];
    NSArray *titleArray = @[@"3d第一",@"3d第二",@"3d第三",@"3d第四"];
    NSArray *subTitleArray = @[@"第一副标题",@"第二副标题",@"第三副标题",@"第四副标题"];
    
    NSMutableArray *itemArray = [NSMutableArray array];
    
    for (int i = 0; i < titleArray.count; i ++) {
         //创建自定义图标的icon
        UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithTemplateImageName:picArray[i]];
        
        //创建快捷选项，type为页面标示符，点击图标按压出来的选项根据标识符进入对应的页面
        UIApplicationShortcutItem * item = [[UIApplicationShortcutItem alloc]initWithType:vcName[i] localizedTitle:titleArray[i] localizedSubtitle:subTitleArray[i] icon:icon userInfo:nil];
        
        [itemArray addObject:item];
        
    }
    
    //添加到快捷选项数组
    [UIApplication sharedApplication].shortcutItems = itemArray;
}



//如果app在后台，通过快捷选项标签进入app，则调用该方法，如果app不在后台已杀死，则处理通过快捷选项标签进入app的逻辑在- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions中
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    MyTabBarViewController *mainVC = [[MyTabBarViewController alloc] init];
    
    self.window.rootViewController = mainVC;
    [self.window makeKeyAndVisible];
    

    if (shortcutItem) {
        //判断先前我们设置的快捷选项标签唯一标识，根据不同标识执行不同操作
        if([shortcutItem.type isEqualToString:@"ViewController"]){
            //进入第一页面
            
            mainVC.selectedIndex = 0;
            
            
        } else if ([shortcutItem.type isEqualToString:@"SecondViewController"]) {
            
            //进入第二页面

            
            mainVC.selectedIndex = 1;
            
        } else if ([shortcutItem.type isEqualToString:@"ThirdViewController"]) {
            //进入第三页面

            
            mainVC.selectedIndex = 2;
        }
        else if ([shortcutItem.type isEqualToString:@"FourthViewController"]) {
            //进入第四页面
            
            mainVC.selectedIndex = 3;
        }
        
        
    }
    if (completionHandler) {
        completionHandler(YES);
    }
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
