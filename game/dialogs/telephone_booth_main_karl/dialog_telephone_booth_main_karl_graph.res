RSRC                 	   Resource            �ef�[	
   GraphData                                                   resource_local_to_scene    resource_name    script    speaker_name    text    options    name    offset    size    scroll_offset    connections    nodes 
   variables       Script D   res://addons/popochiu/editor/dialogue_graph/save_load/graph_data.gd ��������   Script L   res://addons/popochiu/editor/dialogue_graph/save_load/dialogue_node_data.gd ��������   Script H   res://addons/popochiu/editor/dialogue_graph/save_load/call_node_data.gd ��������   Script I   res://addons/popochiu/editor/dialogue_graph/save_load/start_node_data.gd ��������      local://Resource_f8uuk          local://Resource_k4yvn �         local://Resource_jel7q �         local://Resource_b2i1a S         local://Resource_qccfy �         local://Resource_c7nm3 �	         local://Resource_sed2m /
         local://Resource_b6uw1 �
         local://Resource_elwml          local://Resource_ofqs1 �         local://Resource_sfqlx ,         local://Resource_843fd �         local://Resource_o2eta          local://Resource_udonc �         local://Resource_5qe56 �         local://Resource_oqn4l d         local://Resource_t3kw5 �         local://Resource_82v8j �         local://Resource_ks1lr �         local://Resource_at2h1 1         local://Resource_bdc3v �         local://Resource_yuuyk 
      X   res://game/dialogs/telephone_booth_main_karl/dialog_telephone_booth_main_karl_graph.res �      	   Resource                      
   MainBooth       Q   Y'all had two goddamn days to find this asshole and you don't have jack or shit                           DialogueNode4    
    `�D ��C   
     �C pC	   Resource                      
   MainBooth       +   So you'll pardon my lack of patience, Karl                          DialogueNode5    
    ��D  �C   
    �C  pC	   Resource                      
   MainBooth       	   No, Karl                          DialogueNode8    
   Q�SE�G�B   
    �C pC	   Resource                      
   MainBooth          No, no, no, no.                          DialogueNode3    
     WD  rC   
     �C pC	   Resource                      
   MainBooth       7   No, you don't worry about where the hell are we, okay?                          DialogueNode10    
   >��Eգ]B   
    �C pC	   Resource                         show_frame(1)       	   CallNode    
   ڛ�D̬�C   
     dC �B	   Resource                         show_frame(0)          _GraphNode_58348    
   ��E�,�C   
     dC���B	   Resource                         show_frame(1)          _GraphNode_27378    
   
�DE�hC   
    dC �B	   Resource                         show_frame(0)          _GraphNode_27386    
   Q�gE� C   
     dC���B	   Resource                      
   MainBooth          No                          DialogueNode2    
   �{C�EoC   
     �C pC	   Resource                         show_frame(0)          _GraphNode_26635    
   �Dw��C   
     dC �B	   Resource                         show_frame(2)          _GraphNode_54159    
   �ĀA��C   
     dC���B	   Resource                         play_coin_sound()          _GraphNode_23848    
   ���E��C   
     dC���B	   Resource                      
   MainBooth       Z   Yeah kind of hard for her to get the license and registration from inside the trunk, Karl             #   [Insert coin to continue the call]    
   [Hang up]                 DialogueNode1    
   ��!�5]D   
     �C {C	   Resource                      
   MainBooth          No, no, no, Karl                          DialogueNode7    
   �0E  C   
     �C pC	   Resource                      
   MainBooth          No                          DialogueNode6    
   �E��PC   
    �C	 pC	   Resource                      
   MainBooth       <   Why don't we just send a postcard while we're at it, right?                          DialogueNode9    
   Rt{E�G�B   
     �C pC	   Resource                      
   MainBooth       M   You just worry about finding this shitbag so I can take my goddamn wife home             
   [Hang up]                 DialogueNode11    
   =L�EգUB   
     �C  pC	   Resource                         show_frame(3)          _GraphNode_28191    
   ��E���C   
     dC���B	   Resource                         play_hang_phone_sound()          _GraphNode_20649    
   ���E>��C   
     dC �B	   Resource                      
   StartNode    
   �_�V�D   
           	   Resource                         transition_to_next_room()          _GraphNode_48468    
   ���Em�C   
     dC���B	   Resource          +   dialog_telephone_booth_main_karl_graph.res              	   
   vYmEPs��
                  
   from_node ,      DialogueNode4    
   from_port              to_node ,      DialogueNode5       to_port                 
   from_node ,      DialogueNode6    
   from_port              to_node ,      DialogueNode7       to_port                 
   from_node ,      DialogueNode9    
   from_port              to_node ,      DialogueNode10       to_port                 
   from_node ,      DialogueNode10    
   from_port              to_node ,      DialogueNode11       to_port                 
   from_node ,      DialogueNode3    
   from_port              to_node ,   	   CallNode       to_port                 
   from_node ,   	   CallNode    
   from_port              to_node ,      DialogueNode4       to_port                 
   from_node ,   
   StartNode    
   from_port              to_node ,      DialogueNode1       to_port                 
   from_node ,      _GraphNode_54159    
   from_port              to_node ,      DialogueNode2       to_port                 
   from_node ,      DialogueNode2    
   from_port              to_node ,      _GraphNode_26635       to_port                 
   from_node ,      _GraphNode_26635    
   from_port              to_node ,      DialogueNode3       to_port                 
   from_node ,      DialogueNode5    
   from_port              to_node ,      _GraphNode_58348       to_port                 
   from_node ,      _GraphNode_58348    
   from_port              to_node ,      DialogueNode6       to_port                 
   from_node ,      DialogueNode8    
   from_port              to_node ,      _GraphNode_27386       to_port                 
   from_node ,      _GraphNode_27386    
   from_port              to_node ,      DialogueNode9       to_port                 
   from_node ,      DialogueNode7    
   from_port              to_node ,      _GraphNode_27378       to_port                 
   from_node ,      DialogueNode11    
   from_port              to_node ,      _GraphNode_28191       to_port                 
   from_node ,      _GraphNode_27378    
   from_port              to_node ,      DialogueNode8       to_port                 
   from_node ,      _GraphNode_28191    
   from_port              to_node ,      _GraphNode_20649       to_port                 
   from_node ,      DialogueNode1    
   from_port              to_node ,      _GraphNode_23848       to_port                 
   from_node ,      _GraphNode_23848    
   from_port              to_node ,      _GraphNode_54159       to_port                 
   from_node ,      DialogueNode1    
   from_port             to_node ,      _GraphNode_28191       to_port                 
   from_node ,      _GraphNode_20649    
   from_port              to_node ,      _GraphNode_48468       to_port                                                                                                         	         
                                                                                                                RSRC