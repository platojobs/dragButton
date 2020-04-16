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

#### 2 扩大按钮的点击选区

> `objc_setAssociatedObject`和`objc_getAssociatedObject`方法，另外涉及`pointInside`响应者链知识，理解自己找。

```
\\UIEdgeInsets --上、左、下、右

- (void)expandReQu:(UIEdgeInsets)edgeQu;

```
>  直接调用，block写点击操作；就可以了；

#### 3 自定义模型保存

> 自定义模型继承`PJBaseModel`，就ok了... 例如：`CacheModel`

```swift
// 归档

-(void)encodeMdoel{
  
    CacheModel *model = [CacheModel new];
    model.name = @"moses";
    model.ID = @"10086";
    model.age = 18;
    model.gender = 1;
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"gitos001"];
   // [NSKeyedArchiver archiveRootObject:model toFile:filePath];
    
   
  NSData*data=[NSKeyedArchiver archivedDataWithRootObject:model requiringSecureCoding:YES error:nil];
    
    [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    [data writeToFile:filePath atomically:YES];
}

// 解档
-(void)decodeModel{
    
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"gitos001"];
    NSData*data=[NSData dataWithContentsOfFile:filePath];
    CacheModel *model = [NSKeyedUnarchiver unarchivedObjectOfClass:[CacheModel class] fromData:data error:nil];
    NSLog(@"%@--%@--%ld--%d", model.name, model.ID, (long)model.age, model.gender);
    
}


```
