package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage
   {
      
      public static const const_746:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";
       
      
      private var var_1665:int = 0;
      
      public function RoomWidgetGetBadgeDetailsMessage(param1:int)
      {
         super(const_746);
         this.var_1665 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1665;
      }
   }
}
