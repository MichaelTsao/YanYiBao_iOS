//
//  UIColor+Helper.h
//  WeddingPresent
//
//  Created by szht102 on 12-3-13.
//  Copyright (c) 2012年 star. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "NSString+Helper.h"
@interface UIColor(UIColorHelper)

//+ (UIColor *)colorWithRGBHex:(UInt32)hex;
//+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
+ (UIColor *)colorWithRGBHex:(UInt32)hex withAlpha:(float)alpha;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert withAlpha:(float)alpha;

@end
