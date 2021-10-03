package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_2015:int;
      
      private var var_2358:String;
      
      private var var_1242:int;
      
      private var var_1379:int;
      
      private var var_1900:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2015 = param1.readInteger();
         this.var_2358 = param1.readString();
         this.var_1242 = param1.readInteger();
         this.var_1379 = param1.readInteger();
         this.var_1900 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_2015;
      }
      
      public function get petName() : String
      {
         return this.var_2358;
      }
      
      public function get level() : int
      {
         return this.var_1242;
      }
      
      public function get petType() : int
      {
         return this.var_1379;
      }
      
      public function get breed() : int
      {
         return this.var_1900;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
