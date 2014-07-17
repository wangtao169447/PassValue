//
//  DataSource.m
//  TestCallBack
//
//  Created by csdc-iMac on 14-7-17.
//  Copyright (c) 2014年 JuneWang. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource
+(DataSource *)sharedDataSource{
    static DataSource *dataSource = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        dataSource = [DataSource new];
    });
    return dataSource;
}
@end
