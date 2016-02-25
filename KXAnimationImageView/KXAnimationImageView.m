//
//  KXAnimationImagesVIew.m
//  applicationAllView
//
//  Created by 王小亮 on 16/2/22.
//  Copyright © 2016年 王小亮. All rights reserved.
//

#import "KXAnimationImageView.h"



@implementation KXAnimationImageView
@synthesize animationDuration           = _animationDuration;
@synthesize animationRepeatCount        = _animationRepeatCount;
@synthesize toIndex                     = _toIndex;
@synthesize animationImages             = _animationImages;

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    //    当self不为nil的时候
    if (self) {
        _animationRepeatCount = -1;
        _currentIndex = 0;
        _image = [[UIImageView alloc]initWithFrame:self.bounds];
        if (self.animationImages == nil) {
            _image.image = [UIImage imageNamed:@"defaultImage.jpg"];
        }
        else{
            _image.image = [UIImage imageNamed:[_animationImages objectAtIndex:0]];
        }
        
        [self addSubview:_image];
    }
    return self;
}

- (void)animationTo:(NSUInteger)index_{
    if ([self.animationImages count] == 0) {
        _image.image = [UIImage imageNamed:@"defaultImage.jpg"];
    }
    else{
        if (index_ == [self.animationImages count]) {
            index_ = 0;
        }
        _image.image = [UIImage imageNamed:[self.animationImages objectAtIndex:index_]];
    }
}
- (void)setCurrentImage{
    [self animationTo:_currentIndex];
}

- (void)startAnimating{
    _state = KXAnimationImagesVIewStatePlaying;
    //    clear index
    _toIndex = 0;
    _time = [NSTimer scheduledTimerWithTimeInterval:self.animationDuration target:self selector:@selector(setNextImage) userInfo:nil repeats:YES];
}

- (void)stopAnimating{
    _state = KXAnimationImagesVIewStateStop;
    [_time invalidate];
    _state = KXAnimationImagesVIewStateStoped;
}
-(BOOL)isAnimating{
    if (_state == KXAnimationImagesVIewStatePlaying) {
        return true;
    }
    else if(_state == KXAnimationImagesVIewStateStop || _state == KXAnimationImagesVIewStateStoped){
        return false;
    }
    return false;
}
-(void) setNextImage
{
    _toIndex++;
    if (_toIndex > [self.animationImages count] * self.animationRepeatCount) {
        [_time invalidate];
        return;
    }
    _currentIndex = _currentIndex +1;
//    index为0开始 当等于image的Count的时候 相当于溢出
    if (_currentIndex == [_animationImages count]) {
        _currentIndex = 0 ;
    }
    [self setCurrentImage];
    
}

@end
