//
//  BIDDatePickerViewController.m
//  07 Pickers
//
//  Created by tomandhua on 16/6/14.
//  Copyright © 2016年 tomandhua. All rights reserved.
//

#import "BIDDatePickerViewController.h"

@interface BIDDatePickerViewController ()
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation BIDDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDate * now = [NSDate date];
    [self.datePicker setDate:now animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    NSDate * selected = [self.datePicker date];
    NSString * message = [[NSString alloc] initWithFormat:@"The date and time you selected is: %@", selected];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Date and Time Selected" message:message delegate:nil cancelButtonTitle:@"That's so true!" otherButtonTitles:nil, nil];
    [alert show];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
