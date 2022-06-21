//
//  FadeLoopAnimationView.h
//  TopAnimation
//
//  Created by yanguo sun on 2022/6/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FadeLoopAnimationView : UIView
@property (nonatomic, copy) NSArray *imageArray;
- (void)beginAnimation;
@end

NS_ASSUME_NONNULL_END
