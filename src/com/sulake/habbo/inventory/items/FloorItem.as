package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_2263:String;
      
      protected var var_1553:Number;
      
      protected var var_3060:Boolean;
      
      protected var var_3059:Boolean;
      
      protected var var_2641:Boolean;
      
      protected var var_2735:Boolean;
      
      protected var var_3075:int;
      
      protected var var_2639:int;
      
      protected var var_2644:int;
      
      protected var var_2642:int;
      
      protected var var_1941:String;
      
      protected var var_1649:int;
      
      protected var var_992:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2641 = param5;
         this.var_3059 = param6;
         this.var_3060 = param7;
         this.var_2735 = param8;
         this.var_2263 = param9;
         this.var_1553 = param10;
         this.var_3075 = param11;
         this.var_2639 = param12;
         this.var_2644 = param13;
         this.var_2642 = param14;
         this.var_1941 = param15;
         this.var_1649 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_2263;
      }
      
      public function get extra() : Number
      {
         return this.var_1553;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_3060;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_3059;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2641;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2735;
      }
      
      public function get expires() : int
      {
         return this.var_3075;
      }
      
      public function get creationDay() : int
      {
         return this.var_2639;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2644;
      }
      
      public function get creationYear() : int
      {
         return this.var_2642;
      }
      
      public function get slotId() : String
      {
         return this.var_1941;
      }
      
      public function get songId() : int
      {
         return this.var_1649;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_992 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_992;
      }
   }
}
