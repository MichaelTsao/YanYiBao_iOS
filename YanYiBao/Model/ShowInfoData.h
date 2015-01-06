//
//  ShowInfoData.h
//  YanYiBao
//
//  Created by 郭 旭 on 14-9-28.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import <Foundation/Foundation.h>

//演出信息 /show/info/[id]
@interface ShowInfoData : NSObject

-(void)decodeObjectWithShowInfoData:(NSData *)data;

-(NSInteger)infoCount;
-(NSInteger)showInfoId;
-(NSString *)showInfoName;
-(NSString *)showInfoTime;
-(NSString *)showInfoRate;
-(NSString *)showInfoPicture;
-(NSString *)showInfoRateMan;
-(NSString *)showInfoType;
-(NSString *)showInfoPrice;
-(NSString *)showInfoPlace;
-(NSString *)showInfoBackground;
-(NSString *)showInfoGuideUrl;
-(NSString *)showInfoBuyUrl;

@property (nonatomic, strong)NSMutableDictionary *data;

@end
