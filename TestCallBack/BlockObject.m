//
//  blockObject.m
//  TestCallBack
//
//  Created by csdc-iMac on 14-7-17.
//  Copyright (c) 2014年 JuneWang. All rights reserved.
//

#import "BlockObject.h"

@implementation BlockObject
+(void)changeButtonColor:(changeColor)changeColor{
    changeColor([UIColor orangeColor]);
    NSLog(@"heihei");
}
@end
