//
//  BIDSingleComponentPickerViewController.m
//  07 Pickers
//
//  Created by tomandhua on 16/6/14.
//  Copyright © 2016年 tomandhua. All rights reserved.
//

#import "BIDSingleComponentPickerViewController.h"

@interface BIDSingleComponentPickerViewController ()
@property (strong, nonatomic) IBOutlet UIPickerView *singlePicker;
@property (strong, nonatomic) NSArray * characterNames;

@end

@implementation BIDSingleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.characterNames = @[@"张学友", @"刘德华", @"周杰伦", @"陈奕迅", @"小李子", @"唐尼", @"卷福"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(id)sender {
    NSInteger row = [self.singlePicker selectedRowInComponent:0];
    NSString * selected = self.characterNames[row];
    NSString * title = [[NSString alloc] initWithFormat:@"You selected %@", selected] ;
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:@"Think you for choosing" delegate:nil cancelButtonTitle:@"You are Welcome" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.characterNames count];
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.characterNames[row];
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
