public Class Org_Chart{

public List<Org_Node> roots{Get; set;}


public Org_Chart(){

  roots = new List<Org_Node>();
  Map<Id, List<Org_Chart_Node__c>> nodemap = new Map<Id, List<Org_Chart_Node__c>>(); 
  for(Org_Chart_Node__c r:[select id, name, skills__c, position__c, reports_to__c from Org_Chart_Node__c])
  {
        if(nodemap.containskey(r.Reports_To__c) == false)
        {
            nodemap.put(r.Reports_To__c, new list<Org_Chart_Node__c>{r});
        }
        else
        {
            nodemap.get(r.Reports_To__c).add(r);
        }
  }
  for(Org_Chart_Node__c n:nodemap.get(null))
    roots.add(traverseTree(new Org_Node(n), nodemap));
  system.debug('roots: ' + roots);

}

public Org_Node traverseTree(Org_Node n, Map<Id, List<Org_Chart_Node__c>> allnodes){
  
  if(allnodes.containskey(n.parent.Id))
    for(Org_Chart_Node__c child:allnodes.get(n.parent.id))
      n.children.add(traversetree(new Org_Node(child), allnodes));

  return n;
}

public class Org_Node{

  public Org_Chart_Node__c parent{get; set;}
  public list<Org_Node> children{get; set;}
  
  public Org_Node(Org_Chart_Node__c p){
    parent = p;
    children = new List<Org_Node>();
  }

}
}