//
//  UIApplication+Analyse.m
//  AnalySDKDemo
//
//  Created by farben on 2020/5/25.
//  Copyright © 2020 farben. All rights reserved.
//

#import "UIApplication+Analyse.h"
#import "NSObject+Swizzle.h"

@implementation UIApplication (Analyse)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalDidLoadSelector = @selector(sendAction:to:from:forEvent:);
        SEL swizzingDidLoadSelector = @selector(hs_sendAction:to:from:forEvent:);
        [UIApplication hs_SwizzleMethodClass:[self class] from:originalDidLoadSelector to:swizzingDidLoadSelector];
    });
}


- (BOOL)hs_sendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event{
    BOOL result = [self hs_sendAction:action to:target from:sender forEvent:event];
    NSLog(@"++++按钮被点击了++++");
    return result;
}





@end
