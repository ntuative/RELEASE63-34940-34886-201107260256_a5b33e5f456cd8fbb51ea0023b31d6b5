package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_2565:String;
      
      private var var_2888:String;
      
      private var var_490:BitmapDataAsset;
      
      private var var_1574:Boolean;
      
      private var var_1575:Boolean;
      
      private var var_2889:Boolean;
      
      private var _offsetX:int;
      
      private var var_1283:int;
      
      private var var_222:int;
      
      private var _height:int;
      
      private var var_850:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_2565 = param1;
         this.var_2888 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_490 = _loc9_;
            this.var_850 = false;
         }
         else
         {
            this.var_490 = null;
            this.var_850 = true;
         }
         this.var_1574 = param4;
         this.var_1575 = param5;
         this._offsetX = param6;
         this.var_1283 = param7;
         this.var_2889 = param8;
      }
      
      public function dispose() : void
      {
         this.var_490 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_850 && this.var_490 != null)
         {
            _loc1_ = this.var_490.content as BitmapData;
            if(_loc1_ != null)
            {
               this.var_222 = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_850 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1575;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1574;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this.var_222;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_2565;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2888;
      }
      
      public function get asset() : IAsset
      {
         return this.var_490;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2889;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1574)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1575)
         {
            return this.var_1283;
         }
         return -(this.height + this.var_1283);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1283;
      }
   }
}
