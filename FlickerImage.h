
#import <Foundation/Foundation.h>

@interface FlickerImage : NSObject

@property (nonatomic) NSString* farm;
@property (nonatomic) NSString* server;
@property (nonatomic) NSString* imgId;
@property (nonatomic) NSString* secret;


-(NSURL *)returnUrlWith:(NSString *)inpFarm
               inServer:(NSString *)inpServer
                  imgId:(NSString *)inpImgId
                 secret:(NSString *)inpSecret;
@end
