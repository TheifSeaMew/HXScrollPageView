//
//  ViewController.m
//  分页
//
//  Created by 刘怀轩 on 2017/8/9.
//  Copyright © 2017年 刘怀轩. All rights reserved.
//

#import "ViewController.h"
#import "HXScrollPageView.h"

@interface ViewController ()<UIScrollViewDelegate>
//@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CGFloat imageW = [UIScreen mainScreen].bounds.size.width - 16 * 2;
    CGFloat imageH = 200;
    HXScrollPageView *scrollView = [[HXScrollPageView alloc] init];
    scrollView.frame = CGRectMake(16, 30, imageW, imageH);
    NSMutableArray *imageName = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        NSString *name = [NSString stringWithFormat:@"img_0%d", i];
        [imageName addObject:name];
    }
    scrollView.otherColor = [UIColor redColor];
    scrollView.currentColor = [UIColor purpleColor];
    scrollView.imageName = imageName;
    [self.view addSubview:scrollView];
}


@end
