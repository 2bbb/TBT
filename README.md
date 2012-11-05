# TBUtilities

## NSArray+TBNonObjectExtention

\- (**type**)**type**AtIndex:(NSUInteger)index;

syntax sugar: [[self objectAtIndex:index] **type**Value]

## NSMutableArray+TBNonObjectExtention

\- (void)add**Type**:(**type)value;

syntax sugar: [self addObject:[NSNumber numberWith**Type**:value]], etc…

## NSArray+TBShuffle

\- (NSArray *)shuffledArray;

Return shuffled array.

## NSDictionary+TBNonObjectExtention

\- (**type**)**type**ForKey:(id)key;

syntax sugar: [[self objectForKey:key] **type**Value];

## NSMutableDictionary+TBNonObjectExtention

\- (void)set**Type**:(**type**)value forKey:(id<NSCopying>)key;

syntax sugar: [self setObject:[NSNumber numberWith**Type**:value] forKey:key], etc…

## NSURLRequest+TBFaster

\+ (id)requestWithURLString:(NSString *)urlString;

syntax sugar: [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]

## NSMutableURLRequest+TBFaster

\+ (id)requestWithURLString:(NSString *)urlString;

syntx sugar: [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]]

\- (void)setHTTPBodyDictionary:(NSDictionary *)parameter;

Convert dictionary to "key1=value1&key2=value2&…&keyN=valueN" format, and add to HTTPBody.

## NSURLConnection+DelegateProxyExtention

    typedef void (^NSURLConnectionDownloadCompletionBlock)();

\+ (id)connectionWithURLString:(NSString *)urlString forMethod:(BOOL)isGET withParameter:(NSDictionary *)params completion:(NSURLConnectionDownloadCompletionBlock)completion;

*W.I.P.*

## UIView+ProperyExtention

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

direct access to frame property.

## UIView+AnimationExtention

\- (void)fadeIn:(NSTimeInterval)duration;
\- (void)fadeOut:(NSTimeInterval)duration;
\- (void)fadeOut:(NSTimeInterval)duration hideWhenStopAnimation:(BOOL)hide;

\- (void)setFrameWithAnimation:(CGRect)frame duration:(NSTimeInterval)duration;

## UIResponder+AppDelegateExtention

\- (id)retrieveFromUserDefaults:(NSString*)key;

read value from *Settings.bundle*.

## UIViewController+RapidWriteExtention.h

\+ (id)viewControllerWithNibName:(NSString *)nibName;

syntax sugar : [[[ViewController alloc] initWithNibName:nibName bundle:nil] autorelease]

\+ (id)viewController;

syntax sugar : [[[*ViewController* alloc] initWithNibName:@"*ViewController*" bundle:nil] autorelease]

\- (UIResponder *)appDelegate;

syntax sugar : [[UIApplication sharedApplication] delegate]

## UILabel+TBLabelExtend

## UIAlertView+BlockExtention

## UIScrollView+TiledImageExtention