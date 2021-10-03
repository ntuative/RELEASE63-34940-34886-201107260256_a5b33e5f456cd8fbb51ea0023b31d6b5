package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2367:int;
      
      private var var_2543:int;
      
      private var var_2542:int;
      
      private var _dayOffsets:Array;
      
      private var var_1886:Array;
      
      private var var_1885:Array;
      
      private var var_2545:int;
      
      private var var_2544:int;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2367;
      }
      
      public function get offerCount() : int
      {
         return this.var_2543;
      }
      
      public function get historyLength() : int
      {
         return this.var_2542;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1886;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1885;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2545;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2544;
      }
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2367 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2543 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2542 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1886 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1885 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2545 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2544 = param1;
      }
   }
}
