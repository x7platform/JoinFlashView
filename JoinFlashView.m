//
//  JoinFlashView.m
//  RightLeft
//
//  Created by chenglibin on 2020/3/25.
//  Copyright © 2020 Com. All rights reserved.
//

#import "JoinFlashView.h"

@implementation JoinFlashView
+(UILabel *)labelWithFrame:(CGRect)rect backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment placeHolder:(NSString *)placeHolder{
    
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = backgroundColor;
    label.textColor = textColor;
    label.font = font;
    label.textAlignment = textAlignment;
    label.text = placeHolder;
    return label;
}

+(void)startAnimationFrame:(CGRect)rect name:(NSString *)name superView:(UIView *)superView{
    CGFloat fontSize = rect.size.height * 3 / 5.0;
    //左右留的间隙
    NSInteger space = 3;
    
    //计算右侧规定文字的宽度
    NSString *source = @"加入了直播间  ";
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]};
    CGSize sourceSize = [source boundingRectWithSize:rect.size options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    CGFloat sourceWidth = sourceSize.width;
    
    //计算左侧标题最长 长度
    CGFloat nameMaxWidth = rect.size.width - space * 2 - sourceWidth;
    //计算左侧实际长度
    attrs = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:fontSize]};
    CGSize nameSize = [name boundingRectWithSize:rect.size options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    CGFloat nameWidth = nameSize.width;
    if (nameWidth > nameMaxWidth) {
        nameWidth = nameMaxWidth;
    }
    
    //添加整体条状背景
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(rect.origin.x, rect.origin.y, sourceWidth + nameWidth + space * 3 , rect.size.height)];
    bgView.backgroundColor = ani_kRGB(142, 108, 233);
    bgView.layer.cornerRadius = rect.size.height/2.0;
    bgView.clipsToBounds = YES;
    [superView addSubview:bgView];

    //添加左侧姓名标题
    UILabel *leftLabel = [[self class] labelWithFrame:CGRectMake(space, 0, nameWidth, bgView.frame.size.height) backgroundColor:[UIColor clearColor] textColor:[UIColor whiteColor] font:[UIFont boldSystemFontOfSize:fontSize] textAlignment:NSTextAlignmentCenter placeHolder:name];
    [bgView addSubview:leftLabel];
    
    //添加右侧文字标题
    UILabel *rightLabel = [[self class] labelWithFrame:CGRectMake(nameWidth, 0, sourceWidth, bgView.frame.size.height) backgroundColor:[UIColor clearColor] textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:fontSize] textAlignment:NSTextAlignmentCenter placeHolder:source];
    [bgView addSubview:rightLabel];

    //动画
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *val1 = [NSValue valueWithCGPoint:CGPointMake(rect.origin.x + bgView.frame.size.width/2.0, rect.origin.y + rect.size.height/2.0)];
    NSValue *val2 = [NSValue valueWithCGPoint:CGPointMake(70 + bgView.frame.size.width/2.0, rect.origin.y + rect.size.height/2.0)];
    NSValue *val3 = [NSValue valueWithCGPoint:CGPointMake(50 + bgView.frame.size.width/2.0, rect.origin.y + rect.size.height/2.0)];
    NSValue *val4 = [NSValue valueWithCGPoint:CGPointMake(-(bgView.frame.size.width), rect.origin.y + rect.size.height/2.0)];
    NSArray *values = @[val1,val2,val3,val4];
    keyAnimation.values = values;
    keyAnimation.duration = 2.5;
    keyAnimation.removedOnCompletion = YES;
    keyAnimation.fillMode = kCAFillModeForwards;
    keyAnimation.calculationMode = kCAAnimationCubic;
    keyAnimation.keyTimes = @[@0,@0.1,@0.9,@1.0];
    [bgView.layer addAnimation:keyAnimation forKey:@"keyAnimation"];
}


@end
