package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_125:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_2072:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_125);
         this.var_2072 = param1;
      }
      
      public function get vote() : int
      {
         return this.var_2072;
      }
   }
}
