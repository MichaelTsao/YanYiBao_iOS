//
//  ShowGalleryData.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-9-28.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "ShowGalleryData.h"
#import "JSONKit.h"

@interface ShowGalleryData()

@property (nonatomic, strong)NSMutableArray *data;

@end

@implementation ShowGalleryData
@synthesize data = _data;

-(id)init
{
    self = [super init];
    if (self) {
        _data = nil;
    }
    return self;
}

-(void)decodeObjectWithShowGalleryData:(NSData *)data
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

-(NSInteger)galleryCount
{
    return [_data count];
}

-(NSString *)galleryUrl:(NSInteger)index
{
    NSMutableDictionary *data = [_data objectAtIndex:index];
    return [data objectForKey:@"url"];
}

-(NSNumber *)galleryWidth:(NSInteger)index
{
    NSMutableDictionary *data = [_data objectAtIndex:index];
    return [data objectForKey:@"width"];
}

-(NSNumber *)galleryHeight:(NSInteger)index
{
    NSMutableDictionary *data = [_data objectAtIndex:index];
    return [data objectForKey:@"height"];
}

@end
