//
//  HXScrollPageView.m
//  分页
//
//  Created by 刘怀轩 on 2017/8/9.
//  Copyright © 2017年 刘怀轩. All rights reserved.
//

#import "HXScrollPageView.h"

@interface HXScrollPageView ()<UIScrollViewDelegate>
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIPageControl *pageControl;
@end

@implementation HXScrollPageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        [self addSubview:scrollView];
        self.scrollView = scrollView;
        
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        pageControl.pageIndicatorTintColor = [UIColor blueColor];
        pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
        // 单页的时候自动隐藏
        pageControl.hidesForSinglePage = YES;
        [self addSubview:pageControl];
        self.pageControl = pageControl;
    }
    return self;
}

#pragma mark - setter方法重写
- (void)setImageName:(NSArray *)imageName {
    _imageName = imageName;
    
    // 移除之前所有imageView
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for (int i = 0; i < imageName.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:imageName[i]];
        [self.scrollView addSubview:imageView];
    }
    self.pageControl.numberOfPages = imageName.count;
}

- (void)setOtherColor:(UIColor *)otherColor {
    _otherColor = otherColor;
    self.pageControl.pageIndicatorTintColor = otherColor;
}
- (void)setCurrentColor:(UIColor *)currentColor {
    _currentColor = currentColor;
    self.pageControl.currentPageIndicatorTintColor = currentColor;
}

// 重新计算frame
- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSInteger count = self.imageName.count;
    CGFloat scrollViewW = self.frame.size.width;
    CGFloat scrollViewH = self.frame.size.height;
    self.scrollView.frame = CGRectMake(0, 0, scrollViewW, scrollViewH);
    self.pageControl.frame = CGRectMake(0, scrollViewH - 25, scrollViewW, 10);
    
    for (int i = 0; i < count; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        imageView.frame = CGRectMake(i * scrollViewW, 0, scrollViewW, scrollViewH);
    }
    
    self.scrollView.contentSize = CGSizeMake(scrollViewW * count, 0);
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    int page = (int)(offsetX / self.frame.size.width + 0.5);
    self.pageControl.currentPage = page;
}

@end
