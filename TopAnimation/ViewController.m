//
//  ViewController.m
//  TopAnimation
//
//  Created by yanguo sun on 2022/6/13.
//

#import "ViewController.h"
#import "TopAnimationView.h"

@interface ViewController ()<CAAnimationDelegate>
@property (nonatomic, strong) TopAnimationView *tView;
@property (nonatomic, strong) UIImageView *firstImageView;
@property (nonatomic, strong) UIImageView *secondImageView;
@property (nonatomic, strong) UIImageView *thirdImageView;
@property (nonatomic, strong) UIImageView *aview;
@property (nonatomic, strong) UIImageView *bview;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, assign) int index;
@property (nonatomic, assign) BOOL bigAnimation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0xf7/(CGFloat)0xff green:0xf7/(CGFloat)0xff blue:0xf7/(CGFloat)0xff alpha:1];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
    self.imageArray = @[@"头部GIF-1", @"头部GIF-2", @"头部GIF-3", @"头部GIF-4"];
    self.bview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.width)];
    [self.view addSubview:_bview];
    self.bview.backgroundColor = UIColor.systemTealColor;
    self.bview.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    self.aview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.width)];
    [self.view addSubview:_aview];
    self.bigAnimation = YES;
}

- (void)beginAnimationWithImageArray:(NSArray *)arr {
    if (self.bigAnimation) {
        self.index++;
        if (self.index == arr.count) {
            self.index = 0;
            NSLog(@"_index simalAnimation000:%@", @(_index));
        }
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
        [self.view bringSubviewToFront:self.aview];

    } else {
        [self.view bringSubviewToFront:self.bview];
        self.index++;
        if (self.index == arr.count) {
            self.index = 0;
            NSLog(@"_index simalAnimation000:%@", @(_index));
        }
        if (_index + 1 == arr.count) {
            _aview.image = [UIImage imageNamed:arr[0]];
            NSLog(@"_bview.image:%@", arr[0]);
        } else {
            _aview.image = [UIImage imageNamed:arr[_index + 1]];
            NSLog(@"_bview.image:%@", arr[_index + 1]);
        }
        [self animationMaker1:self.bview big:NO];
        NSLog(@"_index simalAnimation:%@", @(_index));
    }
    self.bigAnimation = !self.bigAnimation;
}

- (void)animationMaker1:(UIView *)animView big:(BOOL)big {
    [animView.layer removeAllAnimations];
    CAKeyframeAnimation *bAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];


    NSArray *boundsValues = @[[NSValue valueWithCGAffineTransform:CGAffineTransformIdentity],
                              [NSValue valueWithCGAffineTransform:CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1)]];
    if (big) {
        boundsValues = @[[NSValue valueWithCGAffineTransform:CGAffineTransformIdentity],
          [NSValue valueWithCGAffineTransform:CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1)]];
    } else {
        boundsValues = @[[NSValue valueWithCGAffineTransform:CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1)],
          [NSValue valueWithCGAffineTransform:CGAffineTransformIdentity]
        ];
    }

    bAnimation.values = boundsValues;
    bAnimation.keyTimes = @[@0, @1.0];
    bAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    bAnimation.duration = 5;
    bAnimation.fillMode = kCAFillModeRemoved;
    bAnimation.removedOnCompletion = NO;
    bAnimation.delegate = self;
    //    bAnimation.autoreverses = YES;
    //    bAnimation.repeatCount = FLT_MAX;

    CAKeyframeAnimation *oAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    oAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    oAnimation.values   = @[@1, @0];
    oAnimation.keyTimes = @[@0.8, @(1)];
    oAnimation.duration = 5;
    oAnimation.fillMode = kCAFillModeRemoved;
    oAnimation.removedOnCompletion = NO;
    //    oAnimation.autoreverses = YES;
    //    oAnimation.repeatCount = FLT_MAX;
    [animView.layer addAnimation:bAnimation forKey:@"transform.scale"];
    [animView.layer addAnimation:oAnimation forKey:@"opacity"];
}

- (void)animationDidStop:(CAKeyframeAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        [self beginAnimationWithImageArray:self.imageArray];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self beginAnimationWithImageArray:self.imageArray];
}
- (void)applicationWillEnterForeground {
    [self.tView viewDidAppear:YES];
}



@end
