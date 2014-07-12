//
//  Game.m
//  Flap bird
//
//  Created by Luke Wilkinson on 2014/07/10.
//  Copyright (c) 2014 OddDog. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(void)GameOver
{
    if (ScoreNumber > HighScoreNumber)
    {
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
    
    [GreenMovement invalidate];
    [BirdMovement invalidate];
    
    Menu.hidden = NO;
    Exit.hidden = NO;
    GreenTop.hidden = YES;
    GreenBottom.hidden = YES;
    Bird.hidden = YES;
    
}


-(void)Score
{
    ScoreNumber = ScoreNumber + 1;
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
    
}

-(IBAction)StartGame:(id)sender;
{
    GreenBottom.hidden = NO;
    GreenTop.hidden = NO;
    
    Startgame.hidden = YES;
    
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    
    [self PlaceGreen];
    
    GreenMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(GreenMoving) userInfo:nil repeats:YES];
    
}

-(void)GreenMoving
{
    GreenTop.center = CGPointMake(GreenTop.center.x - 1.5, GreenTop.center.y);
    GreenBottom.center = CGPointMake(GreenBottom.center.x - 1.5, GreenBottom.center.y);
    
    if (GreenTop.center.x < -28)
    {
        [self PlaceGreen];
    }
    
    if (GreenTop.center.x  == 14.5)
    {
        [self Score];
    }
    
    if (CGRectIntersectsRect(Bird.frame, GreenTop.frame))
    {
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, GreenBottom.frame))
    {
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Top.frame))
    {
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Bottom.frame))
    {
        [self GameOver];
    }
    
}

-(void)PlaceGreen
{
    RandomTopGreenPosition = arc4random() %350;
    RandomTopGreenPosition = RandomTopGreenPosition - 228;
    RandomBottomGreenPosition = RandomTopGreenPosition + 655;
    
    GreenTop.center = CGPointMake(340, RandomTopGreenPosition);
    GreenBottom.center = CGPointMake(340, RandomBottomGreenPosition);
    
}

//BIRD MOVEMENT
-(void)BirdMoving;
{
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - BirdFlight);
    
    BirdFlight = BirdFlight - 7;
    
    if(BirdFlight < - 15)
    {
        BirdFlight = - 15;
    }
    
    if (BirdFlight > 0)
    {
        Bird.image = [UIImage imageNamed:@"bird3.png"];
    }
    
    if (BirdFlight < 0)
    {
        Bird.image = [UIImage imageNamed:@"bird1.png"];
    }
}
//BIRD MOVEMENT

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    BirdFlight = 30;
    
}


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
    GreenTop.hidden = YES;
    GreenBottom.hidden = YES;
    
    Menu.hidden = YES;
    Exit.hidden = YES;
    ScoreNumber = 0;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
