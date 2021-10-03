package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_838:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_678:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_838);
         this.var_678 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_678;
      }
   }
}
