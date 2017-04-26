//
//  ViewController3.m
//  导航栏
//
//  Created by cgs on 16/10/9.
//  Copyright © 2016年 cgs. All rights reserved.
//

#import "ViewController3.h"
#import "ViewController.h"

@interface ViewController3 ()


@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor blueColor];

    self.navColor = [UIColor greenColor];
    
    self.realTitle = @"four VC";

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
}

-(void)aa{
    
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}





-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];

}

@end
