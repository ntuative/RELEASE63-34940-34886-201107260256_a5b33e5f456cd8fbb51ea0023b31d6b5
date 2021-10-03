package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2367:int;
      
      private var var_2543:int;
      
      private var var_2542:int;
      
      private var _dayOffsets:Array;
      
      private var var_1886:Array;
      
      private var var_1885:Array;
      
      private var var_2545:int;
      
      private var var_2544:int;
      
      public function MarketplaceItemStatsParser()
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
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2367 = param1.readInteger();
         this.var_2543 = param1.readInteger();
         this.var_2542 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1886 = [];
         this.var_1885 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1886.push(param1.readInteger());
            this.var_1885.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2544 = param1.readInteger();
         this.var_2545 = param1.readInteger();
         return true;
      }
   }
}
