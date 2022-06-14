//
//  TopAnimationView.h
//  TopAnimation
//
//  Created by yanguo sun on 2022/6/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TopAnimationView : UIView
@property (nonatomic, strong) UIImageView *firstImageView;
@property (nonatomic, strong) UIImageView *secondImageView;
@property (nonatomic, strong) UIImageView *thirdImageView;
@property (nonatomic, copy) NSArray *imageArray;
- (void)viewDidAppear:(BOOL)animated; 
@end

NS_ASSUME_NONNULL_END
