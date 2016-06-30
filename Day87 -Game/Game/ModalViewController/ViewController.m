
//

#import "ViewController.h"
#import "RegisterViewController.h"
#import "FMDB.h"
#import "pokerViewController.h"
@interface ViewController ()
{
    FMDatabase *db;
}
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *codeNumber;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(registerCompletion:) name:@"RegisterCompletionNotification" object:nil];
    
    
}
//由通知得到数据
-(void)registerCompletion:(NSNotification *)notification
{
    
    NSDictionary *theData =[notification userInfo];
    NSString *username =[theData objectForKey:@"userID"];
    NSString *userCodeNumber =[theData objectForKey:@"userCode"];
    _codeNumber.text=userCodeNumber;
    _userName.text =username;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerButtonPressed:(UIButton *)sender {
    //获得故事版对象
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //用故事版去实例化一个
    UIViewController *registerViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"registerViewController"];
    //视图切换的样式
    registerViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:registerViewController animated:YES completion:^{NSLog(@"present Modal View");}];
}

-(NSString *)dataFilePath//返回文件路径
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir=paths[0];
    NSLog(@"%@/data4.sqlite",documentDir);
    return [documentDir stringByAppendingPathComponent:@"data4.sqlite"];
}
- (IBAction)enterPokerGame:(UIButton *)sender {
    db =[FMDatabase databaseWithPath:[self dataFilePath]];
    if([db open])
    {
       // NSString * query = [NSString stringWithFormat:@"SELECT CODE FROM INFO WHERE NAME = %@",_userName.text];
//        NSString *query =[NSString stringWithFormat:@"SELECT CODE FROM INFO(NAME) VALUES('%@')",_userName.text];
        NSString *query =[NSString stringWithFormat:@"SELECT * FROM INFO WHERE  NAME ='%@'",_userName.text];
        FMResultSet *rs = [db executeQuery:query];
//        if(rs ==nil)
//        {
//            UIAlertController * controller = [UIAlertController alertControllerWithTitle:@"账号密码有错,请重新登录或注册" message:nil preferredStyle:UIAlertControllerStyleAlert];
//            
//            
//            UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:nil];
//            [controller addAction:cancelAction];
//            
//            [self presentViewController:controller animated:YES completion:nil];
//        }
//        else{
        while ([rs next]) {
            
            NSString *text1 =[rs stringForColumn:@"CODE"];
            NSString *text2 =[rs stringForColumn:@"NAME"];
            NSLog(@"%@",text2);
            if([text1 isEqualToString:_codeNumber.text]&&[text2 isEqualToString:_userName.text])
            {
                NSLog(@"登录成功");
                UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                //用故事版去实例化一个
                UIViewController *pokerViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"pokerController"];
                //视图切换的样式
                pokerViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
                
                [self presentViewController:pokerViewController animated:YES completion:^{NSLog(@"切换pokerViewController成功");}];
            }
            
            else{
            
            UIAlertController * controller = [UIAlertController alertControllerWithTitle:@"账号密码有错,请重新登录或注册" message:nil preferredStyle:UIAlertControllerStyleAlert];
            
            
            UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:nil];
            [controller addAction:cancelAction];
            
            [self presentViewController:controller animated:YES completion:nil];
        }
        
        
        }
        if(![rs next])
        {
            UIAlertController * controller = [UIAlertController alertControllerWithTitle:@"账号密码有错,请重新登录或注册" message:nil preferredStyle:UIAlertControllerStyleAlert];
            
            
            UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:nil];
            [controller addAction:cancelAction];
            
            [self presentViewController:controller animated:YES completion:nil];
        }
        [db close];
        
    }
}


@end
