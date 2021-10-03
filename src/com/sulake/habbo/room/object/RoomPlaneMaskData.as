package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2415:Number = 0.0;
      
      private var var_2414:Number = 0.0;
      
      private var var_2513:Number = 0.0;
      
      private var var_2512:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2415 = param1;
         this.var_2414 = param2;
         this.var_2513 = param3;
         this.var_2512 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2415;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2414;
      }
      
      public function get method_1() : Number
      {
         return this.var_2513;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2512;
      }
   }
}
