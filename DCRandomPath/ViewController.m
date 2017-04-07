//
//  ViewController.m
//  DCRandomPath
//
//  Created by chy on 2017/4/7.
//  Copyright © 2017年 Chy. All rights reserved.
//

#import "ViewController.h"
#import "DCRandomPath.h"

@interface ViewController () <CAAnimationDelegate>

@property (nonatomic, strong) UIView                *redView;
@property (nonatomic, strong) DCRandomPath          *randomPath;
@property (nonatomic, assign) CGPoint               start;
@property (nonatomic, assign) CGPoint               end;

@end

@implementation ViewController

- (DCRandomPath *)randomPath
{
    if (_randomPath == nil) {
        _randomPath = [[DCRandomPath alloc] initWithModelSize:CGSizeMake(20, 40)];
    }
    return _randomPath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self stupeAnimate];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)stupeAnimate
{
    UIView *redview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 40)];
    redview.backgroundColor = [UIColor redColor];
    _redView = redview;
    [self.view addSubview:redview];
    CGPoint start = [self.randomPath getStartPoint];
    
    CGPoint end = [self.randomPath getScreenPoint];
    redview.center = start;
    [self.view addSubview:redview];
    
    CAKeyframeAnimation *animation = [self animation:start end:end];
    
    [redview.layer addAnimation:animation forKey:@"position"];
    self.start = end;
}

- (CAKeyframeAnimation *)animation:(CGPoint)start end:(CGPoint)end
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path=[self.randomPath arcPath:start end:end];
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.autoreverses=NO;
    animation.duration=1;
    animation.repeatCount=1;
    animation.delegate = self;
    
    return animation;
}

// MARK: --- animation delegate ---

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag == YES) {
        self.end = [self.randomPath getScreenPoint];
        CAKeyframeAnimation *animation = [self animation:self.redView.center end:self.end];
        [self.redView.layer addAnimation:animation forKey:@"position"];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"layer bounds : %f %f", [[self.redView.layer presentationLayer] bounds].origin.x,[[self.redView.layer presentationLayer] bounds].origin.y);
    NSLog(@"fram : %f, %f", self.redView.layer.frame.origin.x, self.redView.layer.frame.origin.y);
}

@end
