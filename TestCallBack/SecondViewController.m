//
//  SecondViewController.m
//  TestCallBack
//
//  Created by csdc-iMac on 14-7-17.
//  Copyright (c) 2014年 JuneWang. All rights reserved.
//

#import "SecondViewController.h"
#import "DataSource.h"
@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation SecondViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)delegateMethod:(id)sender {
    if ([self notEmpty]) {
        [self.delegate showName:self.nameTextField.text];
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self showAlert];
    }
}

-(IBAction)backDown:(id)sender{
    [self.nameTextField resignFirstResponder];
}

- (IBAction)notificationMethod:(id)sender {
    if ([self notEmpty]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangeNameNotification" object:self userInfo:@{@"name":self.nameTextField.text}];
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self showAlert];
    }
}
- (IBAction)blockMethod:(id)sender {
    if ([self notEmpty]) {
        if (self.block) {
            self.block(self.nameTextField.text);
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }else{
        [self showAlert];
    }
}

-(BOOL)notEmpty{
    if ([self.nameTextField.text length] == 0) {
        return NO;
    }
    return YES;
}

-(void)showAlert{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入名字" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    [alert show];
}
//通过文件或者UserDefault方式存值(感觉不太适合此类传值，如果要用文件或者UserDefault方式存值的话，可以考虑此方式)
- (IBAction)userDefaultMethod:(id)sender {
    if ([self notEmpty]) {
        [[NSUserDefaults standardUserDefaults] setObject:self.nameTextField.text forKey:@"myNameText"];
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self showAlert];
    }
}

//通过单例方式传值(感觉不太适合此类传值，如果要用单例方式传值的话，可以考虑此方式)
- (IBAction)singletonMethod:(id)sender {
    if ([self notEmpty]) {
        DataSource *dataSource = [DataSource sharedDataSource];
        dataSource.myName = self.nameTextField.text;
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self showAlert];
    }
}
@end
