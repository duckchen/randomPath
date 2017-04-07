//
//  DCRandomPath.m
//  DCRandomPath
//
//  Created by chy on 2017/4/7.
//  Copyright © 2017年 Chy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCRandomPath.h"
#import "DCRandom.h"

@interface DCRandomPath ()

@property (nonatomic, strong) DCRandom      *random;
@property (nonatomic, assign) CGSize        modelSize;
@property (nonatomic, assign) CGPoint       currentPoint;

@end

@implementation DCRandomPath

- (DCRandom *)random
{
    if (_random == nil) {
        _random = [[DCRandom alloc] init];
    }
    return _random;
}

- (instancetype)initWithModelSize:(CGSize)size
{
    self = [super init];
    if (self) {
        _modelSize = size;
    }
    return self;
}

- (CGPoint)getStartPoint
{
    CGFloat x = 0;
    if ([self.random randomBool]) {
        x = self.modelSize.width/2 + kScreenWidth;
    } else {
        x = -self.modelSize.width/2;
    }
    CGFloat y = [self.random randomHeightFloat];
    
    return CGPointMake(x, y);
}

- (CGPoint)getScreenPoint
{
    CGFloat x = [self.random randomWidhtFloat];
    CGFloat y = [self.random randomHeightFloat];
    return CGPointMake(x, y);
}

- (CGMutablePathRef)straitPath:(CGPoint)start end:(CGPoint)end
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, start.x, start.y);
    CGPathAddLineToPoint(path, NULL, end.x, end.y);
    return path;
}

- (CGMutablePathRef)arcPath:(CGPoint)start end:(CGPoint)end
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, start.x, start.y);
    NSInteger distance = [self distance:start end:end];
    CGFloat radius = [self.random randomRaduisWithMax:distance min:1];
    CGPoint point = [self getScreenPoint];
    CGPathAddArcToPoint(path, NULL, end.x, end.y, point.x, point.y, radius);
    
    return path;
}

- (CGMutablePathRef)bezirPath:(CGPoint)start end:(CGPoint)end
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, start.x, start.y);
    CGPoint point = [self getScreenPoint];
    CGPathAddQuadCurveToPoint(path, NULL, point.x, point.y, end.x, end.y);
    return path;
}

- (NSInteger)distance:(CGPoint)start end:(CGPoint)end
{
    CGFloat mineX = start.x - end.x;
    CGFloat mineY = start.y - end.y;
    CGFloat distance = sqrtf(mineX * mineX + mineY * mineY);
    return (NSInteger)ceilf(distance);
}

@end
