//
//  MainViewController.m
//  MOTTAINAI
//
//  Created by Kouki Saito on 2014/05/11.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)touchMottainai:(id)sender {
    NSLog(@"You feel MOTTAINAI!!");
    
    Mottainai *newMottainai = [NSEntityDescription insertNewObjectForEntityForName:@"Mottainai"
                                                         inManagedObjectContext:self.managedObjectContext];
    
    newMottainai.created = [NSDate date] ;
    newMottainai.sync = false;
    NSError *error;
    if (![self.managedObjectContext save:&error]){
        NSLog(@"save failed: %@", [error localizedDescription]);
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;

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
