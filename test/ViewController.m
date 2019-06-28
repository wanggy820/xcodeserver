//
//  ViewController.m
//  test
//
//  Created by rr wanggy on 2019/4/12.
//  Copyright © 2019 rr wanggy. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "HYSwiftKeyChain.h"


@interface ViewController ()<UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate, UIScrollViewDelegate>

@property (nonatomic, copy) void (^test)(void);

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    self.navigationController.navigationBar.hidden = YES;
    
    static int count = 0;
    count++;
    self.title = [NSString stringWithFormat:@"title_%d",count];
    
//    self.view.backgroundColor = [UIColor blackColor];

    
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:UIScreen.mainScreen.bounds];
//    scrollView.contentSize = CGSizeMake(375, 800);
//    scrollView.delegate = self;
//    [self.view addSubview:scrollView];

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, UIScreen.mainScreen.bounds.size.width-100, 50)];
    [btn setTitle:@"click to flutter" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
    NSDictionary *dict = @{@"cc":@(NO)};
    BOOL sd = dict[@"cc"];
    NSLog(@"%d", sd);
    

}

- (void)click:(UIButton *)btn {

    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSLog(@"%@",[userDefaults objectForKey:@"name_preference"]);
    
    [btn setTitle:[userDefaults objectForKey:@"name_preference"] forState:UIControlStateNormal];
}








@end
