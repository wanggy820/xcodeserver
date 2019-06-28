//
//  ViewController1.m
//  test
//
//  Created by rr wanggy on 2019/6/4.
//  Copyright © 2019 rr wanggy. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()


@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, UIScreen.mainScreen.bounds.size.width-100, 50)];
    [btn setTitle:@"click to flutter11" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
    //
    self.test = ^{
        NSLog(@"%@",self);
    };
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}
- (void)click:(UIButton *)btn {
    //    ViewController *vc = [[ViewController alloc] init];
    //    [self.navigationController pushViewController:vc animated:YES];
    
    static int i = 0;
    
    //    if (i%2==0) {
    //        [SAMKeychain setPassword:@"123456" forService:@"com.tojoy" account:@"wanggy820"];
    //        NSLog(@"--set ");
    //    } else {
    //        NSLog(@"--password:%@", [SAMKeychain passwordForService:@"com.tojoy" account:@"wanggy820"]);
    //    }
    i++;
    self.test();
    [btn setTitle:@(i).stringValue forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:nil];
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
