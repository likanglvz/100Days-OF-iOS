#include<stdio.h>
#include<string.h>
#define LEN 5
int main1(){
    struct scoreRecord{
        int no;
        char *name;
        int score;
    };
    
    struct scoreRecord s1={1,"jack",60};
    struct scoreRecord s2={2,"jack1",60};
    // int age[40];
    struct scoreRecord records[2]={{1,"jack",60},{2,"jack1",60}};
    
    records[0].score=89;
    for (int i=0; i<2; i++) {
        printf("%d,%s,%d\n",records[i].no,records[i].name,records[i].score);
    }
    return 0;
}
struct Person{
    char *name;
    int age;
};
void printStruct(struct Person s1[]);
void stusSort(struct Person s[],int (*comp)());
int main2(){
        struct Person stus[5]={{"jack",23},{"rose",45},{"jerry",89},{"tom",90},{"nana",34}};
    //输出
//    for (int i=0; i<5; i++) {
//        printf("%s,%d\n",stus[i].name,stus[i].age);
//    }
    printStruct(stus);
    //按age进行排序
    for (int i=0; i<5; i++) {
        for (int j=0; j<4-i; j++) {
            if (stus[j].age>stus[j+1].age) {
//                int temp;
//                temp=stus[j].age;
//                stus[j].age=stus[j+1].age;
//                stus[j+1].age=temp;
                struct Person temp;
                temp=stus[j];
                stus[j]=stus[j+1];
                stus[j+1]=temp;
                
            }
        }
    }
    printf("按age排序后的：\n");
//    for (int i=0; i<5; i++) {
//        printf("%s,%d\n",stus[i].name,stus[i].age);
//    }
    printStruct(stus);
    for (int i=0; i<5; i++) {
        for (int j=0; j<4-i; j++) {
            if (strcmp(stus[j].name,stus[j+1].name)>0) {
                struct Person temp;
                temp=stus[j];
                stus[j]=stus[j+1];
                stus[j+1]=temp;
            }
        }
    }
    printf("按name排序后的：\n");
//    for (int i=0; i<5; i++) {
//        printf("%s,%d\n",stus[i].name,stus[i].age);
//    }
//
    printStruct(stus);
    return 0;
}
void printStruct(struct Person s1[]){
    for (int i=0; i<5; i++) {
        printf("%s,%d\n",s1[i].name,s1[i].age);
    }
    return;
}
void stusSort(struct Person s[],int (*comp)()){
    for (int i=0; i<LEN; i++) {
        for (int j=0; j<LEN-i-1; j++) {
            if (comp(s[j],s[j+1])>0) {
                struct Person temp;
                temp=s[j];
                s[j]=s[j+1];
                s[j+1]=temp;
            }
        }
    }

}
int cmpAge(struct Person s1,struct Person s2){]
    return s1.age-s2.age;
}

int cmpName(struct Person s1,struct Person s2){
    return strcmp(s1.name,s2.name);
    
}
int main(){
    struct Person stus[5]={{"jack",23},{"rose",45},{"jerry",89},{"tom",90},{"nana",34}};
     printStruct(stus);
    stusSort(stus,cmpAge);
    printf("按age排序后:\n");
     printStruct(stus);
    
    stusSort(stus,cmpName);
    
    printf("按name排序后:\n");
    printStruct(stus);
    
    
    return 0;
}



