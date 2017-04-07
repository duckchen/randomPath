//
//  DCRandom.h
//  DCRandomPath
//
//  Created by chy on 2017/4/7.
//  Copyright © 2017年 Chy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCRandom : NSObject

- (BOOL)randomBool;

- (float)randomWidhtFloat;
- (float)randomHeightFloat;
- (float)randomRaduisWithMax:(NSInteger)max min:(NSInteger)min;

@end
