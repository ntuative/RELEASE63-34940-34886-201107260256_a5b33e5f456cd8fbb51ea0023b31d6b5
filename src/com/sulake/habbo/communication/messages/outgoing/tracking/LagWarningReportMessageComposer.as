package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LagWarningReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_1397:int;
      
      public function LagWarningReportMessageComposer(param1:int)
      {
         super();
         this.var_1397 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1397];
      }
      
      public function dispose() : void
      {
      }
   }
}
