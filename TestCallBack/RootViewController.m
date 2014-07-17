//
//  RootViewController.m
//  TestCallBack
//
//  Created by csdc-iMac on 14-7-17.
//  Copyright (c) 2014年 JuneWang. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"
#import "BlockObject.h"
#import "DataSource.h"
@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangeNameNotification:) name:@"ChangeNameNotification" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showSecondView:(id)sender {
    SecondViewController *second = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    second.delegate = self;
    [self presentViewController:second animated:YES completion:nil];
}

-(void)showName:(NSString *)nameString{
    self.nameLabel.text = nameString;
}
-(void)ChangeNameNotification:(NSNotification*)notification{
    NSDictionary *nameDictionary = [notification userInfo];
    self.nameLabel.text = [nameDictionary objectForKey:@"name"];
}

- (IBAction)showSecondWithBlock:(id)sender {
    SecondViewController *second = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    [self presentViewController:second animated:YES completion:nil];
    second.block = ^(NSString *str){
        self.nameLabel.text = str;
    };
}
- (IBAction)changeButtonColor:(id)sender {
    [BlockObject changeButtonColor:^(UIColor*newColor){
        UIButton *button = sender;
        button.backgroundColor = newColor;
    }];
    
//以下为一些简单的block测试，想看效果的话，取消注释即可
  /*
    int (^myblock_1)(int a, int b) = ^(int a, int b){
        return a + b;
    };
    NSLog(@"------%d", myblock_1(1, 2));
   
    //__block 变量
    __block int num;
    int (^myblock_2)(int a, int b) = ^(int a, int b){
        num = a + b;
        return num;
    };
    NSLog(@"++++++%d", myblock_2(2, 3));
    
    //Block传递函数指针
    int (^test_1)()= ^{
        NSLog(@"I");
        return 1;
    };
    int (^test_2)()= ^{
        NSLog(@"MANNA");
        return 2;
    };
    int (^test_3)()= ^{
        NSLog(@"PLAY");
        return 3;
    };
    [self testBlock:test_1];
    [self testBlock:test_2];
    [self testBlock:test_3];
    
    //多Block参数
    [self testBlock_Concurrency:^{
        NSLog(@"这是第一个Block.");
        return 100;
    }block_2:^(int p){
        NSLog(@"这是第二个Block.");
    }block_3:^{
        NSLog(@"这是第三个Block.");
    }];
   */
}

- (void)testBlock:(int (^)())test_block
{
    int result = test_block();
    NSLog(@"注意先后顺序，结果是:%d", result);
}

- (void)testBlock_Concurrency:(int (^)())block_1 block_2:(void(^)(int))block_2 block_3:(void(^)())block_3
{
    int result = block_1();
    block_2(100);
    block_3();
    
    NSLog(@"多么神奇的Block.result=%d.", result);
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //如果想测试通过UserDefault方式传值或者通过单例方式传值，取消以下注释即可
/*
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"myNameText"] length] != 0) {
        self.nameLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"myNameText"];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"myNameText"];
    }
    DataSource *dataSource = [DataSource sharedDataSource];
    if ([dataSource.myName length] != 0) {
        self.nameLabel.text = dataSource.myName;
        dataSource.myName = @"";
    }
*/
}
@end
