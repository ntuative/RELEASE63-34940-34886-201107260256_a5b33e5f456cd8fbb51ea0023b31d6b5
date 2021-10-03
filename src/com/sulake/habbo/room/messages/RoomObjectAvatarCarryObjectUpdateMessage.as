package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1478:int;
      
      private var var_1804:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         this.var_1478 = param1;
         this.var_1804 = param2;
      }
      
      public function get itemType() : int
      {
         return this.var_1478;
      }
      
      public function get itemName() : String
      {
         return this.var_1804;
      }
   }
}
