
//

#import "RegisterViewController.h"
#import "FMDB.h"
#import "ViewController.h"
@interface RegisterViewController ()
{
    FMDatabase *db;
}
@property (weak, nonatomic) IBOutlet UITextField *userID;
@property (weak, nonatomic) IBOutlet UITextField *codeNumber;
@property (weak, nonatomic) IBOutlet UITextField *codeNumberConfirm;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    //用故事版去实例化一个
//    ViewController *viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"viewController"];
//    
//    viewController.path =[self dataFilePath];
    
    
    db=[FMDatabase databaseWithPath:[self dataFilePath]];
    if([db open])
    {
        NSString *sqlCreateTable=@"CREATE TABLE IF NOT EXISTS INFO(ROW INTEGER PRIMARY KEY,NAME TEXT,CODE TEXT)";
        //执行sql语句（不返回结果的）
        BOOL res = [db executeUpdate:sqlCreateTable];
        if (!res) {
            NSLog(@"创建db 表失败");
        }
        else{
            NSLog(@"创建表成功");
        }
        [db close];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)done:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:^{NSLog(@"点击Done按钮，关闭模态视图");}];
}
- (IBAction)save:(UIBarButtonItem *)sender {
    if([_codeNumber.text isEqualToString:_codeNumberConfirm.text]){
    
        if([db open])
        {
            NSString *update =[NSString stringWithFormat:@"INSERT OR REPLACE INTO INFO(NAME,CODE) VALUES('%@','%@')",_userID.text,_codeNumber.text];
            
            BOOL res=[db executeUpdate:update];
            if (!res) {
                NSLog(@"写入失败");
            }
            else{
                NSLog(@"保存成功");
            }
            
            
            [db close];
            
        }
        
        [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"点击save按钮，关闭模态视图");
        NSDictionary *dataDict =@{@"userID":self.userID.text,@"userCode":self.codeNumber.text};
        [[NSNotificationCenter defaultCenter]postNotificationName:@"RegisterCompletionNotification" object:nil userInfo:dataDict];
        }];
    }
    else//如果输入密码与确认密码不一致,警告告诉用户请重新输入密码
    {
        UIAlertController * controller = [UIAlertController alertControllerWithTitle:@"请确认密码输入" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:nil];
        [controller addAction:cancelAction];
        
        [self presentViewController:controller animated:YES completion:nil];
    }
}

-(NSString *)dataFilePath//返回文件路径
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir=paths[0];
    NSLog(@"%@/data4.sqlite",documentDir);
    return [documentDir stringByAppendingPathComponent:@"data4.sqlite"];
}


@end
