package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class WelcomeGiftStatusParser implements IMessageParser
   {
       
      
      private var var_1600:String;
      
      private var var_1308:Boolean;
      
      private var var_2611:Boolean;
      
      private var _furniId:int;
      
      private var var_2382:Boolean;
      
      public function WelcomeGiftStatusParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1600 = param1.readString();
         this.var_1308 = param1.readBoolean();
         this.var_2611 = param1.readBoolean();
         this._furniId = param1.readInteger();
         this.var_2382 = param1.readBoolean();
         return true;
      }
      
      public function get requestedByUser() : Boolean
      {
         return this.var_2382;
      }
      
      public function get email() : String
      {
         return this.var_1600;
      }
      
      public function get isVerified() : Boolean
      {
         return this.var_1308;
      }
      
      public function get allowChange() : Boolean
      {
         return this.var_2611;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
   }
}
