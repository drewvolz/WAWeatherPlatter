//
//  SearcViewController.m
//  WeatherApp
//
//  Created by Drew Volz on 11/3/20.
//

#import "SearchViewController.h"
#import "WAWeatherPlatterViewController.h"

@interface SearcViewController ()

@property (strong, nonatomic) IBOutlet UITextField *locationTextField;

@end

@implementation SearcViewController


- (void)initWeatherView:(NSString *)location {
    WAWeatherPlatterViewController *controller = [NSClassFromString(@"WAWeatherPlatterViewController") new];
    [self.navigationController pushViewController:controller animated:YES];
    [controller setTitle:location];
    [self adjustBounds:controller];
    [controller initWithLocationString:location];
}


- (void)adjustBounds:(UIViewController *)controller {
    CGFloat statusbarHeight = self.view.window.windowScene.statusBarManager.statusBarFrame.size.height;
    CGFloat navHeight = self.navigationController.navigationBar.frame.size.height;

    CGRect frame = controller.view.bounds;
    frame.origin.y -= statusbarHeight + navHeight;
    controller.view.bounds = frame;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        NSString *location = self.locationTextField.text;

        if (location.length) {
            [self initWeatherView:location];
        }
    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
