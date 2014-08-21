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
                      @"0":@[@"3ヶ月前",@"2ヶ月前",@"先月",@"今月"],
                      @"1":@[@"3週前",@"先々週",@"先週",@"今週"],
                      @"2":@[@"3日前",@"一昨日",@"昨日",@"今日"],
                      @"3":@[@"4時間前",@"3時間前",@"2時間前",@"1時間前"],
                    };
    
    self.selectedTerm = @"3";
}

- (void)segmentValueChanged:(id)sender
{
    UISegmentedControl *segment = (UISegmentedControl*) sender;
    self.selectedTerm = [[NSString alloc] initWithFormat:@"%ld",(long)segment.selectedSegmentIndex];
    
    [self drawGraph];
}

- (void)drawGraph
{

    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.mottainai = [appDelegate getAllMottainai];

    /* 集計関数の使い方がわからないからループで集計 */
    // TODO

    for (UIView *view in [self.lineChart subviews]) {
        [view removeFromSuperview];
    }
    
    NSArray *labels = [self.chartLabels valueForKey:self.selectedTerm];
    [self.lineChart setXLabels:labels];
    
    NSArray * data01Array = @[@60.1, @160.1, @126.4, @262.2];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.color = PNFreshGreen;
    data01.itemCount = self.lineChart.xLabels.count;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
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
