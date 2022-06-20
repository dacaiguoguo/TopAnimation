//
//  ViewController.m
//  TopAnimation
//
//  Created by yanguo sun on 2022/6/13.
//

#import "ViewController.h"
#import "TopAnimationView.h"

@interface ViewController ()
@property (nonatomic, strong) TopAnimationView *tView;
@property (nonatomic, strong) UIImageView *firstImageView;
@property (nonatomic, strong) UIImageView *secondImageView;
@property (nonatomic, strong) UIImageView *thirdImageView;
@property (nonatomic, strong) UIView* aview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0xf7/(CGFloat)0xff green:0xf7/(CGFloat)0xff blue:0xf7/(CGFloat)0xff alpha:1];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
    self.aview = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:_aview];
    self.aview.backgroundColor = UIColor.systemPinkColor;
    CAKeyframeAnimation *bAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    NSArray *boundsValues = @[[NSValue valueWithCATransform3D:CATransform3DScale(_aview.layer.transform, 1, 1, 1)],
                              [NSValue valueWithCATransform3D:CATransform3DScale(_aview.layer.transform, 1.2, 1.2, 1)]];
    
    [bAnimation setValues:boundsValues];
    [bAnimation setKeyTimes:@[@1.0]];
    [bAnimation setTimingFunctions:@[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]]];
    bAnimation.duration = 5;
    bAnimation.fillMode = kCAFillModeRemoved;
    bAnimation.removedOnCompletion = NO;
    bAnimation.autoreverses = YES;
    bAnimation.repeatCount = FLT_MAX;

    CAKeyframeAnimation *oAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    [oAnimation setTimingFunctions:@[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]]];
    oAnimation.values   = @[@1, @0];
    oAnimation.keyTimes = @[@0.8, @(1)];
    oAnimation.duration = 5;
    oAnimation.fillMode = kCAFillModeRemoved;
    oAnimation.removedOnCompletion = NO;
    oAnimation.autoreverses = YES;
    oAnimation.repeatCount = FLT_MAX;
    [self.aview.layer addAnimation:bAnimation forKey:@"transform"];
    [self.aview.layer addAnimation:oAnimation forKey:@"opacity"];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)applicationWillEnterForeground {
    [self.tView viewDidAppear:YES];
}



@end
