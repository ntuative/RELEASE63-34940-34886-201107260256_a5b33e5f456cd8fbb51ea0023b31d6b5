package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_1260:int;
      
      private var var_1998:String;
      
      private var var_1284:int;
      
      private var var_1286:int;
      
      private var var_1997:int;
      
      private var var_1931:int;
      
      private var var_1197:Array;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1260 = param1.readInteger();
         this.var_1998 = param1.readString();
         this.var_1284 = param1.readInteger();
         this.var_1286 = param1.readInteger();
         this.var_1997 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1197 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1197.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
         this.var_1931 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1260;
      }
      
      public function get localizationId() : String
      {
         return this.var_1998;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1284;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1286;
      }
      
      public function get products() : Array
      {
         return this.var_1197;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1997;
      }
      
      public function get clubLevel() : int
      {
         return this.var_1931;
      }
   }
}
