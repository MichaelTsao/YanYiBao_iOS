//
//  ShowSearchData.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-9-28.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "ShowSearchData.h"
#import "JSONKit.h"

@interface ShowSearchData()

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation ShowSearchData
@synthesize data = _data;

-(id)init
{
    self = [super init];
    if(self){
        _data = nil;
        
    }
    return  self;
}

-(void)decodeObjectWithShowSearchData:(NSData *)data
{
    JSONDecoder *decoder = [[JSONDecoder alloc]init];
    NSDictionary *dic = [decoder objectWithData:data];
    NSArray *array = [dic objectForKey:@"data"];
    NSLog(@"arr == %@",array);
    if(_data)
    {
        _data = nil;
    }
    _data = [NSMutableArray arrayWithArray:array];
}

-(NSInteger)searchCount
{
    return [_data count];
}

-(NSInteger)showSearchId:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    NSString *searchId = [dict objectForKey:@"id"];
    return [searchId integerValue];
}

-(NSString *)showSearchName:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    return [dict objectForKey:@"name"];
}

-(NSString *)showSearchTime:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    return [dict objectForKey:@"time"];
}

-(NSString *)showSearchPlace:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    return [dict objectForKey:@"place"];
}

-(NSString *)showSearchRate:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    return [dict objectForKey:@"rate"];
}

-(NSString *)showSearchPicture:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    return [dict objectForKey:@"picture"];
}
@end
