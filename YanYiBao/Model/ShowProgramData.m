//
//  ShowProgramData.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-9-28.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "ShowProgramData.h"
#import "JSONKit.h"

@interface ShowProgramData()

@property (nonatomic, strong)NSMutableArray *data;

@end

@implementation ShowProgramData
@synthesize data = _data;

-(id)init
{
    self = [super init];
    if (self) {
        _data = nil;
    }
    return self;
}

-(void)decodeObjectWithShowProgramData:(NSData *)data
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

-(NSInteger)programCount
{
    return [_data count];
}

-(NSString *)programUrl:(NSInteger)index
{
    return [_data objectAtIndex:index];
}

@end
