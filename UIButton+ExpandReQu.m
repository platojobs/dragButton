//
//  UIButton+ExpandReQu.m
//  TargetAct
//
//  Created by PlatoJobs  on 2020/4/15.
//  Copyright © 2020 PlatoJobs . All rights reserved.
//

#import "UIButton+ExpandReQu.h"
#import <objc/runtime.h>
@implementation UIButton (ExpandReQu)


static char MSExpandEdgeKey;

- (void)expandReQu:(UIEdgeInsets)edgeQu {
    objc_setAssociatedObject(self, &MSExpandEdgeKey, [NSValue valueWithUIEdgeInsets:edgeQu], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    UIEdgeInsets edge = [objc_getAssociatedObject(self, &MSExpandEdgeKey) UIEdgeInsetsValue];
    
    CGRect edgeQu = self.bounds;
    if (edge.left || edge.right || edge.top || edge.bottom) {
        edgeQu = CGRectMake(self.bounds.origin.x - edge.left,
                                self.bounds.origin.y - edge.top,
                                self.bounds.size.width + edge.left + edge.right,
                                self.bounds.size.height + edge.top + edge.bottom);
    }
    return CGRectContainsPoint(edgeQu, point);
}


@end
