#import "ViewController.h"
#import "FlickerImage.h"
#import "AllURLs.h"
#import "ReadData.h"


@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];


    [ReadData read:self];
}

-(void)showOne
{
    AllURLs *sharedInstance = [AllURLs sharedManager];

    NSData *data = [NSData dataWithContentsOfURL:[sharedInstance.urlsArr objectAtIndex:1]];
    _myImgView.image = [UIImage imageWithData: data];
}


@end
