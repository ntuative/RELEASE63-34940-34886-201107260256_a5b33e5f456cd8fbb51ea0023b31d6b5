package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2489:int;
      
      private var var_1478:String;
      
      private var _objId:int;
      
      private var var_2010:int;
      
      private var _category:int;
      
      private var var_2263:String;
      
      private var var_2859:Boolean;
      
      private var var_2861:Boolean;
      
      private var var_2860:Boolean;
      
      private var var_2435:Boolean;
      
      private var var_2404:int;
      
      private var var_1553:int;
      
      private var var_1941:String = "";
      
      private var var_1649:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2489 = param1;
         this.var_1478 = param2;
         this._objId = param3;
         this.var_2010 = param4;
         this._category = param5;
         this.var_2263 = param6;
         this.var_2859 = param7;
         this.var_2861 = param8;
         this.var_2860 = param9;
         this.var_2435 = param10;
         this.var_2404 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1941 = param1;
         this.var_1553 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2489;
      }
      
      public function get itemType() : String
      {
         return this.var_1478;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_2010;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2263;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2859;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2861;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2860;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2435;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2404;
      }
      
      public function get slotId() : String
      {
         return this.var_1941;
      }
      
      public function get songId() : int
      {
         return this.var_1649;
      }
      
      public function get extra() : int
      {
         return this.var_1553;
      }
   }
}
