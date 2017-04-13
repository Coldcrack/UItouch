//
//  TouchView.m
//  UITouch
//
//  Created by 嗷嗷叫 on 2017/4/12.
//  Copyright © 2017年 嗷嗷叫aoaojiao. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView


//通过覆写触摸的相关方法来处理触摸事件
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"触摸开始");
    //从NSSet,获取一个触摸对象
    UITouch *touch1 = [touches anyObject];
//    NSLog(@"%@",touch1);
    //获取手指点击位置
    //因为在不同视图的坐标参考系下，位置点的坐标不同，所以要指定一个参考系
    CGPoint location = [touch1 locationInView:self];
    NSLog(@"%@",NSStringFromCGPoint(location));
    //点击次数
    NSUInteger tapCount = touch1.tapCount;
    NSLog(@"tapCount = %lu",tapCount);
    if (touch1.phase == UITouchPhaseBegan) {
        NSLog(@"触摸开始状态");
        //触摸点的坐标转化
        // 在self上的触摸点location --->self.super的触摸点位置
        CGPoint locationInSuperView = [self convertPoint:location toView:self.superview];
        NSLog(@"%@",NSStringFromCGPoint(locationInSuperView));
    }
    
    //------------方法---------------

}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //随机获取一个触摸对象
    UITouch *touch = [touches anyObject];
    //    NSLog(@"接触点在屏幕上移动");
    //获取手指触摸的位置
    CGPoint location = [touch locationInView:self];
    //获取上一次手指触摸的位置
    CGPoint preLocation = [touch previousLocationInView:self];
    //    NSLog(@"当前触摸位置%@\n前一次触摸位置%@",NSStringFromCGPoint(location),NSStringFromCGPoint(preLocation));
    //计算手指的位移
    CGFloat xMove = location.x - preLocation.x;
    CGFloat yMove = location.y - preLocation.y;
    //根据两次手指唯一差来移动视图的位置
    CGRect frame = self.frame;
    frame.origin.x += xMove;
    frame.origin.y += yMove;
    self.frame = frame;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
//    NSLog(@"手指离开屏幕，触摸结束");
   
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"接触事件被意外取消");
}
@end
