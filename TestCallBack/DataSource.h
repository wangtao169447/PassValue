//
//  DataSource.h
//  TestCallBack
//
//  Created by csdc-iMac on 14-7-17.
//  Copyright (c) 2014年 JuneWang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSource : NSObject
@property (nonatomic, strong) NSString *myName;
+(DataSource*)sharedDataSource;
@end
