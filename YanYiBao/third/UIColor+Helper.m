//
//  UIColor+Helper.m
//  WeddingPresent
//
//  Created by szht102 on 12-3-13.
//  Copyright (c) 2012年 star. All rights reserved.
//

#import "UIColor+Helper.h"

@implementation UIColor(UIColorHelper)

+ (UIColor *)colorWithRGBHex:(UInt32)hex withAlpha:(float)alpha
{
	int r = (hex >> 16) & 0xFF;
	int g = (hex >> 8) & 0xFF;
	int b = (hex) & 0xFF;
    
	return [UIColor colorWithRed:r / 255.0f
						   green:g / 255.0f
							blue:b / 255.0f
						   alpha:alpha];
}

// Returns a UIColor by scanning the string for a hex number and passing that to +[UIColor colorWithRGBHex:]
// Skips any leading whitespace and ignores any trailing characters
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert withAlpha:(float)alpha
{
    NSString *hexString = [stringToConvert stringByReplacingOccurrencesOfString:@"#" withString:@""];
	NSScanner *scanner = [NSScanner scannerWithString:hexString];
	unsigned hexNum;
	if (![scanner scanHexInt:&hexNum]) return nil;
	return [self colorWithRGBHex:hexNum withAlpha:alpha];
}

@end
