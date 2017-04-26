//
//  ViewController_2.m
//  导航栏
//
//  Created by cgs on 16/10/9.
//  Copyright © 2016年 cgs. All rights reserved.
//

#import "ViewController_2.h"
#import "ViewController3.h"

@interface ViewController_2 ()

@end

@implementation ViewController_2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.realTitle = @"third VC";
    
    
    self.view.backgroundColor=[UIColor redColor];
    UIButton* btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame=CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(aa) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor=[UIColor grayColor];
    [btn setTitle:@"third VC" forState:UIControlStateNormal];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    label.text = @"左边";
    label.textColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:label];
}

-(void)aa{
    
    [self performSelector:@selector(aaa) withObject:nil afterDelay:0.1];
    
}

-(void)aaa{
    [self.navigationController pushViewController:[ViewController3 new] animated:YES];
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
}

@end
