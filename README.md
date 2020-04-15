# dragButton
全屏可拖拽的按钮

```objc
/**
 使按钮可拖拽，并添加按钮的点击事件
 @param adhere 是否吸附屏幕边缘
 @param block  点击事件
 */

- (void)pj_addDragMovingAdhere:(BOOL)adhere clickBlock:(void (^) (UIButton *button))block

```
### 示例代码：

```objc

UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(10, 150, 30, 30);
    button.backgroundColor=[UIColor redColor];
    [button setBackgroundImage:[UIImage imageNamed:@"sd"] forState:(UIControlStateNormal)];
    [self.view addSubview:button];
    [button pj_addDragMovingAdhere:YES clickBlock:^(UIButton *button) {
        /** button点击事件 */
        NSLog(@"220");
    }];
    
```
