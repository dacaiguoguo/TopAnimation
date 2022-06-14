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
        self.thirdImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"333"]];
        self.thirdImageView.contentMode = UIViewContentModeCenter;
        self.thirdImageView.alpha = 0;
        self.thirdImageView.frame = self.bounds;
        [self addSubview:_thirdImageView];
        self.secondImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"222"]];
        self.secondImageView.frame = self.bounds;
        self.secondImageView.alpha = 0;
        self.secondImageView.contentMode = UIViewContentModeCenter;
        CGAffineTransform transform = CGAffineTransformIdentity;
        self.secondImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
        [self addSubview:_secondImageView];
        self.firstImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"111"]];
        self.firstImageView.frame = self.bounds;
        self.firstImageView.contentMode = UIViewContentModeCenter;
        [self addSubview:_firstImageView];
        [self setClipsToBounds:YES];
    }
    return self;
}
- (void)viewDidAppear:(BOOL)animated {

    [UIView animateWithDuration:7 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGAffineTransform transform = CGAffineTransformIdentity;
        self.firstImageView.alpha = 0.3;
        self.firstImageView.transform3D = CATransform3DMakeScale(1.6, 1.6, 1.6);
        self.secondImageView.alpha = 1;
        self.secondImageView.transform = CGAffineTransformScale(transform, 1, 1);
    } completion:^(BOOL finished) {
        self.firstImageView.alpha = 0;
        [UIView animateWithDuration:7 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            CGAffineTransform transform = CGAffineTransformIdentity;
            self.secondImageView.alpha = 0.3;
            // self.secondImageView.transform = CGAffineTransformScale(transform, 0.8, 0.8);
            self.thirdImageView.alpha = 1;
            self.thirdImageView.transform = CGAffineTransformScale(transform, 1.4, 1.4);
            self.firstImageView.transform = CGAffineTransformScale(transform, 1, 1);
        } completion:^(BOOL finished) {
            self.secondImageView.alpha = 0;
            [UIView animateWithDuration:7 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                CGAffineTransform transform = CGAffineTransformIdentity;
                self.thirdImageView.alpha = 0.3;
                // self.thirdImageView.transform = CGAffineTransformScale(transform, 1.8, 1.4);
                self.firstImageView.alpha = 1;
                self.firstImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
                self.secondImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
            } completion:^(BOOL finished) {
                self.thirdImageView.alpha = 0;
                [self viewDidAppear:YES];
//                [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//                    self.firstImageView.alpha = 1;
//                    self.thirdImageView.alpha = 0;
//                    CGAffineTransform transform = CGAffineTransformIdentity;
//                    self.firstImageView.transform = CGAffineTransformScale(transform, 1, 1);
//                    self.secondImageView.transform = CGAffineTransformScale(transform, 1.2, 1.2);
//                    self.thirdImageView.transform = CGAffineTransformScale(transform, 1, 1);
//                } completion:^(BOOL finished) {
//                    [self viewDidAppear:YES];
//                }];
            }];
        }];
    }];
}
@end
