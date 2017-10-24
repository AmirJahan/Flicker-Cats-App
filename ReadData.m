#import "ReadData.h"
#import "AllURLs.h"
#import "FlickerImage.h"
#import "ViewController.h"

@implementation ReadData

+(void)read:(ViewController *) thisContext
{
    AllURLs *sharedInstance = [AllURLs sharedManager];

    NSURL *url = [NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=f47ba34e09b920cda01ee06975a8165d&tags=cat"];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:urlRequest
                                                   completionHandler:^(NSData * _Nullable data,
                                                                       NSURLResponse * _Nullable response,
                                                                       NSError * _Nullable error)
      {
          NSError *jsonError = nil;
          NSDictionary *readStuffDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
          
          if (jsonError) {
              NSLog(@"jsonError: %@", jsonError.localizedDescription);
          } else {
              NSDictionary* photosDict = [readStuffDict objectForKey:@"photos"];
              NSArray* photosArr = [photosDict objectForKey:@"photo"];
              
              for (NSDictionary *anyPhoto in photosArr)
              {
                  FlickerImage* thisImage = [FlickerImage new];
                  
                  NSURL* thisImgURL = [thisImage returnUrlWith:anyPhoto[@"farm"]
                                                      inServer:anyPhoto[@"server"]
                                                         imgId:anyPhoto[@"id"]
                                                        secret:anyPhoto[@"secret"]];
                  
                  [sharedInstance.urlsArr addObject: thisImgURL];
              }
              
              dispatch_async(dispatch_get_main_queue(), ^{
              
                  [thisContext showOne];
              });
          }
      }];
    
    [dataTask resume];
}

@end
