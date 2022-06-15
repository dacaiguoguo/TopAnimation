//
//  TopAnimationView.m
//  TopAnimation
//
//  Created by yanguo sun on 2022/6/13.
//

#import "TopAnimationView.h"

@implementation TopAnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.thirdImageView = [[UIImageView alloc] init];
        self.thirdImageView.contentMode = UIViewContentModeCenter;
        self.thirdImageView.alpha = 0;
        self.thirdImageView.frame = self.bounds;
        [self addSubview:_thirdImageView];
        self.secondImageView = [[UIImageView alloc] init];
        self.secondImageView.frame = self.bounds;
        self.secondImageView.alpha = 0;
        self.secondImageView.contentMode = UIViewContentModeCenter;
        // CGAffineTransform transform = CGAffineTransformIdentity;
        // self.secondImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
        [self addSubview:_secondImageView];
        self.firstImageView = [[UIImageView alloc] init];
        self.firstImageView.frame = self.bounds;
        self.firstImageView.contentMode = UIViewContentModeCenter;
        [self addSubview:_firstImageView];
        [self setClipsToBounds:YES];
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    self.firstImageView.image = [UIImage imageNamed:self.imageArray[0]];
    self.secondImageView.image = [UIImage imageNamed:self.imageArray[1]];
    self.thirdImageView.image = [UIImage imageNamed:self.imageArray[2]];
    [self runAnimateKeyframes];
}

- (void)runAnimateKeyframes {

    /**
     *  relativeDuration  动画在什么时候开始
     *  relativeStartTime 动画所持续的时间
     */

    [UIView animateKeyframesWithDuration:6
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear
                              animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0   // 相对于6秒所开始的时间（第0秒开始动画）
                                relativeDuration:1/3.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor redColor];
            self.firstImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.firstImageView.transform = CGAffineTransformScale(transform, 1.4, 1.4);
            self.secondImageView.alpha = 1;
            self.secondImageView.transform = CGAffineTransformScale(transform, 0.8, 0.8);
            // 恢复上一步透明度变成0的view对变形，
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1, 1);
        }];

        [UIView addKeyframeWithRelativeStartTime:1/3.0 // 相对于6秒所开始的时间（第2秒开始动画）
                                relativeDuration:1/3.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor yellowColor];
            self.secondImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.secondImageView.transform = CGAffineTransformScale(transform, 0.8, 0.8);

            self.thirdImageView.alpha = 1;
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            // 恢复上一步透明度变成0的view对变形，
            self.firstImageView.transform = CGAffineTransformScale(transform, 1, 1);
        }];
        [UIView addKeyframeWithRelativeStartTime:2/3.0 // 相对于6秒所开始的时间（第4秒开始动画）
                                relativeDuration:1/3.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor greenColor];
            self.thirdImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1.4, 1.4);
            self.firstImageView.alpha = 1;
            self.firstImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            // 恢复上一步透明度变成0的view对变形，
            self.secondImageView.transform = CGAffineTransformScale(transform, 1, 1);
        }];

    }
                              completion:^(BOOL finished) {
        [self runAnimateKeyframes];
    }];
}
@end
