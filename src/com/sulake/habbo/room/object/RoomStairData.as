package com.sulake.habbo.room.object
{
   public class RoomStairData
   {
       
      
      private var var_2300:int;
      
      private var var_1737:Boolean;
      
      private var var_1738:Boolean;
      
      private var var_49:Boolean;
      
      public function RoomStairData(param1:int, param2:Boolean, param3:Boolean, param4:Boolean)
      {
         super();
         this.var_49 = param4;
         this.var_2300 = param1;
         this.var_1737 = param2;
         this.var_1738 = param3;
      }
      
      public function get stairHeight() : int
      {
         return this.var_2300;
      }
      
      public function get neighbourStairMin() : Boolean
      {
         return this.var_1737;
      }
      
      public function get neighbourStairMax() : Boolean
      {
         return this.var_1738;
      }
      
      public function get neighbourStair() : Boolean
      {
         return this.var_1737 || this.var_1738;
      }
      
      public function get border() : Boolean
      {
         return this.var_49;
      }
   }
}
