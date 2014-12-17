//
//  ShowStarInfo.h
//  YanYiBao
//
//  Created by 郭 旭 on 14-9-28.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import <Foundation/Foundation.h>

//演出明星信息 /show/starInfo/[id]
@interface ShowStarInfo : NSObject

-(void)decodeObjectWithShowStarInfo:(NSData *)data;

-(NSInteger)showStarInfoCount;
-(NSInteger)showStarInfoId:(NSInteger)index;
-(NSString *)showStarInfoName:(NSInteger)index;
-(NSString *)showStarInfoPortrait:(NSInteger)index;
-(NSArray *)showStarInfoPic:(NSInteger)index;

@end
