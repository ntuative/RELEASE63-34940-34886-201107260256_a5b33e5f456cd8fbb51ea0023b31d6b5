package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LookToMessageComposer implements IMessageComposer
   {
       
      
      private var var_3046:int;
      
      private var var_3045:int;
      
      public function LookToMessageComposer(param1:int, param2:int)
      {
         super();
         this.var_3046 = param1;
         this.var_3045 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_3046,this.var_3045];
      }
      
      public function dispose() : void
      {
      }
   }
}
