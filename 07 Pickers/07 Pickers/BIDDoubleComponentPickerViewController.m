//
//  BIDDoubleComponentPickerViewController.m
//  07 Pickers
//
//  Created by tomandhua on 16/6/14.
//  Copyright © 2016年 tomandhua. All rights reserved.
//

#import "BIDDoubleComponentPickerViewController.h"

#define kFillingComponent 0
#define kBreadComponent 1

@interface BIDDoubleComponentPickerViewController ()
@property (strong, nonatomic) IBOutlet UIPickerView *doublePicker;
@property (strong, nonatomic) NSArray * fillingTypes;
@property (strong, nonatomic) NSArray * breadTypes;

@end

@implementation BIDDoubleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fillingTypes = @[@"火腿", @"火鸡肉", @"花生酱", @"金枪鱼色拉", @"鸡肉色拉", @"烤牛肉", @"蔬菜"];
    self.breadTypes = @[@"白面包",@"全麦", @"黑麦", @"酸面包", @"杂粮"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(id)sender {
    NSInteger fillingRow = [self.doublePicker selectedRowInComponent:kFillingComponent];
    NSInteger breadRow = [self.doublePicker selectedRowInComponent:kBreadComponent];
    
    NSString *filling = self.fillingTypes[fillingRow];
    NSString *bread = self.breadTypes[breadRow];
    NSString *message = [[NSString alloc] initWithFormat:@"Your %@ and %@ bread will be right up.", filling, bread];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank you for your order" message:message delegate:nil cancelButtonTitle:@"Great!" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == kBreadComponent) {
        return [self.breadTypes count];
    } else {
        return [self.fillingTypes count];
    }
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == kBreadComponent) {
        return self.breadTypes[row];
    } else {
        return self.fillingTypes[row];
    }
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
