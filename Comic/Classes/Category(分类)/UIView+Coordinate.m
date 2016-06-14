//
//  
//  将源生坐标简化

#import "UIView+Coordinate.h"

@implementation UIView (Coordinate)
#pragma mark X 简化
-(CGFloat)x{

    return self.frame.origin.x;
}
-(void)setX:(CGFloat)x{


    CGRect frame=self.frame;
    frame.origin.x=x;
    self.frame=frame;
    
}
#pragma mark Y 简化
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

#pragma mark Width 简化

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (CGFloat)width
{
    return self.frame.size.width;
}

#pragma mark Height 简化
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}


#pragma mark Size 简化
- (void)setSize:(CGSize)size
{
    //    self.width = size.width;
    //    self.height = size.height;
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}





@end
