
#import "FlickerImage.h"

@implementation FlickerImage


-(NSURL *)returnUrlWith:(NSString *)inpFarm
               inServer:(NSString *)inpServer
                  imgId:(NSString *)inpImgId
                 secret:(NSString *)inpSecret;
{
    NSString *urlStr = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg",
                       inpFarm,
                       inpServer,
                       inpImgId,
                       inpSecret];
    
    return [NSURL URLWithString: urlStr];
}




@end
