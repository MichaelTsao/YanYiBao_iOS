//
//  ShowListData.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-9-28.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "ShowListData.h"
#import "JSONKit.h"

@interface ShowListData()

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation ShowListData
@synthesize data = _data;

-(id)init
{
    self = [super init];
    if(self){
        _data = nil;
        
    }
    return  self;
}

-(void)decodeObjectWithShowListData:(NSData *)data
{
    JSONDecoder *decoder = [[JSONDecoder alloc]init];
    NSDictionary *dic = [decoder objectWithData:data];
    NSArray *array = [dic objectForKey:@"data"];
    
    NSLog(@"dic = %@",array);
    if(_data)
    {
        _data = nil;
    }
    _data = [NSMutableArray arrayWithArray:array];
}

-(NSInteger)listCount
{
    return [_data count];
}

-(NSInteger)showListId:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    NSString *listId = [dict objectForKey:@"id"];
    return [listId integerValue];
}

-(NSString *)showListName:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    return [dict objectForKey:@"name"];
}

-(NSString *)showListTime:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    return [dict objectForKey:@"time"];
}

-(NSString *)showListPlace:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    return [dict objectForKey:@"place"];
}

-(NSString *)showListRate:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    return [dict objectForKey:@"rate"];
}

-(NSString *)showListPicture:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    return [dict objectForKey:@"picture"];
}

@end
