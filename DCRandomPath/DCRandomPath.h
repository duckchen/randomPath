//
//  DCRandomPath.h
//  DCRandomPath
//
//  Created by chy on 2017/4/7.
//  Copyright © 2017年 Chy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCRandomPath : NSObject

- (instancetype)initWithModelSize:(CGSize)size;

- (CGPoint)getStartPoint;
- (CGPoint)getScreenPoint;
- (CGMutablePathRef)straitPath:(CGPoint)start end:(CGPoint)end;
- (CGMutablePathRef)arcPath:(CGPoint)start end:(CGPoint)end;

@end
