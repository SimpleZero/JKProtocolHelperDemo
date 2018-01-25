//
//  JKProtocolHelper.h
//  JKProtocolHelper
//
//  Created by 01 on 2018/1/23.
//  Copyright © 2018年 01. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define JKProtocolHelper(__protocol__, ...)  \
[JKProtocolHelper helperWithProtocol:@protocol(__protocol__)  \
executors:[NSArray arrayWithObjects:__VA_ARGS__, nil]]

@interface JKProtocolHelper : NSObject

+ (id)helperWithProtocol:(Protocol *)protocol executors:(NSArray *)executors;

@end

NS_ASSUME_NONNULL_END
