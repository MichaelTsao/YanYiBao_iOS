//
//  UserInfoData.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-9-9.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "UserInfoData.h"

static UserInfoData *globalUserInfoData = nil;

@implementation UserInfoData

@synthesize showListData = _showListData;
@synthesize showSearchData = _showSearchData;
@synthesize showInfoData = _showInfoData;
@synthesize showProgramData = _showProgramData;
@synthesize showGalleryData = _showGalleryData;
@synthesize showStarListData = _showStarListData;
@synthesize showStarInfo = _showStarInfo;
@synthesize showGetRatesData = _showGetRatesData;

+(UserInfoData *)shareInstance{
    if (globalUserInfoData == nil) {
        globalUserInfoData = [[UserInfoData alloc] init];
    }
    return globalUserInfoData;
}

-(id)init{
    self = [super init];
    if (self) {
        _showListData = nil;
        _showSearchData = nil;
        _showInfoData = nil;
        _showProgramData = nil;
        _showGalleryData = nil;
        _showStarListData = nil;
        _showStarInfo = nil;
        _showGetRatesData = nil;
    }
    return self;
}

-(void)decodeObjectShowListData:(NSData *)data{
    self.showListData = [[ShowListData alloc] init];
    [self.showListData decodeObjectWithShowListData:data];
}

-(void)decodeObjectShowSearchData:(NSData *)data{
    self.showSearchData = [[ShowSearchData alloc] init];
    [self.showSearchData decodeObjectWithShowSearchData:data];
}

-(void)decodeObjectShowInfoData:(NSData *)data{
    self.showInfoData = [[ShowInfoData alloc] init];
    [self.showInfoData decodeObjectWithShowInfoData:data];
}

-(void)decodeObjectShowProgramData:(NSData *)data{
    self.showProgramData = [[ShowProgramData alloc] init];
    [self.showProgramData decodeObjectWithShowProgramData:data];
}

-(void)decodeObjectShowGalleryData:(NSData *)data{
    self.showGalleryData = [[ShowGalleryData alloc] init];
    [self.showGalleryData decodeObjectWithShowGalleryData:data];
}

-(void)decodeobjectShowStarListData:(NSData *)data{
    self.showStarListData = [[ShowStarListData alloc] init];
    [self.showStarListData decodeObjectWithShowStarListData:data];
}

-(void)decodeobjectShowStarInfo:(NSData *)data{
    self.showStarInfo = [[ShowStarInfo alloc] init];
    [self.showStarInfo decodeObjectWithShowStarInfo:data];
}

-(void)decodeobjectShowGetRatesData:(NSData *)data{
    self.showGetRatesData = [[ShowGetRatesData alloc] init];
    [self.showGetRatesData decodeObjectWithShowGetRatesData:data];
}

+(void)showLoading:(NSString *)info
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate showLoading:info];
}

+(void)hideLoading
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate hideLoading];
}

+(void)alterShow:(NSString *)info
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:info delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}


@end
