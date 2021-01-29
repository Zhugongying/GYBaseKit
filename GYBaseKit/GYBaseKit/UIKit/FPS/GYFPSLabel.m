
#import "GYFPSLabel.h"


@implementation GYFPSLabel{
    CADisplayLink *_link;
    NSUInteger _count;
    NSTimeInterval _lastTime;
    UIFont *_font;
    
    NSTimeInterval _llll;
}



- (instancetype)initWithFrame:(CGRect)frame {
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size = CGSizeMake(55, 20);
    }
    self = [super initWithFrame:frame];
    if (self) {
        self.textColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        self.textAlignment = NSTextAlignmentCenter;
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
    
        _font = [UIFont systemFontOfSize:12];
        self.font = [UIFont systemFontOfSize:9];
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
        [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}


- (void)dealloc {
    [_link invalidate];
}


- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(55, 20);
}


- (void)tick:(CADisplayLink *)link {
    if (_lastTime == 0) {
        _lastTime = link.timestamp;
        return;
    }
    
    _count++;
    NSTimeInterval delta = link.timestamp - _lastTime;
    if (delta < 1) return;
    _lastTime = link.timestamp;
    float fps = _count / delta;
    _count = 0;
    
    CGFloat progress = fps / 60.0;
    UIColor *color = [UIColor colorWithHue:0.27 * (progress - 0.2) saturation:1 brightness:0.9 alpha:1];
    NSString *fpsString = [NSString stringWithFormat:@"%d",(int)round(fps)];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ FPS",fpsString]];
    
    NSDictionary *attributeDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                   _font,NSFontAttributeName,
                                   color,NSForegroundColorAttributeName,
                                   nil];
    
    [text setAttributes:attributeDict range:NSMakeRange(0, fpsString.length)];
    self.attributedText = text;
}


+ (void)show {
#if DEBUG
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    CGFloat padding = 20;
    if (window.frame.size.width >= 375) {
        padding = 40;
    }
    CGSize currentSize = [UIScreen mainScreen].bounds.size;
    CGFloat top = 34;
    if (CGSizeEqualToSize(currentSize, CGSizeMake(375.0f, 812.0f))) {
        top = 24;
        padding = 0;
    }
    GYFPSLabel *label  = [[GYFPSLabel alloc] initWithFrame:CGRectMake(window.frame.size.width/2+padding, top, 50, 20)];
    label.backgroundColor = UIColor.systemGrayColor;
    [window addSubview:label];
#endif
}


@end
