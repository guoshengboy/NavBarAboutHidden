//
//  ViewController.m
//  导航栏
//
//  Created by cgs on 16/10/9.
//  Copyright © 2016年 cgs. All rights reserved.
//

#import "ViewController.h"
#import "ViewController_1.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor=[UIColor orangeColor];
    
//    self.title=@"0";
    
    
    UIButton* btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    [btn setTitle:@"first VC" forState:UIControlStateNormal];
    btn.frame=CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(aa) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor=[UIColor grayColor];
}


-(void)aa{
    
     [self.navigationController pushViewController:[ViewController__1 new] animated:YES];
}





@end
