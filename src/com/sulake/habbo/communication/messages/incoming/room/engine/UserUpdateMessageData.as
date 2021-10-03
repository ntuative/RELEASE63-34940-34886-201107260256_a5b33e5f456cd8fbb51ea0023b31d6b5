package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_175:Number = 0;
      
      private var var_174:Number = 0;
      
      private var var_2762:Number = 0;
      
      private var var_2759:Number = 0;
      
      private var var_2761:Number = 0;
      
      private var var_2760:Number = 0;
      
      private var var_500:int = 0;
      
      private var var_2303:int = 0;
      
      private var var_362:Array;
      
      private var var_2763:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_362 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_175 = param3;
         this.var_174 = param4;
         this.var_2762 = param5;
         this.var_500 = param6;
         this.var_2303 = param7;
         this.var_2759 = param8;
         this.var_2761 = param9;
         this.var_2760 = param10;
         this.var_2763 = param11;
         this.var_362 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_175;
      }
      
      public function get z() : Number
      {
         return this.var_174;
      }
      
      public function get localZ() : Number
      {
         return this.var_2762;
      }
      
      public function get targetX() : Number
      {
         return this.var_2759;
      }
      
      public function get targetY() : Number
      {
         return this.var_2761;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2760;
      }
      
      public function get dir() : int
      {
         return this.var_500;
      }
      
      public function get dirHead() : int
      {
         return this.var_2303;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2763;
      }
      
      public function get actions() : Array
      {
         return this.var_362.slice();
      }
   }
}
