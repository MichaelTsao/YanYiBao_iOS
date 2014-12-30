//
//  ShowProgramData.h
//  YanYiBao
//
//  Created by 郭 旭 on 14-9-28.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import <Foundation/Foundation.h>

//演出节目单 /show/program/[id]
@interface ShowProgramData : NSObject

-(void)decodeObjectWithShowProgramData:(NSData *)data;

-(NSInteger)programCount;
-(NSString *)programUrl:(NSInteger)index;
-(NSNumber *)programWidth:(NSInteger)index;
-(NSNumber *)programHeight:(NSInteger)index;

@end
