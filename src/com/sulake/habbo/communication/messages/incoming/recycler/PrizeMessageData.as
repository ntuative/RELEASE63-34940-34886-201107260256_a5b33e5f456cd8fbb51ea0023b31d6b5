package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeMessageData
   {
       
      
      private var var_2807:String;
      
      private var var_2186:int;
      
      public function PrizeMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2807 = param1.readString();
         this.var_2186 = param1.readInteger();
      }
      
      public function get productItemType() : String
      {
         return this.var_2807;
      }
      
      public function get productItemTypeId() : int
      {
         return this.var_2186;
      }
   }
}
