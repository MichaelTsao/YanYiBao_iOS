//
//  ShowGetRatesData.h
//  YanYiBao
//
//  Created by 郭 旭 on 14-9-28.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import <Foundation/Foundation.h>

//获取评价 /show/getRates/[id]
@interface ShowGetRatesData : NSObject

-(void)decodeObjectWithShowGetRatesData:(NSData *)data;

-(NSInteger)showGetRatesCount;
-(NSInteger)showGetRatesId:(NSInteger)index;
-(NSString *)showGetRatesAvatar:(NSInteger)index;
-(NSString *)showGetRatesName:(NSInteger)index;
-(float)showGetRatesRate:(NSInteger)index;
-(NSString *)showGetRatesTime:(NSInteger)index;
-(NSString *)showGetRatesWords:(NSInteger)index;

@end
