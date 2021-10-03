package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2498:int;
      
      private var var_1478:String;
      
      private var var_2643:int;
      
      private var var_2640:int;
      
      private var _category:int;
      
      private var var_2263:String;
      
      private var var_1553:int;
      
      private var var_2638:int;
      
      private var var_2639:int;
      
      private var var_2644:int;
      
      private var var_2642:int;
      
      private var var_2641:Boolean;
      
      private var var_3129:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2498 = param1;
         this.var_1478 = param2;
         this.var_2643 = param3;
         this.var_2640 = param4;
         this._category = param5;
         this.var_2263 = param6;
         this.var_1553 = param7;
         this.var_2638 = param8;
         this.var_2639 = param9;
         this.var_2644 = param10;
         this.var_2642 = param11;
         this.var_2641 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2498;
      }
      
      public function get itemType() : String
      {
         return this.var_1478;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2643;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2640;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2263;
      }
      
      public function get extra() : int
      {
         return this.var_1553;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2638;
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
      
      public function get groupable() : Boolean
      {
         return this.var_2641;
      }
      
      public function get songID() : int
      {
         return this.var_1553;
      }
   }
}
