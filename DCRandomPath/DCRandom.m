//
//  DCRandom.m
//  DCRandomPath
//
//  Created by chy on 2017/4/7.
//  Copyright © 2017年 Chy. All rights reserved.
//

#import "DCRandom.h"
#import <UIKit/UIKit.h>

@implementation DCRandom

- (BOOL)randomBool
{
    return arc4random() % 2;
}

- (float)randomHeightFloat
{
    NSInteger height = kScreenHeight;
    return arc4random() % height;
}

- (float)randomWidhtFloat
{
    NSInteger width = kScreenWidth;
    return arc4random() % width;
}

- (float)randomRaduisWithMax:(NSInteger)max min:(NSInteger)min
{
    NSInteger length = arc4random() % max;
    if (length > min) {
        return length;
    } else {
        return min;
    }
}

@end
