//
//  UIView+DragButton.h
//  TargetAct
//
//  Created by PlatoJobs  on 2020/4/15.
//  Copyright © 2020 PlatoJobs . All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (DragButton)


/**
 使按钮可拖拽，并添加按钮的点击事件

 @param adhere 按钮是否吸附屏幕边缘
 @param block  按钮点击事件
 */
- (void)pj_addDragMovingAdhere:(BOOL)adhere clickBlock:(void (^) (UIButton *button))block;



@end

NS_ASSUME_NONNULL_END
