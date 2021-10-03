package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_741:String = "RWFUAM_ROTATE";
      
      public static const const_315:String = "RWFAM_MOVE";
      
      public static const const_782:String = "RWFAM_PICKUP";
      
      public static const const_883:String = "RWFAM_USE";
      
      public static const const_1026:String = "RWFAM_OPEN_WELCOME_GIFT";
      
      public static const const_1369:String = "RWFAM_SAVE_STUFF_DATA";
       
      
      private var _furniId:int = 0;
      
      private var var_2500:int = 0;
      
      private var var_2501:String;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int, param4:String = null)
      {
         super(param1);
         this._furniId = param2;
         this.var_2500 = param3;
         this.var_2501 = param4;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniCategory() : int
      {
         return this.var_2500;
      }
      
      public function get objectData() : String
      {
         return this.var_2501;
      }
   }
}
