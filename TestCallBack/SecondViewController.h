//
//  SecondViewController.h
//  TestCallBack
//
//  Created by csdc-iMac on 14-7-17.
//  Copyright (c) 2014年 JuneWang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ablock)(NSString *str);
@protocol secondViewDelegate
-(void)showName:(NSString *)nameString;
@end
@interface SecondViewController : UIViewController
@property (nonatomic, weak)id<secondViewDelegate> delegate;
@property (nonatomic, copy) ablock block;
@property(nonatomic) NSInteger flag;//当前系统标示（0：其他传值方式；1：block传值方式）
@end
