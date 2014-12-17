//
//  UserInfoData.h
//  YanYiBao
//
//  Created by 郭 旭 on 14-9-9.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShowListData.h"
#import "ShowSearchData.h"
#import "ShowInfoData.h"
#import "ShowProgramData.h"
#import "ShowGalleryData.h"
#import "ShowStarListData.h"
#import "ShowStarInfo.h"
#import "ShowGetRatesData.h"

@interface UserInfoData : NSObject

@property (nonatomic, strong) ShowListData *showListData;
@property (nonatomic, strong) ShowSearchData *showSearchData;
@property (nonatomic, strong) ShowInfoData *showInfoData;
@property (nonatomic, strong) ShowProgramData *showProgramData;
@property (nonatomic, strong) ShowGalleryData *showGalleryData;
@property (nonatomic, strong) ShowStarListData *showStarListData;
@property (nonatomic, strong) ShowStarInfo *showStarInfo;
@property (nonatomic, strong) ShowGetRatesData *showGetRatesData;

-(void)decodeObjectShowListData:(NSData *)data;
-(void)decodeObjectShowSearchData:(NSData *)data;
-(void)decodeObjectShowInfoData:(NSData *)data;
-(void)decodeObjectShowProgramData:(NSData *)data;
-(void)decodeObjectShowGalleryData:(NSData *)data;
-(void)decodeobjectShowStarListData:(NSData *)data;
-(void)decodeobjectShowStarInfo:(NSData *)data;
-(void)decodeobjectShowGetRatesData:(NSData *)data;

+(UserInfoData *)shareInstance;

+(void)showLoading:(NSString *)info;

+(void)hideLoading;

+(void)alterShow:(NSString *)info;

@end
