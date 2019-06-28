//
//  ViewController.m
//  Router_Demo
//
//  Created by rr wanggy on 2019/4/10.
//  Copyright © 2019 rr wanggy. All rights reserved.
//

#import "ViewController1.h"



@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.navigationController.navigationBar.hidden = YES;
    
    static int count = 0;
    count++;
    self.title = [NSString stringWithFormat:@"title_%d",count];

    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, UIScreen.mainScreen.bounds.size.width-100, 50)];
    [btn setTitle:@"click to flutter" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
}

- (IBAction)click:(id)sender {
    [self testa:@"ccc" a:1];
}



- (void)testa:(NSString *)b a:(int)a {
    void (^myBlock)(int a, NSString *string) = ^(int a, NSString *string) {
        NSLog(@"%d  %@", a, string);
    };
    myBlock(a, b);
    
}

@end
