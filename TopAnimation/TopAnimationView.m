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
        self.fourImageView.contentMode = UIViewContentModeScaleToFill;
        self.fourImageView.alpha = 0;
        self.fourImageView.frame = self.bounds;
        [self addSubview:_fourImageView];
        CGAffineTransform transform = CGAffineTransformIdentity;
        self.fourImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);

        self.thirdImageView = [[UIImageView alloc] init];
        self.thirdImageView.contentMode = UIViewContentModeScaleToFill;
        self.thirdImageView.alpha = 0;
        self.thirdImageView.frame = self.bounds;
        [self addSubview:_thirdImageView];
        self.secondImageView = [[UIImageView alloc] init];
        self.secondImageView.frame = self.bounds;
        self.secondImageView.alpha = 0;
        self.secondImageView.contentMode = UIViewContentModeScaleToFill;
        self.secondImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
        [self addSubview:_secondImageView];
        self.firstImageView = [[UIImageView alloc] init];
        self.firstImageView.frame = self.bounds;
        self.firstImageView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:_firstImageView];
        [self setClipsToBounds:YES];

//        self.bottomImageView = [[UIImageView alloc] init];
//        self.bottomImageView.frame = CGRectMake(0, self.bounds.size.height - 36, self.bounds.size.width, 36);
//        _bottomImageView.image = [UIImage imageNamed:@"弧形 1"];
//        self.bottomImageView.contentMode = UIViewContentModeScaleToFill;
//        [self addSubview:_bottomImageView];


        CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
        maskLayer1.frame = self.bounds;
        maskLayer1.path = [self.class makeRoundPath_3:self.bounds].CGPath;
        self.layer.mask = maskLayer1;

        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        [self addSubview:effectView];
        effectView.frame = CGRectMake(20, 280, frame.size.width - 40, 40);
        UILabel *searchLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
        [effectView.contentView addSubview:searchLabel];
        searchLabel.textColor = UIColor.whiteColor;
        searchLabel.text = @"请输入景点/酒店民宿等";
        searchLabel.textAlignment = NSTextAlignmentCenter;
        searchLabel.font = [UIFont systemFontOfSize:14];
        effectView.layer.cornerRadius = 20;
        effectView.layer.masksToBounds = YES;

    }
    return self;
}


+ (UIBezierPath *)makeRoundPath_3:(CGRect)frame {
    CGFloat lineWidth = 0; // 线宽
    CGFloat w = frame.size.width - lineWidth;
    CGFloat h = frame.size.height * 0.09;
    CGFloat r = (w*w/4 + h*h)/(2*h);
    CGFloat cosA = 1-h/r;
    CGFloat aaA = acos(cosA);
    CGFloat aA = M_PI_2 - aaA;
    CGFloat aB = M_PI_2 + aaA;

    CGPoint center1 = CGPointMake(frame.size.width/2, frame.size.height - r );
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path addLineToPoint:CGPointMake(0, frame.size.height - 36)];
    [path addArcWithCenter:center1
                    radius:r
                startAngle:aB
                  endAngle:aA
                 clockwise:NO];
    [path addLineToPoint:CGPointMake(w, 0)];
    [path closePath];
    return path;
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

    [UIView animateKeyframesWithDuration:10
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeCubic|UIViewKeyframeAnimationOptionAutoreverse|UIViewKeyframeAnimationOptionRepeat
                              animations:^{
        // 111
        [UIView addKeyframeWithRelativeStartTime:0.0   // 相对于6秒所开始的时间（第0秒开始动画）
                                relativeDuration:1/4.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor redColor];
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.firstImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            self.secondImageView.alpha = 1;
            self.secondImageView.transform = CGAffineTransformScale(transform, 1.1, 1.1);
            // 恢复上一步透明度变成0的view对变形，
            self.fourImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
        }];

        // 111
        [UIView addKeyframeWithRelativeStartTime:3/16.0   // 相对于6秒所开始的时间（第0秒开始动画）
                                relativeDuration:1/16.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor redColor];
            self.firstImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.firstImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            self.secondImageView.alpha = 1;
            self.secondImageView.transform = CGAffineTransformScale(transform, 1.1, 1.1);
            // 恢复上一步透明度变成0的view对变形，
            self.fourImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
        }];
        
        // 222
        [UIView addKeyframeWithRelativeStartTime:1/4.0 // 相对于6秒所开始的时间（第2秒开始动画）
                                relativeDuration:1/4.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor yellowColor];
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.secondImageView.transform = CGAffineTransformScale(transform, 1, 1);

            self.thirdImageView.alpha = 1;
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1.1, 1.1);
            // 恢复上一步透明度变成0的view对变形，
            self.firstImageView.transform = CGAffineTransformScale(transform, 1, 1);
        }];
        // 222
        [UIView addKeyframeWithRelativeStartTime:1/4.0+3/16.0 // 相对于6秒所开始的时间（第2秒开始动画）
                                relativeDuration:1/16.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor yellowColor];
            self.secondImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.secondImageView.transform = CGAffineTransformScale(transform, 1, 1);

            self.thirdImageView.alpha = 1;
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1.1, 1.1);
            // 恢复上一步透明度变成0的view对变形，
            self.firstImageView.transform = CGAffineTransformScale(transform, 1, 1);
        }];
        // 333
        [UIView addKeyframeWithRelativeStartTime:2/4.0 // 相对于6秒所开始的时间（第4秒开始动画）
                                relativeDuration:1/4.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor greenColor];
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            self.fourImageView.alpha = 1;
            self.fourImageView.transform = CGAffineTransformScale(transform, 1.1, 1.1);
            // 恢复上一步透明度变成0的view对变形，
            self.secondImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
        }];
        // 333
        [UIView addKeyframeWithRelativeStartTime:2/4.0+3/16.0 // 相对于6秒所开始的时间（第4秒开始动画）
                                relativeDuration:1/16.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor greenColor];
            self.thirdImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            self.fourImageView.alpha = 1;
            self.fourImageView.transform = CGAffineTransformScale(transform, 1.1, 1.1);
            // 恢复上一步透明度变成0的view对变形，
            self.secondImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
        }];
        // 444
        [UIView addKeyframeWithRelativeStartTime:3/4.0 // 相对于6秒所开始的时间（第4秒开始动画）
                                relativeDuration:1/4.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor greenColor];
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.fourImageView.transform = CGAffineTransformScale(transform, 1, 1);
            self.firstImageView.alpha = 1;
            self.firstImageView.transform = CGAffineTransformScale(transform, 1.1, 1.1);
            // 恢复上一步透明度变成0的view对变形，
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1, 1);
        }];
        // 444
        [UIView addKeyframeWithRelativeStartTime:3/4.0+3/16.0 // 相对于6秒所开始的时间（第4秒开始动画）
                                relativeDuration:1/16.0 // 相对于6秒动画的持续时间（动画持续2秒）
                                      animations:^{
            // self.view.backgroundColor = [UIColor greenColor];
            self.fourImageView.alpha = 0;
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.fourImageView.transform = CGAffineTransformScale(transform, 1, 1);
            self.firstImageView.alpha = 1;
            self.firstImageView.transform = CGAffineTransformScale(transform, 1.1, 1.1);
            // 恢复上一步透明度变成0的view对变形，
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1, 1);
        }];
    }
                              completion:^(BOOL finished) {
        // [self runAnimateKeyframes];
    }];
}
@end
