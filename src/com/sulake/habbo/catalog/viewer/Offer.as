package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1813:String = "pricing_model_unknown";
      
      public static const const_446:String = "pricing_model_single";
      
      public static const const_436:String = "pricing_model_multi";
      
      public static const const_496:String = "pricing_model_bundle";
      
      public static const const_1865:String = "price_type_none";
      
      public static const const_823:String = "price_type_credits";
      
      public static const const_1293:String = "price_type_activitypoints";
      
      public static const const_1183:String = "price_type_credits_and_activitypoints";
       
      
      private var var_844:String;
      
      private var var_1285:String;
      
      private var var_1260:int;
      
      private var var_1998:String;
      
      private var var_1284:int;
      
      private var var_1286:int;
      
      private var var_1997:int;
      
      private var var_247:ICatalogPage;
      
      private var var_676:IProductContainer;
      
      private var _disposed:Boolean = false;
      
      private var var_1931:int = 0;
      
      private var var_2721:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:Array, param8:ICatalogPage)
      {
         super();
         this.var_1260 = param1;
         this.var_1998 = param2;
         this.var_1284 = param3;
         this.var_1286 = param4;
         this.var_1997 = param5;
         this.var_247 = param8;
         this.var_1931 = param6;
         this.analyzePricingModel(param7);
         this.analyzePriceType();
         this.createProductContainer(param7);
      }
      
      public function get clubLevel() : int
      {
         return this.var_1931;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_247;
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
      
      public function get activityPointType() : int
      {
         return this.var_1997;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_676;
      }
      
      public function get pricingModel() : String
      {
         return this.var_844;
      }
      
      public function get priceType() : String
      {
         return this.var_1285;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2721;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2721 = param1;
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1260 = 0;
         this.var_1998 = "";
         this.var_1284 = 0;
         this.var_1286 = 0;
         this.var_1997 = 0;
         this.var_247 = null;
         if(this.var_676 != null)
         {
            this.var_676.dispose();
            this.var_676 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_844)
         {
            case const_446:
               this.var_676 = new SingleProductContainer(this,param1);
               break;
            case const_436:
               this.var_676 = new MultiProductContainer(this,param1);
               break;
            case const_496:
               this.var_676 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_844);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_844 = const_446;
            }
            else
            {
               this.var_844 = const_436;
            }
         }
         else if(param1.length > 1)
         {
            this.var_844 = const_496;
         }
         else
         {
            this.var_844 = const_1813;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1284 > 0 && this.var_1286 > 0)
         {
            this.var_1285 = const_1183;
         }
         else if(this.var_1284 > 0)
         {
            this.var_1285 = const_823;
         }
         else if(this.var_1286 > 0)
         {
            this.var_1285 = const_1293;
         }
         else
         {
            this.var_1285 = const_1865;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_247.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_676.products)
         {
            _loc4_ = this.var_247.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,this.clubLevel,_loc1_,this.page);
      }
   }
}
