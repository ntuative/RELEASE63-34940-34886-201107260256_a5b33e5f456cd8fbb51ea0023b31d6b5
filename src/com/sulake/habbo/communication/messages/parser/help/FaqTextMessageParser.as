package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FaqTextMessageParser implements IMessageParser
   {
       
      
      private var var_2061:int;
      
      private var var_2060:String;
      
      public function FaqTextMessageParser()
      {
         super();
      }
      
      public function get questionId() : int
      {
         return this.var_2061;
      }
      
      public function get answerText() : String
      {
         return this.var_2060;
      }
      
      public function flush() : Boolean
      {
         this.var_2061 = -1;
         this.var_2060 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2061 = param1.readInteger();
         this.var_2060 = param1.readString();
         return true;
      }
   }
}
