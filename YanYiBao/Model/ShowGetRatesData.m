//
//  ShowGetRatesData.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-9-28.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "ShowGetRatesData.h"
#import "JSONKit.h"

@interface ShowGetRatesData ()

@property (nonatomic, strong)NSMutableArray *data;

@end

@implementation ShowGetRatesData
@synthesize data = _data;

-(id)init
{
    self = [super init];
    if (self) {
        _data = nil;
    }
    return self;
}

-(void)decodeObjectWithShowGetRatesData:(NSData *)data
{
    JSONDecoder *decoder = [[JSONDecoder alloc]init];
    NSDictionary *dic = [decoder objectWithData:data];
    NSArray *array = [dic objectForKey:@"data"];
    if(_data)
    {
        _data = nil;
    }
    _data = [NSMutableArray arrayWithArray:array];
}

-(NSInteger)showGetRatesCount
{
    return [_data count];
}

-(NSInteger)showGetRatesId:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    NSString *getRatesId = [dict objectForKey:@"id"];
    return [getRatesId integerValue];
}

-(NSString *)showGetRatesAvatar:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    return [dict objectForKey:@"avatar"];
}

-(NSString *)showGetRatesName:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    return [dict objectForKey:@"name"];
}

-(float)showGetRatesRate:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    NSString *getRatesId = [dict objectForKey:@"rate"];
    return [getRatesId floatValue];
}

-(NSString *)showGetRatesTime:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    return [dict objectForKey:@"time"];
}

-(NSString *)showGetRatesWords:(NSInteger)index
{
    NSDictionary *dict = [_data objectAtIndex:index];
    return [dict objectForKey:@"words"];
}


@end
