package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_2110:int;
      
      private var var_2884:int;
      
      private var var_1610:int;
      
      private var var_2660:int;
      
      private var var_127:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2110 = param1.readInteger();
         this.var_2884 = param1.readInteger();
         this.var_1610 = param1.readInteger();
         this.var_2660 = param1.readInteger();
         this.var_127 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_2110);
      }
      
      public function get callId() : int
      {
         return this.var_2110;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2884;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1610;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2660;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_127;
      }
   }
}
