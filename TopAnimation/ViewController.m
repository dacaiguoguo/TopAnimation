//
//  ViewController.m
//  TopAnimation
//
//  Created by yanguo sun on 2022/6/13.
//

#import "ViewController.h"
#import "TopAnimationView.h"
#import "FadeLoopAnimationView.h"

@interface ViewController ()
@property (nonatomic, strong) FadeLoopAnimationView *tView;
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
    self.imageArray = @[@"头部GIF-1", @"头部GIF-2", @"头部GIF-3", @"头部GIF-4"];
//    self.imageArray = @[];
//    self.imageArray = @[@"头部GIF-1"];
//    self.imageArray = @[@"头部GIF-1", @"头部GIF-2"];
//    self.imageArray = @[@"头部GIF-1", @"头部GIF-2", @"头部GIF-3"];
    self.tView = [[FadeLoopAnimationView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.width)];
    [self.view addSubview:self.tView];
    self.tView.clipsToBounds = YES;
    self.tView.imageArray = self.imageArray;
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tView beginAnimation];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didBecomeActiveNotification:) name:UIApplicationDidBecomeActiveNotification object:nil];
}
- (void)didBecomeActiveNotification:(NSNotification *)noti {
    [self.tView beginAnimation];
}

@end
