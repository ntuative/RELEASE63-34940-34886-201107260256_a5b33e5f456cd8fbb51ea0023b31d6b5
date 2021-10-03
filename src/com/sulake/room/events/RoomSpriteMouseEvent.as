package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_2180:String = "";
      
      private var var_2095:String = "";
      
      private var var_2328:String = "";
      
      private var var_2325:Number = 0;
      
      private var var_2329:Number = 0;
      
      private var var_2331:Number = 0;
      
      private var var_2326:Number = 0;
      
      private var var_2323:Boolean = false;
      
      private var var_2324:Boolean = false;
      
      private var var_2330:Boolean = false;
      
      private var var_2327:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_2180 = param2;
         this.var_2095 = param3;
         this.var_2328 = param4;
         this.var_2325 = param5;
         this.var_2329 = param6;
         this.var_2331 = param7;
         this.var_2326 = param8;
         this.var_2323 = param9;
         this.var_2324 = param10;
         this.var_2330 = param11;
         this.var_2327 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_2180;
      }
      
      public function get canvasId() : String
      {
         return this.var_2095;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2328;
      }
      
      public function get screenX() : Number
      {
         return this.var_2325;
      }
      
      public function get screenY() : Number
      {
         return this.var_2329;
      }
      
      public function get localX() : Number
      {
         return this.var_2331;
      }
      
      public function get localY() : Number
      {
         return this.var_2326;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2323;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2324;
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
