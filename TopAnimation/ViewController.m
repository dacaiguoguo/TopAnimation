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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
    self.tView = [[TopAnimationView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.width)];
    [self.view addSubview:self.tView];
    self.tView.imageArray = @[@"头部GIF-1备份 2", @"头部GIF-2备份 2", @"头部GIF-3备份 2", @"头部GIF-4备份 2"];
    [self.tView viewDidAppear:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)applicationWillEnterForeground {
    [self.tView viewDidAppear:YES];
}
@end
