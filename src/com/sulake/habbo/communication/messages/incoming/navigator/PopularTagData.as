package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PopularTagData
   {
       
      
      private var var_2397:String;
      
      private var var_2396:int;
      
      public function PopularTagData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2397 = param1.readString();
         this.var_2396 = param1.readInteger();
      }
      
      public function get tagName() : String
      {
         return this.var_2397;
      }
      
      public function get userCount() : int
      {
         return this.var_2396;
      }
   }
}
