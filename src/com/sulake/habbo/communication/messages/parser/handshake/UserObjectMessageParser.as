package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_667:String;
      
      private var var_987:String;
      
      private var var_2550:String;
      
      private var var_1772:String;
      
      private var var_2552:int;
      
      private var var_2549:int;
      
      private var var_1252:int;
      
      private var _petRespectLeft:int;
      
      private var var_2551:Boolean;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_667 = param1.readString();
         this.var_987 = param1.readString();
         this.var_2550 = param1.readString();
         this.var_1772 = param1.readString();
         this.var_2552 = param1.readInteger();
         this.var_2549 = param1.readInteger();
         this.var_1252 = param1.readInteger();
         this._petRespectLeft = param1.readInteger();
         this.var_2551 = param1.readBoolean();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_667;
      }
      
      public function get sex() : String
      {
         return this.var_987;
      }
      
      public function get customData() : String
      {
         return this.var_2550;
      }
      
      public function get realName() : String
      {
         return this.var_1772;
      }
      
      public function get directMail() : int
      {
         return this.var_2552;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2549;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1252;
      }
      
      public function get petRespectLeft() : int
      {
         return this._petRespectLeft;
      }
      
      public function get streamPublishingAllowed() : Boolean
      {
         return this.var_2551;
      }
   }
}
