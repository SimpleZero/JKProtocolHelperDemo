//
//  JKProtocolHelper.m
//  JKProtocolHelper
//
//  Created by 01 on 2018/1/23.
//  Copyright © 2018年 01. All rights reserved.
//

#import "JKProtocolHelper.h"
#import <objc/runtime.h>

@implementation JKProtocolHelper {
    Protocol *_protocol;
    NSPointerArray *_executors;
    
    struct objc_method_description _omd;
}

+ (id)helperWithProtocol:(Protocol *)protocol executors:(NSArray *)executors {
    JKProtocolHelper *one = [JKProtocolHelper new];
    one->_protocol = protocol;
    
    one->_executors = [NSPointerArray weakObjectsPointerArray];
    for (NSObject *obj in executors) {
        [one->_executors addPointer:(__bridge void * _Nullable)(obj)];
    }
    return one;
}

- (BOOL)respondsToSelector:(SEL)aSelector {

    if (![self _protocolContainsSelector:aSelector])
        return [super respondsToSelector:aSelector];

    for (NSObject *obj in _executors) {
        if ([obj respondsToSelector:aSelector]) {
            return YES;
        }
    }
    return NO;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (![self _protocolContainsSelector:aSelector])
        return [super methodSignatureForSelector:aSelector];
    
    return [NSMethodSignature signatureWithObjCTypes:_omd.types];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL sel = anInvocation.selector;
    
    if (![self _protocolContainsSelector:sel]) {
        [super forwardInvocation:anInvocation];
        return;
    }
    
    for (NSObject *obj in _executors) {
        if ([obj respondsToSelector:sel])
            [anInvocation invokeWithTarget:obj];
    }
}

- (BOOL)_protocolContainsSelector:(SEL)sel {
    struct objc_method_description omd = protocol_getMethodDescription(_protocol, sel, YES, YES);
    if (omd.name && omd.types) {
        _omd = omd;
       return YES;
    }
    
    omd = protocol_getMethodDescription(_protocol, sel, NO, YES);
    if (omd.name && omd.types) {
        _omd = omd;
        return YES;
    }
    
    _omd = (struct objc_method_description){NULL, NULL};
    return NO;
}


@end
