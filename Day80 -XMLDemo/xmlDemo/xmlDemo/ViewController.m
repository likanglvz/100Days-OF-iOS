//
//  ViewController.m
//  xmlDemo
//
//  Created by baiheng on 16/5/24.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "ViewController.h"
#import "TBXML.h"
#import "TBXML+HTTP.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *toLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputUrlField;

//当前标签的名字
@property(strong,nonatomic) NSString * currentTagName;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)parse:(id)sender {
    
    //http://127.0.0.1/note.xml
    NSString * string = self.inputUrlField.text;
    
    NSString * path;
    NSURL * url;
    
    
    if ([string isEqualToString:@""]) {
        //本地的
        path = [[NSBundle mainBundle]pathForResource:@"note" ofType:@"xml"];
        //将路径转为url
        url = [NSURL fileURLWithPath:path];

    }else
    {
        url = [NSURL URLWithString:string];
        
    }
    
    
    //创建xml解析器
    NSXMLParser * parser = [[NSXMLParser alloc]initWithContentsOfURL:url];
    
    parser.delegate = self;
    
//开始解析
    [parser parse];
    

}

- (IBAction)tbxmlStart:(id)sender {
    
    /*
    //创建xml对象
    TBXML * tbxml = [[TBXML alloc]initWithXMLFile:@"note.xml" error:nil];
    //根元素
    TBXMLElement * root = tbxml.rootXMLElement;
    
    if (root) {
        
        //得到子元素
        TBXMLElement * toElement = [TBXML childElementNamed:@"to" parentElement:root];
        
        if (toElement != nil) {
            //取toelement标签中的文本，显示
            self.toLabel.text = [TBXML textForElement:toElement];
            
        }
        
        
        //得到子元素
        TBXMLElement * contentElement = [TBXML childElementNamed:@"content" parentElement:root];
        
        if (contentElement != nil) {
            //取toelement标签中的文本，显示
            self.contentLabel.text = [TBXML textForElement:contentElement];
            
        }

        
        //得到子元素
        TBXMLElement * fromElement = [TBXML childElementNamed:@"from" parentElement:root];
        
        if (fromElement != nil) {
            //取toelement标签中的文本，显示
            self.fromLabel.text = [TBXML textForElement:fromElement];
            
        }
        

        //得到子元素
        TBXMLElement * dateElement = [TBXML childElementNamed:@"date" parentElement:root];
        
        if (dateElement != nil) {
            //取toelement标签中的文本，显示
            self.dateLabel.text = [TBXML textForElement:dateElement];
            
        }
        
        
        
    }
    
    */
    
    
    TBXMLSuccessBlock s = ^(TBXML * tbxml){
        
        TBXMLElement * root = tbxml.rootXMLElement;
        
        if (root) {
            
            //得到子元素
            TBXMLElement * toElement = [TBXML childElementNamed:@"to" parentElement:root];
            
            if (toElement != nil) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    //取toelement标签中的文本，显示
                    self.toLabel.text = [TBXML textForElement:toElement];
                });
            }
            
            //得到子元素
            TBXMLElement * contentElement = [TBXML childElementNamed:@"content" parentElement:root];
            
            if (contentElement != nil) {
                 dispatch_sync(dispatch_get_main_queue(), ^{
                //取toelement标签中的文本，显示
                self.contentLabel.text = [TBXML textForElement:contentElement];
                });
            }
            //得到子元素
            TBXMLElement * fromElement = [TBXML childElementNamed:@"from" parentElement:root];
            
            if (fromElement != nil) {
                 dispatch_sync(dispatch_get_main_queue(), ^{
                //取toelement标签中的文本，显示
                self.fromLabel.text = [TBXML textForElement:fromElement];
                });
            }
            //得到子元素
            TBXMLElement * dateElement = [TBXML childElementNamed:@"date" parentElement:root];
            
            if (dateElement != nil) {
                 dispatch_sync(dispatch_get_main_queue(), ^{
                //取toelement标签中的文本，显示
                self.dateLabel.text = [TBXML textForElement:dateElement];
                });
            }
            
            
            
        }
        
        
    };
    

    TBXMLFailureBlock f = ^(TBXML * tbxml, NSError * error){
        NSLog(@"%@",error);
        
    };
    
    
    //通过url创建tbxml对象
    TBXML * tbxml = [[TBXML alloc]initWithURL:[NSURL URLWithString: @"http://192.168.2.8/note.xml"] success:s  failure:f ];
    
    
    
    
    
}
- (IBAction)jsonParse:(id)sender {
    //解析json文档
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
  //  NSString * path = [[NSBundle mainBundle]pathForResource:@"note" ofType:@"json"];
    NSString * path = self.inputUrlField.text;
    NSURL * url = [NSURL URLWithString:path];
    
    //读入json文件 到nsdata
    //NSData * jsonData = [[NSData alloc]initWithContentsOfFile:path];
    NSData * jsonData = [[NSData alloc]initWithContentsOfURL:url];
    
    NSError * error;
    
    //从json文档解析出objective c的对象（由json数据返回foundation对象），option选项3个，分别：返回可变字典或数组，2，返回可变字符串（叶子），3，允许最外层不是字典或数组。
    
//    NSDictionary * dict1 = @{@"key":@"value"};
//    //将foundation对象写成json格式
//    NSData * data = [NSJSONSerialization dataWithJSONObject:dict1 options:0 error:nil];
//    
    //NSString * string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    //从json格式读入解析为oc对象
//    NSDictionary * dict2 = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//    
//    NSMutableString * ms = [dict2 objectForKey:@"key"];
//    ms.string = @"sss";
    
//    NSString * num  = @"\"abcd\"";
//    //将字符串转为data
//    NSData * createData = [num dataUsingEncoding:NSUTF8StringEncoding];
//    
//    id response = [NSJSONSerialization JSONObjectWithData:createData options:NSJSONReadingAllowFragments error:nil];
//    
//    
//    NSLog(@"response=%@",response);

    
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    if (error) {
        NSLog(@"解析失败 %@",error);
        return;
        
    }
    
    dict = jsonObj;
    self.toLabel.text = dict[@"to"];
    self.contentLabel.text = dict[@"content"];
    self.fromLabel.text = dict[@"from"];
    self.dateLabel.text = dict[@"date"];
    
    
    
}


#pragma mark - nsxml parse
-(void)parserDidStartDocument:(NSXMLParser *)parser
{//文档开始时触发，调用一次
    NSLog(@"start document");
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{//解析出错时触发
    NSLog(@"%@",parseError);
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{//遇到开始标签时触发
   
    _currentTagName = elementName;
    
    
    
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{//遇到字符串时触发
    
    //如果当前标签是to，且碰到字符串，
    if ([_currentTagName isEqualToString:@"to"]) {
        self.toLabel.text = string;
        
    }
    
  
    if ([_currentTagName isEqualToString:@"content"]) {
        self.contentLabel.text = string;
        
    }
    
    if ([_currentTagName isEqualToString:@"from"]) {
        self.fromLabel.text = string;
        
    }
    
    if ([_currentTagName isEqualToString:@"date"]) {
        self.dateLabel.text = string;
        
    }
    
    
    
    
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{//遇到结束标签时触发
    self.currentTagName = nil;
    
}

-(void)parserDidEndDocument:(NSXMLParser *)parser
{//文档结束时触发
    NSLog(@"解析完毕");
}


@end















