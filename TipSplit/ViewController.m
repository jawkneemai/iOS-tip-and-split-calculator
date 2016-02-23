//
//  ViewController.m
//  TipSplit
//
//  Created by Johnathan Mai on 2/10/16.
//  Copyright © 2016 Johnathan Mai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

    @property (weak, nonatomic) IBOutlet UITextField *textFieldBill;
    @property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlTax;
    @property (weak, nonatomic) IBOutlet UISwitch *switchTax;
    @property (weak, nonatomic) IBOutlet UISlider *sliderTipAmount;
    @property (weak, nonatomic) IBOutlet UILabel *textTipAmount;
    @property (weak, nonatomic) IBOutlet UILabel *textSplitAmount;
    @property (weak, nonatomic) IBOutlet UIStepper *stepperSplitAmount;
    @property (weak, nonatomic) IBOutlet UILabel *textTotalTax;
    @property (weak, nonatomic) IBOutlet UILabel *textTotalNoTip;
    @property (weak, nonatomic) IBOutlet UILabel *textFinalTip;
    @property (weak, nonatomic) IBOutlet UILabel *textTotalWithTip;
    @property (weak, nonatomic) IBOutlet UILabel *textTotalPerPerson;

@property float billAmount, taxPercent, totalTax, tipPercent, totalAmountForTip, totalTip, billAmountWithTip, totalSplit;
@property int splitNum;
@property bool includeTax;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeValues];
    [self initializeValues];
    
}

- (IBAction)taxSwitchPressed:(id)sender {
    [self updateValues];
}

- (IBAction)billInputed:(id)sender {
    NSString* total = self.textFieldBill.text;
    self.billAmount = [total floatValue];
    [self updateValues];
}

- (IBAction)segmentedControlChange:(id)sender {
    switch (self.segmentedControlTax.selectedSegmentIndex) {
        case 0:
            self.taxPercent = 0.075;
            break;
        case 1:
            self.taxPercent = 0.08;
            break;
        case 2:
            self.taxPercent = 0.085;
            break;
        case 3:
            self.taxPercent = 0.09;
            break;
        case 4:
            self.taxPercent = 0.095;
            break;
        default:
            break;
    }
    [self updateValues];
}

- (IBAction)sliderChanged:(id)sender {
    self.tipPercent = (self.sliderTipAmount.value) / 100;
    self.textTipAmount.text = [NSString stringWithFormat:@"%.f%%", self.sliderTipAmount.value];
    [self updateValues];
}

- (IBAction)stepperChanged:(id)sender {
    self.splitNum = self.stepperSplitAmount.value;
    self.textSplitAmount.text = [NSString stringWithFormat:@"%i", self.splitNum];
    [self updateValues];
}

- (IBAction)clearAll:(id)sender {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle: @"Are you sure?"
                                          message: @"Are you really sure?"
                                          preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style: UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action) {
                                       NSLog(@"Cancel Action");
                                   }];
    UIAlertAction *clearAllAction = [UIAlertAction
                                     actionWithTitle:@"Clear All"
                                     style: UIAlertActionStyleDestructive
                                     handler:^(UIAlertAction *action) {
                                         self.textTipAmount.text = @"15%";
                                         self.textSplitAmount.text = @"1";
                                         self.textTotalTax.text = @"0.00";
                                         self.textTotalNoTip.text = @"0.00";
                                         self.textFinalTip.text = @"0.00";
                                         self.textTotalWithTip.text = @"0.00";
                                         self.textTotalPerPerson.text = @"0.00";
                                         self.textFieldBill.text = @"";
                                         
                                         [self initializeValues];
                                         [self.segmentedControlTax setSelectedSegmentIndex: 0];
                                         [self.sliderTipAmount setValue: 15 animated: true];
                                         [self.stepperSplitAmount setValue: 1];
                                         [self.switchTax setOn: true animated: true];
                                     }];
    [alertController addAction: cancelAction];
    [alertController addAction: clearAllAction];
    [self presentViewController: alertController animated: YES completion: nil];
}


- (void) initializeValues {
    self.billAmount = 0.0;
    self.taxPercent = 0.075;
    self.totalTax = 0.0;
    self.tipPercent = 0.15;
    self.totalAmountForTip = 0.0;
    self.totalTip = 0.0;
    self.billAmountWithTip = 0.0;
    self.totalSplit = 0.0;
    self.splitNum = 1;
    self.includeTax = true;
}

- (void) updateValues {
    // calculate values
    self.totalTax = (self.billAmount) * (self.taxPercent);
    self.totalAmountForTip = (self.billAmount) + (self.totalTax);
    if (self.switchTax.on == false) {
        self.totalAmountForTip = self.billAmount;
    } else {
        self.totalAmountForTip = (self.billAmount) + (self.totalTax);
    }
    self.totalTip = (self.tipPercent) * (self.totalAmountForTip);
    self.billAmountWithTip = (self.billAmount) + self.totalTax + self.totalTip;
    self.totalSplit = (self.billAmountWithTip) / (self.splitNum);
    
    
    // Set text of UI
    self.textTotalTax.text = [NSString stringWithFormat: @"%.02f", self.totalTax];
    self.textTotalNoTip.text = [NSString stringWithFormat: @"%.02f", self.totalAmountForTip];
    self.textFinalTip.text = [NSString stringWithFormat: @"%.02f", self.totalTip];
    self.textTotalWithTip.text = [NSString stringWithFormat: @"%.02f", self.billAmountWithTip];
    self.textTotalPerPerson.text = [NSString stringWithFormat: @"%.02f", self.totalSplit];
}

- (IBAction)backgroundTouched:(id)sender {
    [self.textFieldBill resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
