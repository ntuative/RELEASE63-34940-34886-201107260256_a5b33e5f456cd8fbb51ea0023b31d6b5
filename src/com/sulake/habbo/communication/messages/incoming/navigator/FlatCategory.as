package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_2123:int;
      
      private var var_2893:String;
      
      private var var_336:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_2123 = param1.readInteger();
         this.var_2893 = param1.readString();
         this.var_336 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_2123;
      }
      
      public function get nodeName() : String
      {
         return this.var_2893;
      }
      
      public function get visible() : Boolean
      {
         return this.var_336;
      }
   }
}
