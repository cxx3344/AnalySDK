//
//  UIViewController+Analyse.m
//  AnalySDKDemo
//
//  Created by farben on 2020/5/20.
//  Copyright © 2020 farben. All rights reserved.
//

#import "UIViewController+Analyse.h"
#import "NSObject+Swizzle.h"
#import <objc/runtime.h>


@implementation UIViewController (Analyse)
+ (void)load{
    NSLog(@"测试：%@",NSStringFromClass([self class]));
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalDidLoadSelector = @selector(viewWillAppear:);
        SEL swizzingDidLoadSelector = @selector(hs_viewWillAppear:);
        [UIViewController hs_SwizzleMethodClass:[self class] from:originalDidLoadSelector to:swizzingDidLoadSelector];
        
        SEL originalDellocSelector = @selector(viewWillDisappear:);
        SEL swizzingDellocSelector = @selector(hs_viewWillDisappear:);
        [UIViewController hs_SwizzleMethodClass:[self class] from:originalDellocSelector to:swizzingDellocSelector];
    });
}

- (void)hs_viewWillAppear:(BOOL)animated{
    [self hs_viewWillAppear:animated];
    NSString *name = NSStringFromClass([self class]);
    NSLog(@"%@-viewWillAppear",name);
}


- (void)hs_viewWillDisappear:(BOOL)animated{
    [self hs_viewWillDisappear:animated];
    NSString *name = NSStringFromClass([self class]);
    NSLog(@"%@_viewWillDisappear",name);
}




@end
