//
//  UIView+DragButton.m
//  TargetAct
//
//  Created by PlatoJobs  on 2020/4/15.
//  Copyright © 2020 PlatoJobs . All rights reserved.
//

#import "UIView+DragButton.h"
#import <objc/runtime.h>

@implementation UIView (DragButton)

static char DragAdhere;
static char DragBlock;

- (void)pj_addDragMovingAdhere:(BOOL)adhere clickBlock:(void (^) (UIButton *button))block {
    objc_setAssociatedObject(self, &DragAdhere, @(adhere), OBJC_ASSOCIATION_ASSIGN);
    objc_setAssociatedObject(self, &DragBlock, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
    [self addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)]];
}
- (void)tap:(UITapGestureRecognizer *)tap {
    void (^ block)(UIButton *button) = objc_getAssociatedObject(self, &DragBlock);
    if (block) {
        block((UIButton *)tap.view);
    }
}
- (void)pan:(UIPanGestureRecognizer *)pan {
    BOOL adhere = [objc_getAssociatedObject(self, &DragAdhere) boolValue];
    if (pan.state == UIGestureRecognizerStateBegan) {
        [UIView animateWithDuration:0.25 animations:^{
            pan.view.center = [pan locationInView:pan.view.superview];
        }];
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        pan.view.center = [pan locationInView:pan.view.superview];
    } else if (pan.state == UIGestureRecognizerStateEnded) {
        CGFloat x = pan.view.frame.origin.x;
        CGFloat y = pan.view.frame.origin.y;
        CGFloat width = pan.view.frame.size.width;
        CGFloat height = pan.view.frame.size.height;
        CGFloat kWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat kHeight = [UIScreen mainScreen].bounds.size.height;
        /** 以下代码功能：防止按钮超出屏幕 */
        if (x < 0) {
            x = 0;
        } else if (x + width > kWidth) {
            x = kWidth - width;
        }
        if (y < 0) {
            y = 0;
        } else if (y + height > kHeight) {
            y = kHeight - height;
        }
        if (adhere) {
            /** 以下代码功能：使按钮始终吸附屏幕四条边 */
            CGFloat centerX = pan.view.center.x;
            CGFloat centerY = pan.view.center.y;
            if (centerX - centerY > 0 && centerX + centerY < kWidth) {
                y = 0;
            } else if (centerX + centerY > kHeight && centerX - centerY < kWidth - kHeight) {
                y = kHeight - height;
            } else if (centerX - centerY <= 0 && centerX + centerY <= kHeight && centerX < kWidth / 2.0) {
                x = 0;
            } else {
                x = kWidth - width;
            }
            [UIView animateWithDuration:0.25 animations:^{
                pan.view.frame = CGRectMake(x, y, width, height);
            }];
        } else {
            if (x != pan.view.frame.origin.x || y != pan.view.frame.origin.y) {
                [UIView animateWithDuration:0.25 animations:^{
                    pan.view.frame = CGRectMake(x, y, width, height);
                }];
            }
        }
    }
}

@end
