//
//  baseNavVC.m
//  导航栏
//
//  Created by cgs on 16/10/9.
//  Copyright © 2016年 cgs. All rights reserved.
//

#import "baseNavVC.h"

@interface baseNavVC ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation baseNavVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate=self;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //    if (self.fullScreenPopGestureEnable) {
    //        id target = self.interactivePopGestureRecognizer.delegate;
    //        SEL action = NSSelectorFromString(@"handleNavigationTransition:");
    //        self.popPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:action];
    //        [self.view addGestureRecognizer:self.popPanGesture];
    //        self.popPanGesture.maximumNumberOfTouches = 1;
    //        self.interactivePopGestureRecognizer.enabled = NO;
    //    } else {
    self.interactivePopGestureRecognizer.delegate = self;
    //    }
    

}




//解决某些情况push会卡死的情况
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    
    if (navigationController.viewControllers.count == 1) {
        navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // fix 'nested pop animation can result in corrupted navigation bar'
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    [super pushViewController:viewController animated:animated];
}


-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    self.isHiddenBar=[self needHiddenBarInViewController:viewController];
}

-(BOOL) needHiddenBarInViewController:(UIViewController *)viewController {
    
    BOOL needHideNaivgaionBar = NO;
    
    if ([viewController isKindOfClass:NSClassFromString(@"ViewController")] ||
        [viewController isKindOfClass:NSClassFromString(@"ViewController__1")] ||
        [viewController isKindOfClass:NSClassFromString(@"ViewController_22")]||
        [viewController isKindOfClass:NSClassFromString(@"ViewController33")]||
        [viewController isKindOfClass:NSClassFromString(@"Order_CarWashViewController")]||
        [viewController isKindOfClass:NSClassFromString(@"Order_LifeViewController")]||
        [viewController isKindOfClass:NSClassFromString(@"EH_DiscoverViewController")]||
        [viewController isKindOfClass:NSClassFromString(@"MineViewController")]||
        [viewController isKindOfClass:NSClassFromString(@"SeverItemViewController")]||
        [viewController isKindOfClass:NSClassFromString(@"EH_ShiTang_MainViewController")]||
        [viewController isKindOfClass:NSClassFromString(@"ShiTangMenuListVC")]||
        [viewController isKindOfClass:NSClassFromString(@"ShiTang_DetailWebVC")]||
        [viewController isKindOfClass:NSClassFromString(@"Main_CarWashViewController")]||
        [viewController isKindOfClass:NSClassFromString(@"PunchCardViewController")]) {
        needHideNaivgaionBar = YES;
        
    }
    return needHideNaivgaionBar;
}



//修复有水平方向滚动的ScrollView时边缘返回手势失效的问题
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
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
