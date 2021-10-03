package com.sulake.habbo.communication.messages.parser.inventory.badges
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class BadgeAndPointLimit
   {
       
      
      private var var_1943:String;
      
      private var var_2170:int;
      
      public function BadgeAndPointLimit(param1:String, param2:IMessageDataWrapper)
      {
         super();
         this.var_1943 = "ACH_" + param1 + param2.readInteger();
         this.var_2170 = param2.readInteger();
      }
      
      public function get badgeId() : String
      {
         return this.var_1943;
      }
      
      public function get limit() : int
      {
         return this.var_2170;
      }
   }
}
