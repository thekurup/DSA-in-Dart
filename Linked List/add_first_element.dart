class Node{
  int data;
  Node? next;
  Node(this.data);
}

Node? add(Node?head,value){
  if(head ==null){
    return Node(value);
  } 

  Node newnode=Node(value);
  newnode.next=head;
  return newnode;
}

void printl(Node?head){
  Node? current = head;

  while(current!=null){
    print(current.data);
    current=current.next;
  }
}

Node? create(List<int>x){
  if(x.isEmpty){
    return null;
  }
  Node head=Node(x[0]);

  Node current=head;

  for(int i=1;i<x.length;i++){
    current.next=Node(x[i]);
    current = current.next!;
  }
  return head;
}

void main(){
  var number=List.generate(5, (index) => index+1,);
  var head=create(number);

  print("orginal");

  printl(head);

  print("edited");
  head=add(head, 0);

  printl(head);
}