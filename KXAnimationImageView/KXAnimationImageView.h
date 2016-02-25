//
//  KXAnimationImagesVIew.h
//  applicationAllView
//
//  Created by 王小亮 on 16/2/22.
//  Copyright © 2016年 王小亮. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 当前动态图播出状态
 */
typedef  enum{
    KXAnimationImagesVIewStatePlaying,
    KXAnimationImagesVIewStateStop,
    KXAnimationImagesVIewStateStoped
}KXAnimationImagesVIewStates;
/*
 当前动态图向前播出or向后播出
 */
typedef enum{
    KXAnimationImagesVIewPreView,
    KXAnimationImagesVIewNextView
}KXAnimationImagesVIewPreOrNextView;

@interface KXAnimationImageView : UIView
{
    UIImageView *_image;
    NSTimer *_time;
    NSUInteger _currentIndex;
    NSUInteger _jump;
    
    NSMutableString *_nextImage;
    
    KXAnimationImagesVIewPreOrNextView _preOrNext;
    KXAnimationImagesVIewStates _state;
}
@property NSTimeInterval                                animationDuration;
@property NSUInteger                                    animationRepeatCount;
@property NSUInteger                                    toIndex;
@property (strong,nonatomic) NSMutableArray *           animationImages;



- (void)animationTo:(NSUInteger)index_;
- (void)setCurrentImage;

- (void)startAnimating;
- (void)stopAnimating;
- (BOOL)isAnimating;

@end
