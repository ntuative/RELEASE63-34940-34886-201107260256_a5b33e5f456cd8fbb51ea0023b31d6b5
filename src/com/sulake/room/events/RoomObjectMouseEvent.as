package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_178:String = "ROE_MOUSE_CLICK";
      
      public static const const_188:String = "ROE_MOUSE_ENTER";
      
      public static const const_556:String = "ROE_MOUSE_MOVE";
      
      public static const const_196:String = "ROE_MOUSE_LEAVE";
      
      public static const const_2320:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_538:String = "ROE_MOUSE_DOWN";
       
      
      private var var_2180:String = "";
      
      private var var_2324:Boolean;
      
      private var var_2323:Boolean;
      
      private var var_2330:Boolean;
      
      private var var_2327:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_2180 = param2;
         this.var_2324 = param5;
         this.var_2323 = param6;
         this.var_2330 = param7;
         this.var_2327 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_2180;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2324;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2323;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2330;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2327;
      }
   }
}
