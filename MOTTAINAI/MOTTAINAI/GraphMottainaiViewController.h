//
//  GraphMottainaiViewController.h
//  MOTTAINAI
//
//  Created by Kouki Saito on 2014/05/18.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Mottainai.h"
#import "AppDelegate.h"

#import "PNChart.h"

@interface GraphMottainaiViewController : UIViewController

@property (strong, nonatomic) NSArray *mottainai;
@property (weak, nonatomic) IBOutlet PNLineChart *lineChart;
@property (weak, nonatomic) IBOutlet UISegmentedControl *termSelectionSegment;
@property (strong, nonatomic) NSDictionary *chartLabels;
@property NSString *selectedTerm;

@end
