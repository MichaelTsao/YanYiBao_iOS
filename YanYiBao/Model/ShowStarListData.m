//
//  ShowStarListData.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-9-28.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "ShowStarListData.h"
#import "JSONKit.h"

@interface ShowStarListData ()

@property (nonatomic, strong)NSMutableArray *data;

@end

@implementation ShowStarListData
@synthesize data = _data;

-(id)init
{
    self = [super init];
    if (self) {
        _data = nil;
    }
    return self;
}

-(void)decodeObjectWithShowStarListData:(NSData *)data
{
    JSONDecoder *decoder = [[JSONDecoder alloc]init];
    NSDictionary *dic = [decoder objectWithData:data];
    NSLog(@"dic = %@",dic);
    NSArray *array = [dic objectForKey:@"data"];
    if(_data)
    {
        _data = nil;
    }
    _data = [NSMutableArray arrayWithArray:array];
}

-(NSInteger)showStarListCount
{
    return [_data count];
}

-(NSInteger)showStarId:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    NSString *starListId = [dict objectForKey:@"id"];
    return [starListId integerValue];
}

-(NSString *)showStarName:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    return [dict objectForKey:@"name"];
}

-(NSString *)showStarPortrait:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    return [dict objectForKey:@"portrait"];
}


@end
