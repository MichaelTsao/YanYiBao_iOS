//
//  ShowStarListData.h
//  YanYiBao
//
//  Created by 郭 旭 on 14-9-28.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import <Foundation/Foundation.h>

//演出明星列表 /show/star/[id]
@interface ShowStarListData : NSObject

-(void)decodeObjectWithShowStarListData:(NSData *)data;

-(NSInteger)showStarListCount;
-(NSInteger)showStarId:(NSInteger)index;
-(NSString *)showStarName:(NSInteger)index;
-(NSString *)showStarPortrait:(NSInteger)index;

@end
