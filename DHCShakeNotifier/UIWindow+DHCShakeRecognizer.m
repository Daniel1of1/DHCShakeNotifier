//
//  UIWindow+CJShakeRecognizer.m
//  FeedbackrPre
//
//  Created by confidence on 04/01/2013.
//  Copyright (c) 2013 confidence. All rights reserved.
//

#import "UIWindow+DHCShakeRecognizer.h"
#import <objc/runtime.h>

@implementation UIWindow (DHCShakeRecognizer)

+(void)load {
    Method original = class_getInstanceMethod([self class], @selector(motionEnded:withEvent:));
    Method dhcPrefixed = class_getInstanceMethod([self class],@selector(dhc_motionEnded:withEvent:));
    
    method_exchangeImplementations(original, dhcPrefixed);
}

- (void)dhc_motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake) {
        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"CONJUShakeNotification" object:nil]];
    }
    if ([UIWindow instancesRespondToSelector:@selector(dhc_motionEnded:withEvent:)]) {
        [self dhc_motionEnded:motion withEvent:event];
    }
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
}

@end

NSString * const DHCSHakeNotificationName = @"CONJUShakeNotification";
