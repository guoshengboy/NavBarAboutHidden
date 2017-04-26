//
//  ViewController_1.m
//  导航栏
//
//  Created by cgs on 16/10/9.
//  Copyright © 2016年 cgs. All rights reserved.
//

#import "ViewController_1.h"
#import "ViewController_2.h"

@interface ViewController__1 ()

@end

@implementation ViewController__1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor blueColor];
//    self.title=@"1";
    UIButton* btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame=CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(aa) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor=[UIColor grayColor];
    
    UIButton* btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn1];
    btn1.frame=CGRectMake(0, 0, 100,100);
    [btn1 addTarget:self action:@selector(aa) forControlEvents:UIControlEventTouchUpInside];
    btn1.backgroundColor=[UIColor grayColor];
    [btn1 setTitle:@"second VC" forState:UIControlStateNormal];
    
}


-(void)aa{
    [self.navigationController pushViewController:[ViewController_2 new] animated:YES];
}







@end
