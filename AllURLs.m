#import "AllURLs.h"

@implementation AllURLs

@synthesize urlsArr;


// Singleton

+ (id)sharedManager {
    static AllURLs *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    
    
    dispatch_once(&onceToken, ^
    {
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}




- (id)init {
    if (self = [super init]) {
        urlsArr = [NSMutableArray new];
    }
    return self;
}


+(void)addURL:(NSURL *)thisOne
{
    [AllURLs addURL: thisOne];
    
}

@end
