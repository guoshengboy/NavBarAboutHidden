//
//  BaseViewController.m
//  导航栏
//
//  Created by cgs on 16/10/14.
//  Copyright © 2016年 cgs. All rights reserved.
//

#import "BaseViewController.h"
#import "baseNavVC.h"

@interface BaseViewController ()

@property(nonatomic,strong)UIButton * navBarLeftBtn;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self a1];
   
}

-(void)setRealTitle:(NSString *)realTitle{
    
    self.navigationItem.title = realTitle;
    _realTitle = realTitle;
}

-(void)a1{
    
    if ([self needHiddenBarInViewController:self]) {
        
        self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:[UIView new]];
        return;
    }
    self.navBarLeftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.navBarLeftBtn.frame=CGRectMake(0, 0, 44, 44);
    [self.navBarLeftBtn setBackgroundImage:[UIImage imageNamed:@"back_1"] forState:UIControlStateNormal];
    [self.navBarLeftBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:self.navBarLeftBtn];
}

-(void)backAction{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UINavigationControllerDelegate



-(void)viewWillAppear:(BOOL)animated{
    
     [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:[self needHiddenBarInViewController:self] animated:animated];
}


-(void)viewWillDisappear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:[self needHiddenBarInViewController:self] animated:animated];
     [super viewWillDisappear:animated];
}


-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];

    if (self.navigationController.navigationBar.topItem != self.navigationItem &&
        ![self needHiddenBarInViewController:self]) {
        
        [self.navigationController setNavigationBarHidden:YES animated:animated];
        [self.navigationController setNavigationBarHidden:NO animated:animated];
    }
}

- (BOOL) needHiddenBarInViewController:(UIViewController *)viewController {
    
    BOOL needHideNaivgaionBar = NO;
    
    if ([viewController isKindOfClass:NSClassFromString(@"ViewController")] ||
        [viewController isKindOfClass:NSClassFromString(@"ViewController__1")]) {
        needHideNaivgaionBar = YES;
        
    }
    return needHideNaivgaionBar;
}



@end
