
class Node{
  int data;
  Node? next;
  Node(this.data);
}

Node? delete(Node? head, int index){
//   It takes two inputs:

// head: The start of our list (which might be null).
// index: The position of the node we want to delete.

  if(head==null) return null;
  // If the list is empty, we can't delete anything, so we return null.
  if(index == 0)return head.next;

  // If we're trying to delete the first node (index 0), we just return the second value .
  // ie nml eth value ano return chaiunth aa value thott vaki list print akm 
  // ivide ipol nml first index delete akunna case ayond ann head matrm ayi return chaitheth.
  // if first index user choose chaithile nml dow return head chaiunn ond , head mean first index value
  // so avide thott list print akm expect deleted one 

  Node current = head;
  int currentindex=0;

  // consider current as a ticket checker who checking each lobby 
  // and currentindex is a staff that stand in entrance of each lobby of train
  // if one lobby want to avoid this satff in front of the entrance of lobby say to current

  while(current.next!=null && currentindex < index-1 ){
    current = current.next!;
    // it is same like i++, saying current to move forward
    currentindex++;
    // it is also i++ to tell satff to go and check another lobby and inform is it needed to be check
    
    // this is same as for loop itreatiion 
    // ie, current next value null allatha vre casil loop pokond erikm 
    // until  epoz anno staff stop chain pryunth avide ethumbol ticket checker 
    // stop ayi ee loop purth pokm
  }
  if(current.next!=null){
    current.next=current.next!.next;

    // loopin purth aya ticket checker ,ie ee next lobby venda enna arinj platform erngiya ticket checker
    // train edukmbol vedum athin apuram olla lobby keri job continue chaium

  }
  return head;
  // if first lobby avoid chain prnjillgil , nnmk first lobby return chaithitt
  // athott olla vakki lobby(ie data) print chaim expect the avoided lobby
}

void printl(Node?head){
  var current = head;

  while(current!=null){
    // while ticket checker trainl ondgil
    print(current.data);

    // ticket checker data collect chaiuka, head kodth data

    current =current.next;
    // along with each lobby poi check chaitha data
  }

}

Node? create(List<int>x){

  if(x.isEmpty){
    return null;
  }

  Node head = Node(x[0]);
  Node current = head;

  for(int i=1; i<x.length; i++){
    current.next=Node(x[i]);
    current =current.next!;
  }
  return head;
}

void main(){
  var num= List.generate(5, (index) => index+1,);
  var head = create(num);

  print("orginal list");
  printl(head);
  print("list after removing random index ");
  head = delete(head, 2);
  printl(head);
}