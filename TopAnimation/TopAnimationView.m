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
        self.fourImageView = [[UIImageView alloc] init];
        self.fourImageView.contentMode = UIViewContentModeCenter;
        self.fourImageView.alpha = 0;
        self.fourImageView.frame = self.bounds;
        [self addSubview:_fourImageView];
        CGAffineTransform transform = CGAffineTransformIdentity;
        self.fourImageView.transform = CGAffineTransformScale(transform, 1.4, 1.4);

        self.thirdImageView = [[UIImageView alloc] init];
        self.thirdImageView.contentMode = UIViewContentModeCenter;
        self.thirdImageView.alpha = 0;
        self.thirdImageView.frame = self.bounds;
        [self addSubview:_thirdImageView];
        self.secondImageView = [[UIImageView alloc] init];
        self.secondImageView.frame = self.bounds;
        self.secondImageView.alpha = 0;
        self.secondImageView.contentMode = UIViewContentModeCenter;
        self.secondImageView.transform = CGAffineTransformScale(transform, 1.4, 1.4);
        [self addSubview:_secondImageView];
        self.firstImageView = [[UIImageView alloc] init];
        self.firstImageView.frame = self.bounds;
        self.firstImageView.contentMode = UIViewContentModeCenter;
        [self addSubview:_firstImageView];
        [self setClipsToBounds:YES];

//        self.bgView = [[UIView alloc] initWithFrame:];
//        [self addSubview:_bgView];
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        [self addSubview:effectView];
        effectView.frame = CGRectMake((frame.size.width - 300) / 2, 280, 300, 40);
        UILabel *searchLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
        [effectView.contentView addSubview:searchLabel];
        searchLabel.textColor = UIColor.whiteColor;
        searchLabel.text = @"请输入景点/酒店民宿等";
        searchLabel.textAlignment = NSTextAlignmentCenter;
        searchLabel.font = [UIFont systemFontOfSize:14];
//        _bgView.backgroundColor  = UIColor.systemPinkColor;
        effectView.layer.cornerRadius = 20;
        effectView.layer.masksToBounds = YES;

    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    self.firstImageView.image = [UIImage imageNamed:self.imageArray[0]];
    self.secondImageView.image = [UIImage imageNamed:self.imageArray[1]];
    self.thirdImageView.image = [UIImage imageNamed:self.imageArray[2]];
    self.fourImageView.image = [UIImage imageNamed:self.imageArray[3]];
    [self runAnimateKeyframes];
}

