package com.sulake.habbo.communication.messages.outgoing.catalog
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class SelectClubGiftComposer implements IMessageComposer
   {
       
      
      private var var_2011:String;
      
      public function SelectClubGiftComposer(param1:String)
      {
         super();
         this.var_2011 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2011];
      }
      
      public function dispose() : void
      {
         this.var_2011 = null;
      }
   }
}
