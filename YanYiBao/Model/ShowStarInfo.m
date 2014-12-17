//
//  ShowStarInfo.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-9-28.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "ShowStarInfo.h"
#import "JSONKit.h"

@interface ShowStarInfo ()

@property (nonatomic, strong)NSMutableDictionary *data;

@end

@implementation ShowStarInfo
@synthesize data = _data;

-(id)init
{
    self = [super init];
    if (self) {
        _data = nil;
    }
    return self;
}

-(void)decodeObjectWithShowStarInfo:(NSData *)data
{
    JSONDecoder *decoder = [[JSONDecoder alloc]init];
    NSDictionary *dic = [decoder objectWithData:data];
    NSDictionary *array = [dic objectForKey:@"data"];
    NSLog(@"arr == %@",array);
    if(_data)
    {
        _data = nil;
    }
    _data = [NSMutableDictionary dictionaryWithDictionary:array];
}

-(NSInteger)showStarInfoCount
{
    return [_data count];
}

-(NSInteger)showStarInfoId:(NSInteger)index
{
    NSString *starInfoId = [_data objectForKey:@"id"];
    return [starInfoId integerValue];
}
-(NSString *)showStarInfoName:(NSInteger)index
{
    return [_data objectForKey:@"name"];
}
-(NSString *)showStarInfoPortrait:(NSInteger)index
{
    return [_data objectForKey:@"portrait"];
}
-(NSArray *)showStarInfoPic:(NSInteger)index
{
    NSArray *picData =  [_data objectForKey:@"pic"];
    return picData;
}

@end
