//
//  NSObject+Swizzle.m
//  AnalySDKDemo
//
//  Created by farben on 2020/5/25.
//  Copyright © 2020 farben. All rights reserved.
//

#import "NSObject+Swizzle.h"

@implementation NSObject (Swizzle)
-(void)hs_SwizzleMethodClass:(Class)class  from:(SEL)originalSelector to:(SEL)swizzledSelector
{
    // the method might not exist in the class, but in its superclass
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    // class_addMethod will fail if original method already exists
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    // the method doesn’t exist and we just added one
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
}
@end
