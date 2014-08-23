//
//  GraphMottainaiViewController.m
//  MOTTAINAI
//
//  Created by Kouki Saito on 2014/05/18.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import "GraphMottainaiViewController.h"

@interface GraphMottainaiViewController ()

@end

@implementation GraphMottainaiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.termSelectionSegment addTarget:self
                                  action:@selector(segmentValueChanged:)
                        forControlEvents:UIControlEventValueChanged];

    
    self.chartLabels = @{
                      @"0":@[NSLocalizedString(@"3months", nil),
                             NSLocalizedString(@"2months",nil),
                             NSLocalizedString(@"1month",nil),
                             NSLocalizedString(@"this month",nil)
                            ],
                      @"1":@[NSLocalizedString(@"3weeks", nil),
                             NSLocalizedString(@"2weeks",nil),
                             NSLocalizedString(@"1week",nil),
                             NSLocalizedString(@"this week",nil)
                             ],
                      @"2":@[NSLocalizedString(@"3days", nil),
                             NSLocalizedString(@"2days",nil),
                             NSLocalizedString(@"yesterday",nil),
                             NSLocalizedString(@"today",nil)
                             ],
                      @"3":@[NSLocalizedString(@"4hours", nil),
                             NSLocalizedString(@"3hours",nil),
                             NSLocalizedString(@"2hours",nil),
                             NSLocalizedString(@"1hour",nil)
                             ],
                    };
    
        
    self.selectedTerm = @"0";
}

- (void)segmentValueChanged:(id)sender
{
    UISegmentedControl *segment = (UISegmentedControl*) sender;
    self.selectedTerm = [[NSString alloc] initWithFormat:@"%ld",(long)segment.selectedSegmentIndex];
    
    [self drawGraph];
}

- (NSArray*)getMottainaiDataWithTerm:(NSInteger) term numberOfLimit:(NSInteger)limit
{
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.mottainai = [appDelegate getAllMottainai];
    
    NSMutableArray *mottainaiData = [NSMutableArray array];
    for(int i = 0; i < limit; i++){
        [mottainaiData addObject:@0];
    }
    
    NSDate *now = [NSDate date];
    for(Mottainai *mottainai in self.mottainai){
        NSTimeInterval delta = [now timeIntervalSinceDate:mottainai.created];
        NSInteger dataPos = (NSInteger) delta / term;
        if(dataPos < limit){
            dataPos = limit-dataPos-1;
            mottainaiData[dataPos] =@( [ mottainaiData[dataPos] intValue] + 1 );
        }
    }
    
    return mottainaiData;
}

- (NSInteger)getTerm
{
    switch([self.selectedTerm intValue]){
        case 0:
            return 30*24*60*60;
        case 1:
            return 7*24*60*60;
        case 2:
            return 1*24*60*60;
        case 3:
            return 1*60*60;
    }
    return 0;
}

- (void)drawGraph
{

    //ラベル削除
    for (UIView *view in [self.lineChart subviews]) {
        [view removeFromSuperview];
    }
    
    NSArray *labels = [self.chartLabels valueForKey:self.selectedTerm];
    [self.lineChart setXLabels:labels];
    NSArray *mottainaiData = [self getMottainaiDataWithTerm:[self getTerm]
                                              numberOfLimit:[labels count]];


    PNLineChartData *data01 = [PNLineChartData new];
    data01.color = PNFreshGreen;
    data01.itemCount = self.lineChart.xLabels.count;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [mottainaiData[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };

    self.lineChart.chartData = @[data01];
    [self.lineChart strokeChart];

}

- (void)viewWillAppear:(BOOL)animated
{
    [self drawGraph];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
