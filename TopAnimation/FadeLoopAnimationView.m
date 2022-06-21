//
//  FadeLoopAnimationView.m
//  TopAnimation
//
//  Created by yanguo sun on 2022/6/20.
//

#import "FadeLoopAnimationView.h"

@interface FadeLoopAnimationView ()<CAAnimationDelegate>
@property (nonatomic, strong) UIImageView *bview;
@property (nonatomic, strong) UIImageView *aview;
@property (nonatomic, assign) int index;
@property (nonatomic, assign) BOOL bigAnimation;
@end
@implementation FadeLoopAnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bview = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_bview];
        _bview.contentMode = UIViewContentModeCenter;
        self.bview.backgroundColor = UIColor.systemTealColor;
        self.bview.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        self.aview = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_aview];
        _aview.contentMode = UIViewContentModeCenter;
        self.bigAnimation = YES;
    }
    return self;
}

- (void)beginAnimation {
    NSArray *arr = self.imageArray;
    if (arr.count < 2) {
        _aview.image = [UIImage imageNamed:arr.firstObject];
        return;
    }
    self.imageArray = arr;
    if (self.bigAnimation) {
        [self bringSubviewToFront:self.aview];
        NSLog(@"_index bigAnimation:%@", @(_index));
        _aview.image = [UIImage imageNamed:arr[_index]];
        NSLog(@"_aview.image:%@", arr[_index]);
        if (_index + 1 == arr.count) {
            _bview.image = [UIImage imageNamed:arr[0]];
            NSLog(@"_bview.image:%@", arr[0]);
        } else {
            _bview.image = [UIImage imageNamed:arr[_index + 1]];
            NSLog(@"_bview.image:%@", arr[_index + 1]);
        }
        [self animationMaker1:self.aview big:YES];
        self.index++;
        if (self.index == arr.count) {
            self.index = 0;
            NSLog(@"_index simalAnimation000:%@", @(_index));
        }
    } else {
        [self bringSubviewToFront:self.bview];
        if (_index + 1 == arr.count) {
            _aview.image = [UIImage imageNamed:arr[0]];
            NSLog(@"_bview.image:%@", arr[0]);
        } else {
            _aview.image = [UIImage imageNamed:arr[_index + 1]];
            NSLog(@"_bview.image:%@", arr[_index + 1]);
        }
        [self animationMaker1:self.bview big:NO];
        _aview.layer.opacity = 1;
        _aview.layer.transform = CATransform3DMakeScale(1, 1, 1);
        NSLog(@"_index simalAnimation:%@", @(_index));
        self.index++;
        if (self.index == arr.count) {
            self.index = 0;
            NSLog(@"_index simalAnimation000:%@", @(_index));
        }
    }
    self.bigAnimation = !self.bigAnimation;
}

- (void)animationMaker1:(UIView *)animView big:(BOOL)big {
    [animView.layer removeAllAnimations];
    CAKeyframeAnimation *bAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    NSArray *boundsValues = @[@1,@1.1];
    if (big) {
        boundsValues =  @[@1,@1.1];
    } else {
        boundsValues =  @[@1.1,@1];
    }

    bAnimation.values = boundsValues;
    bAnimation.keyTimes = @[@0, @1.0];
    bAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    bAnimation.duration = 5;
    bAnimation.fillMode = kCAFillModeRemoved;
    bAnimation.removedOnCompletion = YES;
    bAnimation.delegate = self;

    CAKeyframeAnimation *oAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    oAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    oAnimation.values   = @[@1, @0];
    oAnimation.keyTimes = @[@0.8, @(1)];
    oAnimation.duration = 5;
    oAnimation.fillMode = kCAFillModeRemoved;
    oAnimation.removedOnCompletion = YES;
    [animView.layer addAnimation:bAnimation forKey:@"transform.scale"];
    [animView.layer addAnimation:oAnimation forKey:@"opacity"];
}

- (void)animationDidStop:(CAKeyframeAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        [self beginAnimation];
    }
}
@end
