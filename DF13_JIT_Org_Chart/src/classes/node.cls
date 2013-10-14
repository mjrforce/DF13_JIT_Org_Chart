public class node{

public List<Adjacency> adjacencies{get; set;}
public string id{Get; set;}
public string name{get; set;}
public Org_Chart_Node__c data{Get; set;}

public node(){
  Adjacencies = new List<Adjacency>();
}
}