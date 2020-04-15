# dragButton
### 1全屏可拖拽的按钮

```objc
/**
 使按钮可拖拽，并添加按钮的点击事件
 @param adhere 是否吸附屏幕边缘
 @param block  点击事件
 */

- (void)pj_addDragMovingAdhere:(BOOL)adhere clickBlock:(void (^) (UIButton *button))block

```
#### 1.1示例代码：



```objc

\\导入 UIView+DragButton.h 文件

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

### 2 扩大按钮的点击选区

> `objc_setAssociatedObject`和`objc_getAssociatedObject`方法，另外涉及`pointInside`响应者链知识，理解自己找。

```
\\UIEdgeInsets --上、左、下、右

- (void)expandReQu:(UIEdgeInsets)edgeQu;

```
>  直接调用，block写点击操作；就可以了；

