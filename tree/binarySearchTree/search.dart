class family{
  int age;
  family? younger;
  family? older;

  family(this.age);
}

class familytree{

  family?root;

  void insert(int age){
    root = idcard(root,age);
  }

  family idcard(family?person, int age){

    if(person==null){
      return family(age);
    }

    if(age<person.age){
      person.younger=idcard(person.younger, age);
    }else if(age>person.age){
      person.older=idcard(person.older, age);
    }
    return person;


  }

  void printvalidate(){
    // first njn  validate chaithu  grndpa ondo enn;
    
    printid(root);
    
  }

  void printid(family?person){
    // after grandpa there next njn given taskil person ondo enn check cchain ayirunu

    if(person!=null){
      // person ondonm njn check chaithu

      // ath kaznjitt each person villich 
      printid(person.younger);
      // ie first younger villich 
      print(person.age);
      // age vech comapre chaith
      printid(person.older);
      // next older villich 
      // igna njn thnna task complete aki
      
    }
    
  }
family?findperson(int searchage){
  return police(root,searchage);
}

family?police(family?person,int searchage){

  if(person==null){
    return null;
  }
  if(person.age==searchage){
    return person;
  }
  if(searchage<person.age){

    return police(person.younger,searchage);

  }else{
    return police(person.older,searchage);
  }
}

}


void main(){
// at last x enn prnja officer ee collect chaitha family tree data okke insert chaith 
  var x = familytree();

  x.insert(50);

  x.insert(20);
  x.insert(60);
  x.insert(30);
  x.insert(70);

  print("searching family member");
  var found=x.findperson(30);

  if(found!=null){
    print("crimal is founded, and his age is ${found.age}");
  }else{
    print("not founded");
  }
}