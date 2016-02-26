# KXAnimationImageView
##KXAnimationImageView重写了ImageView中的animation的相关逻辑 
###主要参数为animationDuration animationRepeatCount animationImages
###其中animationDuration 为轮训图片的间隔
###    animationRepeatCount为轮训的次数
###    animationImages为轮训的列表 其中存储的是图片的名字
###整个运行操作为两种枚举startAnimating;stopAnimating.
###当图片进行轮询时 调用startAnimating 
###当图片停止轮询时 调用stopAnimating
###当图片暂停的后下次运行时，图片轮询是继续上一次的图片进行轮询
###本开发代码参考了网上一个前辈的设计 进行实现 非完全自创
