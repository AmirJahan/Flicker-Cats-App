
#import <Foundation/Foundation.h>

@interface AllURLs : NSObject
{
    NSMutableArray* urlsArr;
}

@property (nonatomic, retain) NSMutableArray* urlsArr;

+(void)addURL:(NSURL *)thisOne;

+ (id)sharedManager;

@end
