package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2703:int;
      
      private var var_2706:int;
      
      private var var_2704:int;
      
      private var var_2705:String;
      
      private var var_2066:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2703 = param1.readInteger();
         this.var_2706 = param1.readInteger();
         this.var_2704 = param1.readInteger();
         this.var_2705 = param1.readString();
         this.var_2066 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2703;
      }
      
      public function get minute() : int
      {
         return this.var_2706;
      }
      
      public function get chatterId() : int
      {
         return this.var_2704;
      }
      
      public function get chatterName() : String
      {
         return this.var_2705;
      }
      
      public function get msg() : String
      {
         return this.var_2066;
      }
   }
}
