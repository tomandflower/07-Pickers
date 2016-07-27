//
//  BIDCustomPickerViewController.m
//  07 Pickers
//
//  Created by tomandhua on 16/6/14.
//  Copyright © 2016年 tomandhua. All rights reserved.
//

#import "BIDCustomPickerViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface BIDCustomPickerViewController ()
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UILabel *winLabel;
@property (strong, nonatomic) IBOutlet UIButton *button;

@property (strong, nonatomic) NSArray * images;

@end

@implementation BIDCustomPickerViewController {
    SystemSoundID winsoundID;
    SystemSoundID crunchSoundID;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.images = @[[UIImage imageNamed:@"aestheticism_star"],
                    [UIImage imageNamed:@"attention_icon_s"],
                    [UIImage imageNamed:@"site_icon"],
                    [UIImage imageNamed:@"circle_blue_bg"],
                    [UIImage imageNamed:@"crown_icon"],
                    [UIImage imageNamed:@"diamond_blue"]];
    srandom(time(NULL));
}

- (void)showButton {
    self.button.hidden = NO;
}

- (void)playWithSound {
    if (winsoundID == 0) {
        NSURL * soundURL = [[NSBundle mainBundle] URLForResource:@"02" withExtension:@"WAV"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &winsoundID);
    }
    AudioServicesPlaySystemSound(winsoundID);
    self.winLabel.text = @"WINNING!";
    [self performSelector:@selector(showButton) withObject:nil afterDelay:1.5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)spin:(id)sender {
    BOOL win = NO;
    int numInRow = 1;
    int lastVal = -1;
    for (int i = 0; i < 5; i++) {
        int newValue = random()%[self.images count];
        if (newValue == lastVal) {
            numInRow++;
        } else {
            numInRow = 1;
        }
        lastVal = newValue;
        
        [self.picker selectRow:newValue inComponent:i animated:YES];
        [self.picker reloadComponent:i];
        if (numInRow >= 3) {
            win = YES;
        }
        
    }
    if (crunchSoundID == 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"13" ofType:@"WAV"];
        
        NSURL * soundURL = [NSURL fileURLWithPath:path];
        
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &crunchSoundID);
    }
    AudioServicesPlaySystemSound(crunchSoundID);
    
    if (win) {
        [self performSelector:@selector(playWithSound) withObject:nil afterDelay:0.5];
         
    } else {
        [self performSelector:@selector(showButton) withObject:nil afterDelay:0.5];
    }
    self.button.hidden = YES;
    self.winLabel.text = @"";
    
//    if (win) {
//        self.winLabel.text = @"WIN!";
//    } else {
//        self.winLabel.text = @"";
//    }
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 5;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.images count];
}

#pragma mark Picker Delegate Methods
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UIImage * image = self.images[row];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    return imageView;
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
