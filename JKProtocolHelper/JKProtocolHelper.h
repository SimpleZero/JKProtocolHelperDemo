//
//  JKProtocolHelper.h
//  JKProtocolHelper
//
//  Created by 01 on 2018/1/23.
//  Copyright © 2018年 01. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JKProtocolHelper : NSObject

+ (id)helperWithProtocol:(Protocol *)protocol executors:(NSArray *)executors;

@end

NS_ASSUME_NONNULL_END
