//
//  HXScrollPageView.h
//  分页
//
//  Created by 刘怀轩 on 2017/8/9.
//  Copyright © 2017年 刘怀轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXScrollPageView : UIView

/** 图片名称数组 */
@property (nonatomic, copy) NSArray *imageName;
/** 其他圆点的颜色 */
@property (nonatomic, strong) UIColor *otherColor;
/** 当前圆点的颜色 */
@property (nonatomic, strong) UIColor *currentColor;

@end
