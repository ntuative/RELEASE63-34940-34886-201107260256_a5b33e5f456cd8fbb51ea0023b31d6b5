package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1327:int;
      
      private var var_2458:String;
      
      private var var_2459:int;
      
      private var var_2457:String;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1327 = param1.readInteger();
         this.var_2458 = param1.readString();
         this.var_2457 = param1.readString();
         this.var_2459 = this.var_1327;
      }
      
      public function get requestId() : int
      {
         return this.var_1327;
      }
      
      public function get requesterName() : String
      {
         return this.var_2458;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2459;
      }
      
      public function get figureString() : String
      {
         return this.var_2457;
      }
   }
}
