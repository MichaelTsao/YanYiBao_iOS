//
//  ShowListData.h
//  YanYiBao
//
//  Created by 郭 旭 on 14-9-28.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import <Foundation/Foundation.h>

//演出列表 /show/list
@interface ShowListData : NSObject

-(void)decodeObjectWithShowListData:(NSData *)data;

-(NSInteger)listCount;
-(NSInteger)showListId:(NSInteger)index;
-(NSString *)showListName:(NSInteger)index;
-(NSString *)showListTime:(NSInteger)index;
-(NSString *)showListPlace:(NSInteger)index;
-(NSString *)showListRate:(NSInteger)index;
-(NSString *)showListPicture:(NSInteger)index;

@end
