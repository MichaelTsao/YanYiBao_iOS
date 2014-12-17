//
//  ShowSearchData.h
//  YanYiBao
//
//  Created by 郭 旭 on 14-9-28.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import <Foundation/Foundation.h>

//演出搜索 /show/search/[words]
@interface ShowSearchData : NSObject

-(void)decodeObjectWithShowSearchData:(NSData *)data;

-(NSInteger)searchCount;
-(NSInteger)showSearchId:(NSInteger)index;
-(NSString *)showSearchName:(NSInteger)index;
-(NSString *)showSearchTime:(NSInteger)index;
-(NSString *)showSearchPlace:(NSInteger)index;
-(NSString *)showSearchRate:(NSInteger)index;
-(NSString *)showSearchPicture:(NSInteger)index;

@end
