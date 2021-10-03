package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_667:String;
      
      private var var_2743:String;
      
      private var var_1016:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_667 = param1;
         this.var_1016 = param2;
         this.var_2743 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_667;
      }
      
      public function get race() : String
      {
         return this.var_2743;
      }
      
      public function get gender() : String
      {
         return this.var_1016;
      }
   }
}
