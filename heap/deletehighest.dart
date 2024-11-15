class heap{
  List<int>x=[];

  void insert(int value){
    x.add(value);
    int currentpos = x.length-1;

    while(currentpos>0){
      int parentpos=(currentpos-1)~/2;

      if(x[parentpos]<x[currentpos]){
        int temp=x[parentpos];
        x[parentpos]=x[currentpos];
        x[currentpos]=temp;
        parentpos=currentpos;
      }else{
        break;
      }
    }

  }
  int? remove(){
    if(x.isEmpty){
      return null;
    }
    int large=x[0];
    x[0]=x.last;

    x.removeLast();

    int pos = 0;

    while(true){
      int left=2*pos+1;
      int right=2*pos+2;
      if(left>x.length){
        break;
      }
      int big=left;
      if(right<x.length && x[right]>x[left]){
        // right<x.length means nml right otta branch ie leaf right first compare
        big=right;
      }

      if(x[pos]<x[big]){
        int temp=x[pos];
        x[pos]=x[big];
        x[big]=temp;
        pos=big;
      }else{
        break;
      }
    }
    return large;
  }
  void show(){
    print(x);
  }

  

}

void main(){
  heap x=heap();

  x.insert(100);
  x.insert(80);
  x.insert(90);
  
  x.show();

  int? removed= x.remove();
  print("removed one is $removed");
  x.show();

}