package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1200:Boolean;
      
      private var var_1199:Boolean;
      
      private var var_1476:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get method_2() : Boolean
      {
         return this.var_1200;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1199;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1476;
      }
      
      public function flush() : Boolean
      {
         this.var_1200 = false;
         this.var_1199 = false;
         this.var_1476 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1200 = param1.readBoolean();
         this.var_1199 = param1.readBoolean();
         this.var_1476 = param1.readBoolean();
         return true;
      }
   }
}
