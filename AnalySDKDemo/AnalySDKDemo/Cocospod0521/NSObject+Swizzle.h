//
//  NSObject+Swizzle.h
//  AnalySDKDemo
//
//  Created by farben on 2020/5/25.
//  Copyright © 2020 farben. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Swizzle)
-(void)hs_SwizzleMethodClass:(Class)class  from:(SEL)originalSelector to:(SEL)swizzledSelector;
@end

NS_ASSUME_NONNULL_END
