RSRC                 	   Resource            ≥ЭFШТе 
   GraphData                                                   resource_local_to_scene    resource_name    script    name    offset    size    text    speaker_name    options    scroll_offset    connections    nodes 
   variables       Script D   res://addons/popochiu/editor/dialogue_graph/save_load/graph_data.gd €€€€€€€€   Script I   res://addons/popochiu/editor/dialogue_graph/save_load/start_node_data.gd €€€€€€€€   Script H   res://addons/popochiu/editor/dialogue_graph/save_load/call_node_data.gd €€€€€€€€   Script L   res://addons/popochiu/editor/dialogue_graph/save_load/dialogue_node_data.gd €€€€€€€€      local://Resource_tw0vv Ъ         local://Resource_87hs5 с         local://Resource_owp4p p         local://Resource_l0lf7 (      P   res://game/dialogs/pool_mac_harlow_first/dialog_pool_mac_harlow_first_graph.res р      	   Resource                      
   StartNode    
     аB  ТC   
           	   Resource                         await harlow_look_for_sign()       	   CallNode    
    @,D АРC   
     dC  аB	   Resource                      
   MainNaked                          Wait sign?    
   Sure did!                 DialogueNode1    
     ҐC  gC   
     ЦC  pC	   Resource                         Harlow       9   Well, I dont know what you need a sign for, any damn way                          DialogueNode2    
     xD АЛC   
     ЦC  pC	   Resource          '   dialog_pool_mac_harlow_first_graph.res              	   
           
                  
   from_node ,   
   StartNode    
   from_port              to_node ,      DialogueNode1       to_port                 
   from_node ,      DialogueNode1    
   from_port              to_node ,   	   CallNode       to_port                 
   from_node ,   	   CallNode    
   from_port              to_node ,      DialogueNode2       to_port                                                                RSRC