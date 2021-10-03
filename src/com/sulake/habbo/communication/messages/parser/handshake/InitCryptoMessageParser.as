package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class InitCryptoMessageParser implements IMessageParser
   {
       
      
      protected var var_3117:Boolean;
      
      protected var var_3078:Boolean;
      
      protected var var_1542:String;
      
      public function InitCryptoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1542 = param1.readString();
         var _loc2_:int = param1.readInteger();
         this.var_3078 = _loc2_ > 0 ? true : false;
         return true;
      }
      
      public function get token() : String
      {
         return this.var_1542;
      }
      
      public function get isServerEncrypted() : Boolean
      {
         return this.var_3078;
      }
      
      public function get isClientEncrypted() : Boolean
      {
         return this.var_3117;
      }
   }
}
