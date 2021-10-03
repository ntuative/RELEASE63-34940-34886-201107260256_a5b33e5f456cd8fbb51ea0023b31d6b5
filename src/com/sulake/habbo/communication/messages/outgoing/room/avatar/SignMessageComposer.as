package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class SignMessageComposer implements IMessageComposer
   {
       
      
      private var var_3042:int;
      
      public function SignMessageComposer(param1:int)
      {
         super();
         this.var_3042 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_3042];
      }
      
      public function dispose() : void
      {
      }
   }
}
