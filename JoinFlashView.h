//
//  JoinFlashView.h
//  RightLeft
//
//  Created by chenglibin on 2020/3/25.
//  Copyright © 2020 Com. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ani_kDeviceWidth [UIScreen mainScreen].bounds.size.width
/**获取设备高度*/
#define ani_kDeviceHeight_animation [UIScreen mainScreen].bounds.size.height

#define ani_kRGB(r, g, b) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1.f]

#define ani_rgb(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

NS_ASSUME_NONNULL_BEGIN

@interface JoinFlashView : UIView
+(void)startAnimationFrame:(CGRect)rect name:(NSString *)name superView:(UIView *)superView;

@end

NS_ASSUME_NONNULL_END
