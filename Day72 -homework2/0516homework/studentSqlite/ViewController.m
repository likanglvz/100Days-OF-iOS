//
//  ViewController.m
//  studentSqlite
//
//  Created by 李康 on 16/5/16.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "ViewController.h"
//#import <sqlite3.h>
#import "FMDB.h"



@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *num;
@property (weak, nonatomic) IBOutlet UITextField *classname;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UILabel *status;

@end

@implementation ViewController

{
        FMDatabase *db;
    int currentID;
    
}

-(NSString *)dataFilePath{
    //返回数据库文件路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDir = paths[0];
    
    NSLog(@"%@",documentDir);
    
    return [documentDir stringByAppendingPathComponent:@"data.sqlite"];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",[self dataFilePath]);
    db = [FMDatabase databaseWithPath:[self dataFilePath]];
    //打开数据库的连接
    if ([db open]) {                        //(创建)
        
        NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS INFO(ID INTEGER PRIMARY KEY AUTOINCREMENT, NUM TEXT, CLASSNAME TEXT, NAME TEXT)";        //执行sql语句 （不返回结果的）
        BOOL res = [db executeUpdate:sqlCreateTable];
        if (!res) {
            
            NSLog(@"创建db table失败");
            
        }else{
            
            NSLog(@"创建表成功");
        }
        
    }

//     NSString *query = @"SELECT ID,NUM,CLASSNAME,NAME FROM INFO ORDER BY ID";
//    
//    FMResultSet *rs = [db executeQuery:query];
//
//    while ([rs next]) {
//        
//       self.num.text = [rs stringForColumn:@"NUM"];
//        
//       self.classname.text = [rs stringForColumn:@"CLASSNAME"];
//        
//       self.name.text = [rs stringForColumn:@"NAME"];
//        
//        currentID = [rs intForColumn:@"ID"];
//    
//    }
//    [db close];

}
- (IBAction)save:(id)sender {
    
    if ([db open]) {
        
        NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO INFO (num,classname,name) VALUES('%@','%@','%@')",self.num.text,self.classname.text,self.name.text];
        
        BOOL res = [db executeUpdate:insertSql];
        if (!res) {
            
            NSLog(@"写入失败");
            
        }else{
            self.status.text=@"保存成功";
            self.num.text = @"";
            self.classname.text = @"";
            self.name.text = @"";

            NSLog(@"写入成功");
        }

        [db close];
        
    }
}
- (IBAction)last:(id)sender {
    if ([db open]) {
        
         NSString *query = @"SELECT * FROM INFO ORDER BY ID";
        
        FMResultSet *rs = [db executeQuery:query];
        while ([rs next]) {
        int idd = [rs intForColumn:@"ID"];
        
        if (idd == currentID-1) {
            
            self.num.text = [rs stringForColumn:@"NUM"];
            
            self.classname.text = [rs stringForColumn:@"CLASSNAME"];
            
            self.name.text = [rs stringForColumn:@"NAME"];
     
            currentID-=1;
            
            
        }
        }
        [db close];
        
    }

}
- (IBAction)next:(id)sender {
    if ([db open]) {
        
        NSString *query = @"SELECT * FROM INFO ORDER BY ID";
        
        FMResultSet *rs = [db executeQuery:query];
        while ([rs next]) {
        int idd = [rs intForColumn:@"ID"];
           
        
        if (idd == currentID+1) {
             NSLog(@"%d",idd);
            self.num.text = [rs stringForColumn:@"NUM"];
            
            self.classname.text = [rs stringForColumn:@"CLASSNAME"];
            
            self.name.text = [rs stringForColumn:@"NAME"];
            
            currentID+=1;
            
            
        }
        }
        [db close];
        
    }
    

    
}
- (IBAction)search:(id)sender {
    

    if ([db open]) {
        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM INFO WHERE NUM = '%@'",self.num.text];
        
        FMResultSet *rs = [db executeQuery:querySql];
        while ([rs next]) {
            
            self.classname.text = [rs stringForColumn:@"CLASSNAME"];
            
            self.name.text = [rs stringForColumn:@"NAME"];
            
            currentID = [rs intForColumn:@"ID"];
            
        }
        
    }
    [db close];
}



- (IBAction)clear:(id)sender {
    self.num.text = @"";
    self.classname.text = @"";
    self.name.text = @"";
    self.status.text = @"";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
