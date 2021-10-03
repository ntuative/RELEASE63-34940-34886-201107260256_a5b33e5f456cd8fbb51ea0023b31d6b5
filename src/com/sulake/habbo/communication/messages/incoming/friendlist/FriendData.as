package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_1016:int;
      
      private var var_899:Boolean;
      
      private var var_2089:Boolean;
      
      private var var_667:String;
      
      private var var_1696:int;
      
      private var var_1771:String;
      
      private var var_1773:String;
      
      private var var_1772:String;
      
      private var var_2502:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_1016 = param1.readInteger();
         this.var_899 = param1.readBoolean();
         this.var_2089 = param1.readBoolean();
         this.var_667 = param1.readString();
         this.var_1696 = param1.readInteger();
         this.var_1771 = param1.readString();
         this.var_1773 = param1.readString();
         this.var_1772 = param1.readString();
         this.var_2502 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_1016;
      }
      
      public function get online() : Boolean
      {
         return this.var_899;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_2089;
      }
      
      public function get figure() : String
      {
         return this.var_667;
      }
      
      public function get categoryId() : int
      {
         return this.var_1696;
      }
      
      public function get motto() : String
      {
         return this.var_1771;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1773;
      }
      
      public function get realName() : String
      {
         return this.var_1772;
      }
      
      public function get facebookId() : String
      {
         return this.var_2502;
      }
   }
}