- (void)runAnimateKeyframes {

    /**
     *  relativeDuration  动画在什么时候开始
     *  relativeStartTime 动画所持续的时间
     */

    [UIView animateKeyframesWithDuration:48
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeCubic
                              animations:^{
        // 111
        [UIView addKeyframeWithRelativeStartTime:0.0   // 相对于6秒所开始的时间（第0秒开始动画）
                                relativeDuration:1/12.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor redColor];
            self.firstImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.firstImageView.transform = CGAffineTransformScale(transform, 1.4, 1.4);
            self.secondImageView.alpha = 1;
            self.secondImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            // 恢复上一步透明度变成0的view对变形，
            self.fourImageView.transform = CGAffineTransformScale(transform, 1.4, 1.4);
        }];
        // 222
        [UIView addKeyframeWithRelativeStartTime:1/12.0 // 相对于6秒所开始的时间（第2秒开始动画）
                                relativeDuration:1/12.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor yellowColor];
            self.secondImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.secondImageView.transform = CGAffineTransformScale(transform, 1, 1);

            self.thirdImageView.alpha = 1;
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            // 恢复上一步透明度变成0的view对变形，
            self.firstImageView.transform = CGAffineTransformScale(transform, 1, 1);
        }];
        // 333
        [UIView addKeyframeWithRelativeStartTime:2/12.0 // 相对于6秒所开始的时间（第4秒开始动画）
                                relativeDuration:1/12.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor greenColor];
            self.thirdImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1.4, 1.4);
            self.fourImageView.alpha = 1;
            self.fourImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            // 恢复上一步透明度变成0的view对变形，
            self.secondImageView.transform = CGAffineTransformScale(transform, 1.4, 1.4);
        }];
        // 444
        [UIView addKeyframeWithRelativeStartTime:3/12.0 // 相对于6秒所开始的时间（第4秒开始动画）
                                relativeDuration:1/12.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor greenColor];
            self.fourImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.fourImageView.transform = CGAffineTransformScale(transform, 1, 1);
            self.firstImageView.alpha = 1;
            self.firstImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            // 恢复上一步透明度变成0的view对变形，
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1, 1);
        }];
        // 111
        [UIView addKeyframeWithRelativeStartTime:4/12.0  // 相对于6秒所开始的时间（第0秒开始动画）
                                relativeDuration:1/12.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor redColor];
            self.firstImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.firstImageView.transform = CGAffineTransformScale(transform, 1.4, 1.4);
            self.secondImageView.alpha = 1;
            self.secondImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            // 恢复上一步透明度变成0的view对变形，
            self.fourImageView.transform = CGAffineTransformScale(transform, 1.4, 1.4);
        }];
        // 222
        [UIView addKeyframeWithRelativeStartTime:5/12.0 // 相对于6秒所开始的时间（第2秒开始动画）
                                relativeDuration:1/12.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor yellowColor];
            self.secondImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.secondImageView.transform = CGAffineTransformScale(transform, 1, 1);

            self.thirdImageView.alpha = 1;
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            // 恢复上一步透明度变成0的view对变形，
            self.firstImageView.transform = CGAffineTransformScale(transform, 1, 1);
        }];
        // 333
        [UIView addKeyframeWithRelativeStartTime:6/12.0 // 相对于6秒所开始的时间（第4秒开始动画）
                                relativeDuration:1/12.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor greenColor];
            self.thirdImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1.4, 1.4);
            self.fourImageView.alpha = 1;
            self.fourImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            // 恢复上一步透明度变成0的view对变形，
            self.secondImageView.transform = CGAffineTransformScale(transform, 1.4, 1.4);
        }];
        // 444
        [UIView addKeyframeWithRelativeStartTime:7/12.0 // 相对于6秒所开始的时间（第4秒开始动画）
                                relativeDuration:1/12.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor greenColor];
            self.fourImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.fourImageView.transform = CGAffineTransformScale(transform, 1, 1);
            self.firstImageView.alpha = 1;
            self.firstImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            // 恢复上一步透明度变成0的view对变形，
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1, 1);
        }];
        // 111
        [UIView addKeyframeWithRelativeStartTime:8/12.0   // 相对于6秒所开始的时间（第0秒开始动画）
                                relativeDuration:1/12.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor redColor];
            self.firstImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.firstImageView.transform = CGAffineTransformScale(transform, 1.4, 1.4);
            self.secondImageView.alpha = 1;
            self.secondImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            // 恢复上一步透明度变成0的view对变形，
            self.fourImageView.transform = CGAffineTransformScale(transform, 1.4, 1.4);
        }];
        // 222
        [UIView addKeyframeWithRelativeStartTime:9/12.0 // 相对于6秒所开始的时间（第2秒开始动画）
                                relativeDuration:1/12.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor yellowColor];
            self.secondImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.secondImageView.transform = CGAffineTransformScale(transform, 1, 1);

            self.thirdImageView.alpha = 1;
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            // 恢复上一步透明度变成0的view对变形，
            self.firstImageView.transform = CGAffineTransformScale(transform, 1, 1);
        }];
        // 333
        [UIView addKeyframeWithRelativeStartTime:10/12.0 // 相对于6秒所开始的时间（第4秒开始动画）
                                relativeDuration:1/12.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor greenColor];
            self.thirdImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1.4, 1.4);
            self.fourImageView.alpha = 1;
            self.fourImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            // 恢复上一步透明度变成0的view对变形，
            self.secondImageView.transform = CGAffineTransformScale(transform, 1.4, 1.4);
        }];
        // 444
        [UIView addKeyframeWithRelativeStartTime:11/12.0 // 相对于6秒所开始的时间（第4秒开始动画）
                                relativeDuration:1/12.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor greenColor];
            self.fourImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.fourImageView.transform = CGAffineTransformScale(transform, 1, 1);
            self.firstImageView.alpha = 1;
            self.firstImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            // 恢复上一步透明度变成0的view对变形，
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1, 1);
        }];
    }
                              completion:^(BOOL finished) {
        [self runAnimateKeyframes];
    }];
}
@end
