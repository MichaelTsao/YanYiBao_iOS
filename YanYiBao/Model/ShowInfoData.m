//
//  ShowInfoData.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-9-28.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "ShowInfoData.h"
#import "JSONKit.h"

@interface ShowInfoData ()

@property (nonatomic, strong)NSMutableDictionary *data;

@end

@implementation ShowInfoData
@synthesize data = _data;

-(id)init
{
    self = [super init];
    if (self) {
        _data = nil;
    }
    return self;
}

-(void)decodeObjectWithShowInfoData:(NSData *)data
{
    JSONDecoder *decoder = [[JSONDecoder alloc]init];
    NSDictionary *dic = [decoder objectWithData:data];
    NSDictionary *array = [dic objectForKey:@"data"];
    
    NSLog(@"dic = %@",array);
    if(_data)
    {
        _data = nil;
    }
    _data = [NSMutableDictionary dictionaryWithDictionary:array];
}

-(NSInteger)infoCount
{
    return [_data count];
}

-(NSInteger)showInfoId
{
    NSString *infoId = [_data objectForKey:@"id"];
    return [infoId integerValue];
}

-(NSString *)showInfoName
{
    return [_data objectForKey:@"name"];
}

-(NSString *)showInfoTime
{
    return [_data objectForKey:@"time"];
}

-(NSString *)showInfoRate
{
    return [_data objectForKey:@"rate"];
}

-(NSString *)showInfoPlace
{
    return [_data objectForKey:@"place"];
}

-(NSString *)showInfoPicture
{
    return [_data objectForKey:@"picture"];
}

-(NSString *)showInfoRateMan
{
    return [_data objectForKey:@"rate_men"];
}

-(NSString *)showInfoType
{
    return [_data objectForKey:@"type"];
}

-(NSString *)showInfoPrice
{
    return [_data objectForKey:@"price"];
}

-(NSString *)showInfoBackground
{
    return [_data objectForKey:@"background"];
}

-(NSString *)showInfoGuideUrl
{
    return [_data objectForKey:@"guide_url"];
}

-(NSString *)showInfoBuyUrl
{
    return [_data objectForKey:@"buy_url"];
}

@end
