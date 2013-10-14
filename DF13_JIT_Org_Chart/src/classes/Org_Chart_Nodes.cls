public Class Org_Chart_Nodes{


public Org_Chart_Nodes(){}

@RemoteAction
public static List<Node> getNodeList(){
 
  List<Org_Chart_Node__c> nodes = [ select id, name, skills__c, position__c, reports_to__c, Color__c, Shape__c, Line_Color__c,
           (select id, name, Line_Color__c from Org_Chart_Nodes__r)
            from Org_Chart_Node__c];
    
  List<node> nodelist = new List<node>();        
  for(Org_Chart_Node__c n:nodes){
    node nd = new node();
    nd.id = n.id;
    nd.data = n;
    nd.name = n.name;
    for(Org_Chart_Node__c ocn:n.Org_Chart_Nodes__r)
    {
      Adjacency adj = new Adjacency();
      adj.nodeTo = ocn.id;
      adj.nodeFrom = n.id;
      adj.LineColor = ocn.Line_Color__c;
      nd.Adjacencies.add(adj);
    }
    nodelist.add(nd);
  }
  return nodeList;
}




}