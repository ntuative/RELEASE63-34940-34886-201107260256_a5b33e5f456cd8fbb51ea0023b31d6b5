package com.sulake.habbo.avatar.pets
{
   import flash.geom.ColorTransform;
   
   public class PetColor extends PetEditorInfo implements IPetColor
   {
       
      
      private var _id:int;
      
      private var _rgb:uint;
      
      private var var_1992:uint;
      
      private var var_1993:uint;
      
      private var _b:uint;
      
      private var var_765:ColorTransform;
      
      private var var_2057:Number;
      
      private var var_2059:Number;
      
      private var var_2058:Number;
      
      private var var_2718:int;
      
      public function PetColor(param1:XML)
      {
         super(param1);
         this._id = parseInt(param1.@id);
         var _loc2_:String = param1.text();
         this._rgb = parseInt(_loc2_,16);
         this.var_1992 = this._rgb >> 16 & 255;
         this.var_1993 = this._rgb >> 8 & 255;
         this._b = this._rgb >> 0 & 255;
         this.var_2057 = this.var_1992 / 255 * 1;
         this.var_2059 = this.var_1993 / 255 * 1;
         this.var_2058 = this._b / 255 * 1;
         this.var_765 = new ColorTransform(this.var_2057,this.var_2059,this.var_2058);
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get rgb() : uint
      {
         return this._rgb;
      }
      
      public function get r() : uint
      {
         return this.var_1992;
      }
      
      public function get g() : uint
      {
         return this.var_1993;
      }
      
      public function get b() : uint
      {
         return this._b;
      }
      
      public function get colorTransform() : ColorTransform
      {
         return this.var_765;
      }
      
      public function get figurePartPaletteColorId() : int
      {
         return this.var_2718;
      }
      
      public function set figurePartPaletteColorId(param1:int) : void
      {
         this.var_2718 = param1;
      }
   }
}
