//
//  blockObject.h
//  TestCallBack
//
//  Created by csdc-iMac on 14-7-17.
//  Copyright (c) 2014年 JuneWang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^changeColor)(UIColor *newColor);
@interface BlockObject : NSObject
+(void)changeButtonColor:(changeColor)changeColor;
@end
